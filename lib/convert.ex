defmodule Convert do
  @moduledoc """
  This module converts recipe information into the correct text format.
  """

  @doc """
  Main function for transforming recipe info.

  Param [info]: an association list representing info taken from the recipe
  Requires: [info] has keys:
            [author, ingredients, steps, tags, time, title, topnote, yield]

  Returns: assoc list of converted recipe info
           has keys [name, inspiration, inspiration_url, servings,
           minutes_total, minutes_marinate, minutes_hands_on, minutes_clean_up,
           serve_with, search_list, equipment, ingredients, instructions]
  """
  def convert(url, info) do
    %{
      :name => info.title,
      :inspiration => info.author,
      :inspiration_url => url
    }
  end
end
