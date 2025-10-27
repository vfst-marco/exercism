defmodule Newsletter do
  require Logger

  def read_emails(path) do
    case File.read(path) do
      {:ok, content} ->
        content |> String.split("\n", trim: true)

      {:error, _reason} ->
        Logger.warning("could not find #{path}, assuming empty...")
        []
    end
  end

  def open_log(path) do
    File.open!(path, [:write])
  end

  def log_sent_email(pid, email) do
    IO.write(pid, email <> "\n")
  end

  def close_log(pid) do
    File.close(pid)
  end

  def send_newsletter(emails_path, log_path, send_fun) do
    log = open_log(log_path)

    read_emails(emails_path)
    |> Enum.map(fn email ->
      case send_fun.(email) do
        :ok -> log_sent_email(log, email)
        _ -> nil
      end
    end)

    close_log(log)
  end
end
