defmodule RocketpayWeb.UsersViewTest do
  use RocketpayWeb.ConnCase, async: true

  import Phoenix.View

  alias Rocketpay.{User, Account}

  test "renders create.json" do
    params = %{
      name: "Gustavo",
      nickname: "Gusta",
      password: "123456",
      email: "gustavoms97@hotmail.com",
      age: 23
    }

    {:ok, %User{id: user_id, account: %Account{id: account_id}} = user} =
      Rocketpay.create_user(params)

    response = render(RocketpayWeb.UsersView, "create.json", user: user)

    expected_response = %{
      message: "User created",
      user: %{
        account: %{balance: Decimal.new("0.0"), id: account_id},
        id: user_id,
        name: "Gustavo",
        nickname: "Gusta"
      }
    }

    assert expected_response == response
  end
end
