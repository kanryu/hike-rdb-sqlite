# SQLite CRUD example

This example uses a file database and verifies the following sequence:

1. Creates the `users` table.
2. Inserts two rows with a prepared statement.
3. Selects and validates both rows.
4. Updates one row and checks `Changes()`.
5. Selects the updated value.
6. Deletes one row and verifies that one row remains.
7. Exercises connection configuration, optimize, and vacuum operations.

It also inserts and reads a BLOB, verifying that `ColumnBlob` returns an owned
`cbuffer` with the expected length and contents, then closes it explicitly.

Build and run from this directory with:

```text
make build
make run
```

The example creates the file `sqlite-crud.db` in this directory and prints
each operation and its result. The dependency module configuration in
`../../hike.mod` links the bundled SQLite import library and copies
`sqlite3.dll` beside the executable.

Remove the generated database and binaries with:

```text
make MakeClean
```
