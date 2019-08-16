defprotocol Selectable.Protocol do
  def options(data, params)
  def selected(data)
end
