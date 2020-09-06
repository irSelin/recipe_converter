defmodule Lookup do
  @moduledoc """
  This module loads recipe conversion macros from CSV files.
  """
  @doc """
  A list of units (for ingredient manipulation)

  Do not add plurals that are an existing unit +s
    Do: pinch, pinches
    Don't: cup, cups
  """
  def units do
    ["cup", "pound", "tablespoon", "teaspoon", "clove", "stick", "ounce", "oz", "tbsp", "block", "pinch", "quart", "pint", "pod", "lb"]
  end

  @doc """
  Unit modifiers
  """
  def unit_mods do
    ["large", "medium", "small", "lg", "sm"]
  end

  @doc """
  The conversion map for ingredient preparations
  (Organized roughly alphabetically to help avoid duplication)
  """
  def prep do
    %{
      "chopped" => "chop",
      "cored" => "core",
      "crumbled" => "crumble",
      "diced" => "dice",
      "drained" => "drain",
      "defrosted" => "defrost",
      "emptied" => "empty",
      "filled" => "fill",
      "grated" => "grate",
      "ground" => "grind",
      "halved" => "halve",
      "juiced" => "juice",
      "melted" => "melt",
      "minced" => "mince",
      "peeled" => "peel",
      "picked" => "pick",
      "quartered" => "quarter",
      "removed" => "remove",
      "rinsed" => "rinse",
      "rolled" => "roll",
      "seeded" => "seed",
      "sliced" => "slice",
      "slivered" => "sliver",
      "stemmed" => "stem",
      "scrubbed" => "scrub",
      "shucked" => "shuck",
      "snapped" => "snap",
      "smashed" => "smash",
      "toasted" => "toast",
      "torn" => "tear",
      "trimmed" => "trim",
      "washed" => "wash",
      "wiped" => "wipe"
    }
  end
end
