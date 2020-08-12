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
  def rough_cut(html) do
    # div class headers that tag useful chunks of html
    div0_tl = "<div class=\"secondary-controls\">"
    div1_hd = "<div class=\"title-container\">"
    div2_contents = ["<div class=\"recipe-subhead\">",
      "<div class=\"share-group share-bubbles recipe-details-share primary\">",
      "<div class=\"topnote\">",
      "<div class=\"tags-nutrition-container\">",
      "<div class=\"recipe-actions\">",
      "<div class=\"recipe-instructions\">",
      "<section class=\"recipe-steps-wrap\">"
    ]

    # no error handling for incorrect inputs
    # no error handling for lack of matches
    [hd0, _tl] = String.split(html, div0_tl)
    [_hd, tl1] = String.split(hd0, div1_hd)
    [title, subhead, _, topnote, tags, _, ingredients, steps] =
      String.split(tl1, div2_contents)

    %{:title => title,
      :recipe_subhead => subhead,
      :topnote => topnote,
      :tags => tags,
      :ingredients => ingredients,
      :steps => steps
    }
  end

  @doc """
  Extracts useful information out of the smaller HTML chunks

  Param [assoc]: an association list of smaller HTML chunks (of the format
                 returned by slim)

  Returns: assoc list of useful html chunks
           has keys [title]
  """
  def fine_trim(assoc) do
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
    rough_cut(html) |> fine_trim()
  end
end
