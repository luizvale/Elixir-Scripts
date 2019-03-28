defmodule CardsTest do
  use ExUnit.Case
  doctest Cards

  test "create_test makes 20 cards" do
    deck_lenght = length(Cards.create_deck)
    assert deck_lenght == 20
  end

end

