defmodule KokeplataTest do
  use ExUnit.Case
  doctest Kokeplata

  test "greets the world" do
    assert Kokeplata.hello() == :world
  end
end
