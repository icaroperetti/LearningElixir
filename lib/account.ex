defmodule Account do
  defstruct user: User, balance: nil

  def register(user), do: %__MODULE__{user: user, balance: 1000}

  def bankTransfer(accounts,from,to,value) do
    from = Enum.find(accounts, fn account -> account.user.email == from.user.email end)

    cond do
      validate_balance(from.balance, value) -> {:error, "Do not have money enought"}
      true ->
        to = Enum.find(accounts, fn account -> account.user.email == to.user.email end)

        from = %Account{from | balance: from.balance - value}
        to = %Account{to | balance: to.balance + value}

      [from,to]
    end
  end

  def withdraw(account,value) do
    cond do
      validate_balance(account.balance, value) -> {:error, "Do not have money enought"}

      true ->  account = %Account{account | balance: account.balance - value}
      {:of,account, "email sent"}
    end
  end

  defp validate_balance(balance, value), do: balance < value
end
