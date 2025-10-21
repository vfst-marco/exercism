  import Bitwise
defmodule VariableLengthQuantity do
  @doc """
  Encode integers into a bitstring of VLQ encoded bytes
  """
  @spec encode(integers :: [integer]) :: binary
  def encode(integers) do
    integers
    |> Enum.map(&encode_integer/1)
    |> IO.iodata_to_binary()
  end

  defp encode_integer(0), do: <<0>>
  defp encode_integer(n) when n > 0 do
    n
    |> split_7bits([])
    |> Enum.reverse()
    |> Enum.with_index()
    |> Enum.map(fn {byte, idx} ->
      if idx == 0, do: byte, else: byte ||| 0x80
    end)
    |> Enum.reverse()
    |> :erlang.list_to_binary()
  end

  defp split_7bits(0, acc), do: acc
  defp split_7bits(n, acc), do: split_7bits(n >>> 7, [n &&& 0x7F | acc])

  @doc """
  Decode a bitstring of VLQ encoded bytes into a series of integers
  """
  @spec decode(bytes :: binary) :: {:ok, [integer]} | {:error, String.t()}
  def decode(bytes) when is_binary(bytes) do
    do_decode(bytes, [], 0, false)
  end

  defp do_decode(<<>>, acc, 0, false), do: {:ok, Enum.reverse(acc)}
  defp do_decode(<<>>, _acc, _value, true), do: {:error, "incomplete sequence"}
  defp do_decode(<<byte, rest::binary>>, acc, value, _in_sequence) do
    continuation = (byte &&& 0x80) != 0
    chunk = byte &&& 0x7F
    value = (value <<< 7) ||| chunk
    if continuation do
      do_decode(rest, acc, value, true)
    else
      do_decode(rest, [value | acc], 0, false)
    end
  end
end
