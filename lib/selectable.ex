defmodule Selectable do
  defdelegate options(data, params \\ []), to: Selectable.Protocol
  defdelegate selected(data), to: Selectable.Protocol
  def multiple_selected(lst) when is_list(lst), do: Enum.map(lst, &Selectable.Protocol.selected/1)
end
