defmodule RecipeConverterTest do
  use ExUnit.Case
  doctest RecipeConverter

  test "html_from_url" do
    assert {:ok, _} =
             RecipeConverter.html_from_url(
               "https://cooking.nytimes.com/recipes/1018915-chicken-fried-steak-with-queso-gravy?module=Recipe+of+The+Day&pgType=homepage&action=click"
             )
  end
end
