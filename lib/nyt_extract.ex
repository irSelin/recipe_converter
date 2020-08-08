defmodule NytExtract do
  @moduledoc """
  This module extracts recipe information from a New-York-Times-format HTML doc.
  """

  # ~r|<div class="title-container">(?<x>.+)</div>:first|

  @doc """
  Roughly splits HTML into a list of smaller chunks with useful info

  Param [html]: the source code for the NYT website
  Requires: [html] is a string of html source code from a NYT website

  Returns: assoc list of useful chunks
  """
  def slim(html) do
    # div class headers that tag useful chunks of html
    section_headers = ["<div class=\"title-container\">", "<div class=\"recipe-subhead\">"]

    raw_split = String.split(html, section_headers)
    [_a, b | _] = raw_split
    %{:title => b}

    # split by <div class =
    # pattern match on headers used near sections I want & toss the rest
    # send those to sub-functions for extracting the actual data
    # return a map of K= name atom, V= string content
  end

  @doc """
  Main function for extracting information from NYT HTMLs. See module doc for
  more information.

  Param [html]: the source code for the NYT website
  Requires: [html] is a string of html source code from a NYT website

  Returns:
  """
  def nyt_extract(html) do
    slim(html)
    raise "nyt_extract unimplemented"
  end
end
