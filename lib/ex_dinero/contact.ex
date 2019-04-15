defmodule Dinero.DineroContact do
  use Ecto.Schema
  alias Dinero.DineroContact
  import Ecto.Changeset

  @derive {Jason.Encoder,
           only: [
             :ExternalReference,
             :Name,
             :Street,
             :ZipCode,
             :City,
             :CountryKey,
             :Phone,
             :Email,
             :isPerson
           ]}
  embedded_schema do
    field(:ExternalReference, :string)
    field(:Name, :string)
    field(:Street, :string)
    field(:ZipCode, :string)
    field(:City, :string)
    field(:CountryKey, :string)
    field(:Phone, :string)
    field(:Email, :string)
    field(:Webpage, :string)
    field(:AttPerson, :string)
    field(:VatNumber, :string)
    field(:EanNumber, :string)
    field(:PaymentConditionType, :string)
    field(:PaymentConditionNumberOfDays, :integer)
    field(:isPerson, :boolean)
  end

  def changeset(%DineroContact{} = contact, params) do
    contact
    |> cast(params, [
      :ExternalReference,
      :Name,
      :Street,
      :ZipCode,
      :City,
      :CountryKey,
      :Phone,
      :Email,
      :Webpage,
      :AttPerson,
      :VatNumber,
      :EanNumber,
      :PaymentConditionType,
      :PaymentConditionNumberOfDays,
      :isPerson
    ])
    |> validate_required([:Name, :CountryKey, :isPerson])
  end
end
