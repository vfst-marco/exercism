defmodule PaintByNumber do
  def palette_bit_size(color_count) do
    find_bit_size(color_count, 1)
  end

  defp find_bit_size(n, size) do
    if 2 ** size >= n do
      size
    else
      find_bit_size(n, size + 1)
    end
  end

  def empty_picture() do
    <<>>
  end

  def test_picture() do
    <<0::2, 1::2, 2::2, 3::2>>
  end

  def prepend_pixel(picture, color_count, pixel_color_index) do
    size = palette_bit_size(color_count)
    <<pixel_color_index::size(size),picture::bitstring>>
  end

  def get_first_pixel(nil, _color_count), do: nil
  def get_first_pixel(<<>>, _color_count), do: nil
  def get_first_pixel(picture, color_count) do
    size = palette_bit_size(color_count)
    <<first_pixel::size(size), _rest::bitstring>> = picture
    first_pixel
  end

  def drop_first_pixel(nil, _color_count), do: <<>>
  def drop_first_pixel(<<>>, _color_count), do: <<>>
  def drop_first_pixel(picture, color_count) do
    size = palette_bit_size(color_count)
    <<_first_pixel::size(size), rest::bitstring>> = picture
    rest
  end

  def concat_pictures(picture1, picture2) do
    <<picture1::bitstring, picture2::bitstring>>
  end
end
