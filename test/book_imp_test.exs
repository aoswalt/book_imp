defmodule BookImpTest do
  use ExUnit.Case
  doctest BookImp

  test "greets the world" do
    assert BookImp.hello() == :world
  end
end
