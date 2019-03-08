defmodule ButtonStuff do
  @moduledoc """
  A bunch o' little titbits of code that may (or may not) make the elevator lab slightly more survivable
  """


  @doc """
  Returns all the different types of buttons on the elevator panel.

  ## Examples
      iex> Kokeplata.get_all_button_types
      [:hall_up, :hall_down, :cab]
  """

  def get_all_button_types do
    [:hall_up, :hall_down, :cab]
  end



  @doc """
  Returns all possible orders of a single button type, given the number of the top floor
  Returns a list of tuples on the from {button_type, floor}

  ## Examples
      iex> Kokeplata.get_all_button_types(:cab, 3)
      [cab: 0, cab: 1, cab: 2, cab: 3]
      iex> Kokeplata.get_all_button_types(:hall_up, 3)
      [hall_up: 0, hall_up: 1, hall_up: 2]
  """

  def get_buttons_of_type(button_type, top_floor) do
    floor_list = case button_type do
      :hall_up -> 0..top_floor-1
      :hall_down -> 1..top_floor
      :cab -> 0..top_floor
    end
    floor_list |> Enum.map(fn floor -> {button_type, floor} end)
  end



  @doc """
  Returns all possible orders on a single elevator
  Returns a list of tuples on the from {button_type, floor}

  ## Examples
      iex> Kokeplata.get_all_buttons(3)
      [
        hall_up: 0,
        hall_up: 1,
        hall_up: 2,
        hall_down: 1,
        hall_down: 2,
        hall_down: 3,
        cab: 0,
        cab: 1,
        cab: 2,
        cab: 3
      ]
  """

  def get_all_buttons(top_floor) do
    get_all_button_types() |> Enum.map(fn button_type -> get_buttons_of_type(button_type, top_floor) end) |> List.flatten
  end
end
