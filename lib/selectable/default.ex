defmodule Selectable.Default do
  defmacro __using__(options: type, key: key) do
    id_val = {:id, [], Elixir}
    key_val = {:key, [], Elixir}

    pattern = {
      :%,
      [],
      [
        type,
        {
          :%{},
          [],
          [
            {:id, id_val},
            {key, key_val}
          ]
        }
      ]
    }

    quote do
      def options(%unquote(type){}) do
        unquote(type).all()
        |> Enum.map(fn unquote(pattern) ->
          {unquote(key_val), unquote(id_val)}
        end)
      end
    end
  end

  defmacro __using__(selected: type) do
    quote do
      def selected(%unquote(type){id: id}) do
        id
      end
    end
  end
end
