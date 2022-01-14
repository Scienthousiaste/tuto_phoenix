defmodule TutoPhoenixWeb.ComponentView do
  use TutoPhoenixWeb, :view

  def view_element_link(name_elements, id) do
    name_elements <> "/" <> to_string(id)
  end

  defp singularize(plural) do
    String.slice(plural, 0, String.length(plural) - 1)
  end

  def new_element_button(name_elements) do
    button("New " <> singularize(name_elements), to: name_elements<>"/new", method: :get, class: "btn")
  end
end
