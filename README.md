# Expand CSV Array filter plugin for Embulk

## Overview

* **Plugin type**: filter

This is a embulk plugin for expanding record which has csv column includes `N`-size array to `N` records.

For example, plugin expands below record which has csv column `csv_value` includes size-3 array value to 3 records.

Before:

```
+------+-----------+------+
| col1 | col2      | col3 |
+------+-----------+------+
| 1    | 1,2,3,4,5 | test |
+------+-----------+------+
```

Filtered:

```
+------+-------+
| col1 | col2  |
+------+-------+
| 1    | 1     |
+------+-------+
| 1    | 2     |
+------+-------+
| 1    | 3     |
+------+-------+
| 1    | 4     |
+------+-------+
| 1    | 5     |
+------+-------+
```

## Configuration

- **csv_column_name**: column of csv value in record (string , required)
- **column_names**: output column names

## Example

```yaml
filters:
  - type: expand_csv_array
    csv_column_name: col2
    column_names: [col1, col2]
```

## Build

```
$ rake
```

## Reference

- [ainoya/embulk-filter-expand_json_array](https://github.com/ainoya/embulk-filter-expand_json_array)
- [civitaspo/embulk-filter-expand_json](https://github.com/civitaspo/embulk-filter-expand_json)
