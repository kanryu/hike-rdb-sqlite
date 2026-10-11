# SQLite transaction example

This example is independent from the CRUD example and focuses only on
transaction behavior:

1. The first transaction inserts an account and commits successfully.
2. The second transaction attempts to insert another row with the same
   primary key.
3. SQLite returns `SQLITE_CONSTRAINT` (`19`).
4. The second transaction is rolled back.
5. A verification query confirms that the original row is unchanged and that
   no duplicate row was committed.

Run it from this directory:

```text
make run
make clean
```

The example uses the file database `sqlite-transaction.db` and prints every
transaction operation and result.
