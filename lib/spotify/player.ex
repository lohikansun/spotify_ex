defmodule Spotify.Player do

  use Responder
  import Helpers

  alias Spotify.{Client, Album, Artist, Playlist, Track}

  def play_url(params) do
    "https://api.spotify.com/v1/me/player/devices" <> query_string(params)
  end

  def play(conn, params) do
    url = play_url(params)
    conn |> Client.put(url) |> handle_response
  end

  def pause(conn, params) do
    url = "https://api.spotify.com/v1/me/player/pause"
    conn |> Client.put(url) |> handle_response
  end

  def build_response(body), do: body

end
