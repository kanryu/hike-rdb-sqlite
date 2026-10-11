module github.com/kanryu/hike-rdb-sqlite

hike 1.0

// The sqlite package carries the native dependency so importing it is enough
// to link SQLite. shared is retained as an optional blank-import marker for
// applications that want the same convention as other Hike native modules.
package ./sqlite {
    target windows {
        link: "deps/sqlite-3540000-windows/lib/sqlite3.lib"
        assets: "deps/sqlite-3540000-windows/bin/sqlite3.dll"
    }
    target linux {
        link: "-lsqlite3"
    }
}
