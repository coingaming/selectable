defmodule SelectableTest do
  use ExUnit.Case
  doctest Selectable

  defmodule User do
    defstruct id: 1, name: "Monika"
  end

  defimpl Selectable.Protocol, for: User do
    use Selectable.Default, options: User, key: :name
    use Selectable.Default, selected: User
  end

  test "can use default" do
    assert 1 == Selectable.selected(%User{})
    assert [1] == Selectable.multiple_selected([%User{}])
  end
end
