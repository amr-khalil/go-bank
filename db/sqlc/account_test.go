package db

import (
	"context"
	"testing"

	"github.com/stretchr/testify/require"
)

func TestCreateAccounr(t *testing.T) {
	arg := CreateAccountParams{
		Owner:    "user",
		Balance:  100,
		Currency: "USD",
	}

	account, err := testQuries.CreateAccount(context.Background(), arg)
	require.NoError(t, err)
	require.NotEmpty(t, account)
	require.Equal(t, arg.Owner, account.Owner)
	require.Equal(t, arg.Balance, account.Balance)
	require.Equal(t, arg.Currency, account.Currency)

	require.NotZero(t, account.ID)
	require.NotZero(t, account.CreatedAt)

}
