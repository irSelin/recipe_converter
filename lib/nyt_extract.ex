defmodule NytExtract do
  @moduledoc """
  This module extracts recipe information from a New-York-Times-format HTML doc.
  """

  # ~r|<div class="title-container">(?<x>.+)</div>:first|

  @doc """
  Roughly splits HTML into a list of smaller chunks with useful info

  Param [html]: the source code for the NYT website
  Requires: [html] is a string of html source code from a NYT website

  Returns: assoc list of useful html chunks
           has keys [title]
  """
  def slim(html) do
    # div class headers that tag useful chunks of html
    section_headers = ["<div class=\"title-container\">", "<div class=\"recipe-subhead\">"]

    # no error handling for incorrect inputs
    # no error handling for lack of matches
    raw_split = String.split(html, section_headers)
    [_a, b | _] = raw_split
    %{:title => b}
  end

  @doc """
  Extracts useful information out of the smaller HTML chunks

  Param [assoc]: an association list of smaller HTML chunks (of the format
                 returned by slim)

  Returns: assoc list of useful html chunks
           has keys [title]
  """
  def slice(assoc) do
    # no error handling for lack of matches
    # no error handling for missing keys
    title = hd(Regex.run(~r|data-name=\"(?<x>.+)\"\n|, assoc.title, capture: :all_but_first))
    %{:title => title}
  end

  @doc """
  Main function for extracting information from NYT HTMLs. See module doc for
  more information.

  Param [html]: the source code for the NYT website
  Requires: [html] is a string of html source code from a NYT website

  Returns:
  """
  def nyt_extract(html) do
    slim(html) |> slice()
  end
end
