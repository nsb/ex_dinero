defmodule Dinero.DineroInvoice do
  use Ecto.Schema
  alias Dinero.DineroInvoice
  import Ecto.Changeset

  @derive {Jason.Encoder, only: [:ContactGuid, :Date, :ProductLines]}
  embedded_schema do
    field(:ContactGuid, :string)
    field(:ExternalReference, :string)
    field(:Date, :date)
    field(:ProductLines, {:array, Dinero.DineroProductLine})
  end

  def changeset(%DineroInvoice{} = invoice, params) do
    invoice
    |> cast(params, [
      :ContactGuid,
      :ExternalReference,
      :Date,
      :ProductLines
    ])
    |> validate_required([:ContactGuid, :Date, :ProductLines])
  end
end
