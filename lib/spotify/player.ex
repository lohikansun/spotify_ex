defmodule Spotify.Player do

  #use Responder
  import Helpers

  alias Spotify.{Client, Album, Artist, Playlist, Track}

  def play(conn, params) do
    url = "https://api.spotify.com/v1/me/player/play "
    conn |> Client.get(url)
  end

  def pause(conn, params) do
    url = "https://api.spotify.com/v1/me/player/pause "
    conn |> Client.get(url)
  end

  def build_response(body) do
    body
      |> map_paging
  end

  defp map_paging(body), do: {Paging.response(body, []), body}

end
