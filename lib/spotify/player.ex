require IEx
defmodule Spotify.Player do

  use Responder
  import Helpers

  alias Spotify.{Client, Album, Artist, Playlist, Track}

  def play(conn, params) do
    url = "https://api.spotify.com/v1/me/player/play"
    body = Poison.encode!(params)
    conn |> Client.put(url, body) |> handle_response
  end

  def pause(conn, params) do
    url = "https://api.spotify.com/v1/me/player/pause"
    conn |> Client.put(url) |> handle_response
  end

  def next(conn, params) do
    url = "https://api.spotify.com/v1/me/player/next"
    conn |> Client.post(url) |> handle_response
  end

  def seek(conn, params) do
    url = "https://api.spotify.com/v1/me/player/seek" <> query_string(params)
    conn |> Client.put(url) |> handle_response
  end


  def info(conn, params) do
    url = "https://api.spotify.com/v1/me/player"
    conn |> Client.get(url) |> handle_response

  end

  def build_response(body), do: body

end
