# Hike RDB SQLite

`github.com/kanryu/hike-rdb-sqlite` provides a small native SQLite binding for
Hike applications.

`examples/basic` verifies the complete CRUD flow: table definition, INSERT,
SELECT, UPDATE, and DELETE. It uses a file database and returns a non-zero
exit status if any result is unexpected.

`Stmt.ColumnBlob` returns an owned `cbuffer` copy. The returned buffer is
independent of SQLite's borrowed column buffer and remains valid across later
statement operations. Call `Close` when the buffer is no longer needed; its
release callback calls SQLite's `sqlite3_free` allocator.

`DB` provides explicit transaction helpers: `Begin`, `Commit`, and `Rollback`.
It also provides `Vacuum` for reclaiming unused file pages and `Optimize` for
SQLite query-planner maintenance. Connection configuration helpers include
`SetForeignKeys`, `EnableWAL`, `SetSynchronousNormal`, and `BusyTimeout`.

For long-running work, `Interrupt` requests cancellation of the connection's
current operation. `Stmt.ColumnIsNull` checks SQL NULL values, and
`Stmt.BindCBuffer` binds the bytes of a `cbuffer` through the SQLite binding
API. Keep the cbuffer alive until the bind operation has completed.

Importing `sqlite` enables the bundled Windows SQLite 3.54.0 library and
copies `sqlite3.dll` next to the executable. Linux builds link against the
system `libsqlite3`. The empty `shared` package is available for projects
that use a uniform blank-import convention for native modules.
