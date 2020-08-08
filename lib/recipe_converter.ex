defmodule RecipeConverter do
  @moduledoc """
  This module takes a url for a New York Times recipe and extracts its info into
  a Companio recipe format.
  """

  @doc """
  Grabs the HTML source from [url]

  Param [url]: a string of a url

  Returns: {status, contents} where
    [status] is [:ok] if the source was successfully obtained and [:error]
    otherwise
    [contents] is a string of the source code for the website if successful, or
    an error description otherwise
  """
  def html_from_url(url) do
    case HTTPoison.get(url) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        {:ok, body}

      {:ok, %HTTPoison.Response{status_code: 404}} ->
        {:error, "Url not found"}

      {:error, _} ->
        {:error, "Problem with input url"}
    end
  end

  @doc """
  Main function for recipe conversion, to be called by user. See module doc for
  more detailled info.

  Param [url]: a string of a url
  """
  def from_nyt(url) do
    html_from_url(url)
    raise "from_nyc not implemented"
  end
end
