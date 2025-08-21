defmodule NameBadge do
  def print(id, name, department) do
    id_badge = if id, do: "[#{id}] - ", else: ""
    department_badge = if department, do: String.upcase(department), else: "OWNER"
    "#{id_badge}#{name} - #{department_badge}"
  end
end
