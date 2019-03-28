defmodule Cards do
  @moduledoc """
    Providencia metodos para criação e manipulação de um baralho de cartas
  """
  @doc """
    Retorna uma lista de strings representando o baralho e suas cartas
  """
  def create_deck do
    values = ["Ace", "Two", "Three", "Four", "Five"]
    suits = ["Spades", "Club", "Diamonts", "Hearts"]

    for suit <- suits,value <- values do
      "#{suit} of #{value}"           ## Uso de lista comprimida e interpolação de strings
    end
  end

  def shuffle(deck) do
    Enum.shuffle(deck)
  end

  @doc """

    Determina se um baralho contém uma determinada carta

  ## Exemplo:

      iex> deck = Cards.create_deck
      iex> Cards.contains?(deck,"Spades of Ace")
      true
  """
  def contains?(deck, card) do
    Enum.member?(deck, card)
  end
  @doc """
  Divide o deck em duas parcelas, uma representando a mão inicial e outra representando o resto do baralho.
  hand_size recebe o número de cartas que devem ser selecionadas para mão inicial.

  ## Exemplo :

      iex > deck = Cards.create_deck
      iex > {hand, deck} = Cards.deal(deck, 1)
      iex > hand
      ["Ace of spades"]

  """
  def deal(deck, hand_size) do
    Enum.split(deck, hand_size)
  end

  def save(deck, filename) do
    binary = :erlang.term_to_binary(deck)
    File.write!(filename, binary)
  end

  def loads(filename) do
    case File.read(filename) do
      {:ok, binary } -> :erlang.binary_to_term binary # retorna uma tupla com 2 parâmetros, status and call.
                                  #A segunda atribuição funcionará apenas caso o parâmetro status for um ok '''

       {:error, _reason} -> " Este arquivo não existe !" # Dados primitivos em elixir ":ok"
    end
  end
  def create_hand(hand_size) do
    Cards.create_deck
    |> Cards.shuffle
    |> Cards.deal(hand_size)
  end

end
