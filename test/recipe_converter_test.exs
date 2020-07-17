defmodule RecipeConverterTest do
  use ExUnit.Case
  doctest RecipeConverter

  test "greets the world" do
    assert RecipeConverter.hello() == :world
  end
end
