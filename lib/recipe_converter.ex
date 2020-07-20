defmodule RecipeConverter do
  @moduledoc """
  This module takes a url for a New York Times recipe and extracts its info into
  a Companio recipe format.
  """

  @doc """
  Grabs the HTML source from [url]

  Requires [url] is a valid url string

  Returns the html source that [url] links to
  """
  def html_from_url(url) do
    # HTTPoison.get!()
    raise "html_from_url not implemented"
  end

  @doc """
  Main function for recipe conversion, to be called by user.

  Requires

  Returns
  """
  def from_nyt(url) do
    raise "from_nyc not implemented"
  end
end
