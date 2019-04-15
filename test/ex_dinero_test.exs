defmodule ExDineroTest do
  use ExUnit.Case
  import Mimic

  @headers [Authorization: "Bearer abc", "Content-Type": "application/json"]

  setup do
    get_contacts_response = %{
      "Collection" => [
        %{
          "contactGuid" => "a5f62248-ae7c-4a04-b83d-aa34f0e62ce3",
          "name" => "Donald Trump"
        }
      ],
      "Pagination" => %{
        "MaxPageSizeAllowed" => 1000,
        "PageSize" => 100,
        "Result" => 1,
        "ResultWithoutFilter" => 2,
        "Page" => 0
      }
    }

    contact = %Dinero.DineroContact{
      ExternalReference: "myreference",
      Name: "my name",
      Street: "my street",
      ZipCode: "1234",
      City: "my city",
      CountryKey: "DK",
      Email: "myemail@example.com",
      Phone: "12341234",
      isPerson: true
    }

    create_contact_response = %{
      "ContactGuid" => "a5f62248-ae7c-4a04-b83d-aa34f0e62ce3"
    }

    stub(:hackney)

    %{
      get_contacts_response: get_contacts_response,
      contact: contact,
      create_contact_response: create_contact_response
    }
  end

  test "get contact", %{
    get_contacts_response: get_contacts_response
  } do
    expect(:hackney, :request, fn
      :get,
      "https://api.dinero.dk/v1/123/contacts?queryFilter=ExternalReference+eq+%27myjobplanner%3A1363%27",
      @headers,
      "",
      [] ->
        {:ok, 200, "headers", :client}
    end)

    expect(:hackney, :body, fn _, _ -> {:ok, Jason.encode!(get_contacts_response)} end)

    assert Dinero.DineroApi.get_contacts("123", "abc",
             queryFilter: "ExternalReference eq 'myjobplanner:1363'"
           ) == {:ok, get_contacts_response}
  end

  test "create contacts", %{
    contact: contact,
    create_contact_response: create_contact_response
  } do
    expect(:hackney, :request, fn
      :post, "https://api.dinero.dk/v1/123/contacts", @headers, _, [] ->
        {:ok, 200, "headers", :client}
    end)

    expect(:hackney, :body, fn _, _ -> {:ok, Jason.encode!(create_contact_response)} end)

    assert Dinero.DineroApi.create_contact("123", "abc", contact) == {:ok, create_contact_response}
  end

end
