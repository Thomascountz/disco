# disco
Toy distributed columnar datastore

Experiement inspired by: [Why Observability Requires a Distributed Column Store](https://www.honeycomb.io/blog/why-observability-requires-distributed-column-store/)

## Usage Example

```bash
$ bin/coloco '{ "key": "value" }'

$ find ./datastore -type f | xargs tail -n +1
==> ./datastore/key <==
value

==> ./datastore/index <==
1
```

https://user-images.githubusercontent.com/19786848/133263984-6a22212d-1584-435b-9fea-fa4d1bfd755c.mov

## `/datastore`
### `index`
Holds the most resent line number/event index for all columns

## Dynamic files
Each file represents a column. Each line represents the value of the column in the event at index == lineno.

## `/bin`
### `/bin/disco`
Parses and writes a JSON event into columnar data store

## ⚠️ `/bin/reset` - DESTRUTIVE

For prototyping: destroys all data in `/datastore` and restores `index` to `0`

