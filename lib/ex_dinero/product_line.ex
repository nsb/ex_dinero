defmodule Dinero.DineroProductLine do
  @behaviour Ecto.Type
  import Ecto.Changeset
  alias Dinero.DineroProductLine

  use Ecto.Schema

  @derive {Jason.Encoder,
           only: [
             :BaseAmountValue,
             :Description,
             :Comments,
             :Quantity,
             :AccountNumber,
             :Unit,
             :LineType
           ]}
  embedded_schema do
    field(:BaseAmountValue, :decimal)
    field(:ProductGuid, :string)
    field(:Description, :string)
    field(:Comments, :string)
    field(:Quantity, :decimal)
    field(:AccountNumber, :integer)
    field(:Unit, :string)
    field(:Discount, :decimal)
    field(:LineType, :string)
  end

  def changeset(%DineroProductLine{} = product_line, params) do
    product_line
    |> cast(params, [
      :BaseAmountValue,
      :ProductGuid,
      :Description,
      :Comments,
      :Quantity,
      :AccountNumber,
      :Unit,
      :Discount,
      :LineType
    ])
    |> validate_required([:BaseAmountValue, :Quantity])
  end

  def type, do: :map

  def cast(product_line) do
    product_line
  end

  def load(data) do
    data
  end

  def dump(data) do
    data
  end
end
