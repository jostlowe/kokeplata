defmodule ElevatorStuff do

  require ElevatorState
  require ElevatorOrder


  def distance_to_order(elevator_order, elevator_state) do
    elevator_order.floor - elevator_state.floor
  end

  def order_type_to_int(elevator_order) do
    %{hall_up: 1, cab: 0, hall_down: -1}[elevator_order.type]
  end

  def direction_to_int(elevator_state) do
    %{up: 1, idle: 0, down: -1}[elevator_state.direction]
  end

  def moving_in_same_direction(elevator_order, elevator_state) do
    dir = direction_to_int(elevator_state)
    type = order_type_to_int(elevator_order)
    if dir*type >= 0, do: true, else: false
  end

  def moving_towards_order(elevator_order, elevator_state) do
    dist = distance_to_order(elevator_order, elevator_state)
    if dist*direction_to_int(elevator_state) > 0, do: true, else: false
  end 

  def figure_of_suitability(elevator_order, elevator_state, num_floors) do
    is_idle = (elevator_state.direction == :idle)
    moving_towards = moving_towards_order(elevator_order, elevator_state)
    moving_same_dir = moving_in_same_direction(elevator_order, elevator_state)
    abs_distance = distance_to_order(elevator_order, elevator_state) |> abs()

    cond do
      is_idle             -> num_floors + 1 - abs_distance
      not moving_towards  -> 1
      moving_same_dir     -> num_floors + 2 - abs_distance
      true                -> num_floors + 1 - abs_distance
    end
  end

end
