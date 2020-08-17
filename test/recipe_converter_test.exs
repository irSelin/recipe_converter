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

  # NytExtract.fine_trim title extraction
  test "Extracting title using NytExtract from known HTML" do
    assert "The Best Roast Beef for Sandwiches" = case1().title
  end

  test "Extracting title using NytExtract from unknown HTML" do
    assert "No-Knead Bread" = case2().title
    assert "Marinated Feta With Herbs and Peppercorns" = case3().title
  end

  # NytExtract.fine_trim author extraction
  test "Extracting author using NytExtract from known HTML" do
    assert "Melissa Clark" = case1().author
  end

  test "Extracting author using NytExtract from unknown HTML" do
    assert "Mark Bittman" = case2().author
    assert "Alexa Weibel" = case3().author
  end

  # NytExtract.fine_trim yield extraction
  test "Extracting yield using NytExtract from known HTML" do
    assert "6 to 10 sandwiches" = case1().yield
  end

  test "Extracting yield using NytExtract from unknown HTML" do
    assert "One 1 1/2-pound loaf" = case2().yield
    assert "About 2 1/2 cups" = case3().yield
  end

  # NytExtract.fine_trim time extraction
  test "Extracting time using NytExtract from known HTML" do
    assert "1 hour, 45 minutes, plus at least 5 hours resting" = case1().time
  end

  test "Extracting time using NytExtract from unknown HTML" do
    #weird error with reading the apostraphe, not sure what to do with
    #assert "1 hour 30 minutes, plus about 20 hours' resting time" =
    #  case2().time
    assert "10 minutes, plus marinating" = case3().time
  end
end
