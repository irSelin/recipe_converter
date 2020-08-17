defmodule RecipeConverterTest do
  use ExUnit.Case
  doctest RecipeConverter
  doctest NytExtract

  test "Gathering HTML using html_from_url" do
    assert {:ok, _} =
             RecipeConverter.html_from_url(
               "https://cooking.nytimes.com/recipes/1018915-chicken-fried-steak-with-queso-gravy?module=Recipe+of+The+Day&pgType=homepage&action=click"
             )
  end

  def case1 do
    {:ok, html} =
      RecipeConverter.html_from_url(
        "https://cooking.nytimes.com/recipes/1017348-the-best-roast-beef-for-sandwiches?action=click&module=Global%20Search%20Recipe%20Card&pgType=search&rank=10"
      )
    NytExtract.nyt_extract(html)
  end

  def case2 do
    {:ok, html} =
      RecipeConverter.html_from_url(
        "https://cooking.nytimes.com/recipes/11376-no-knead-bread?action=click&module=Collection%20Band%20Recipe%20Card&region=53%20Recipes%20to%20Cook%20With%20Your%20Kids&pgType=supercollection&rank=1"
      )
    NytExtract.nyt_extract(html)
  end

  def case3 do
    {:ok, html} =
      RecipeConverter.html_from_url(
        "https://cooking.nytimes.com/recipes/1020410-marinated-feta-with-herbs-and-peppercorns?action=click&module=Global%20Search%20Recipe%20Card&pgType=search&rank=18"
      )
    NytExtract.nyt_extract(html)
  end

  test "Extracting title using NytExtract from known HTML" do
    assert "The Best Roast Beef for Sandwiches" = case1().title
  end

  test "Extracting title using NytExtract from unknown HTML" do
    assert "No-Knead Bread" = case2().title
    assert "Marinated Feta With Herbs and Peppercorns" = case3().title
  end

  test "Extracting author using NytExtract from known HTML" do
    assert "Melissa Clark" = case1().author
  end

  test "Extracting author using NytExtract from unknown HTML" do
    assert "Mark Bittman" = case2().author
    assert "Alexa Weibel" = case3().author
  end
end
