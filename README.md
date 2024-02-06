# Issue reproduction steps

- `npm install`
- `npm run up`
- open Ruru
- execute the query:

```graphql
query MyQuery($first: Int = 10, $after: Cursor) {
  allLocations(first: $first, orderBy: IS_PUBLIC_ASC, after: $after) {
    nodes {
      name
    }
    pageInfo {
      endCursor
    }
  }
}
```

- copy returned `endCursor` value
- set the `endCursor` value to the `after` variable
- re-execute the query

# Expected:

Successfuly receive the next set of results

# Received

A GraphQL error with the following message:

```
Masked GraphQL error (hash: 'rxMy2h8uOCdYdguPLy4fcLXMWOg', id: '6ACWFQYMDJ') Error: f isn't a boolean; cowardly refusing to cast it to postgres
    at Object.toPg (/home/ruslik/.npm/_npx/e75fc4d1ace5dbd8/node_modules/@dataplan/pg/dist/codecs.js:536:23)
    at /home/ruslik/.npm/_npx/e75fc4d1ace5dbd8/node_modules/@dataplan/pg/dist/steps/pgSelect.js:650:59
    at Array.map (<anonymous>)
    at /home/ruslik/.npm/_npx/e75fc4d1ace5dbd8/node_modules/@dataplan/pg/dist/steps/pgSelect.js:648:40
    at Array.map (<anonymous>)
    at PgSelectStep.execute (/home/ruslik/.npm/_npx/e75fc4d1ace5dbd8/node_modules/@dataplan/pg/dist/steps/pgSelect.js:643:93)
    at executeOrStream (/home/ruslik/.npm/_npx/e75fc4d1ace5dbd8/node_modules/grafast/dist/engine/executeBucket.js:446:25)
    at executeStep (/home/ruslik/.npm/_npx/e75fc4d1ace5dbd8/node_modules/grafast/dist/engine/executeBucket.js:569:19)
    at nextPhase (/home/ruslik/.npm/_npx/e75fc4d1ace5dbd8/node_modules/grafast/dist/engine/executeBucket.js:109:31)
    at next (/home/ruslik/.npm/_npx/e75fc4d1ace5dbd8/node_modules/grafast/dist/engine/executeBucket.js:154:20) {
  path: [ 'allLocations', 'nodes' ],
  locations: [ { line: 3, column: 5 } ],
  extensions: [Object: null prototype] {}
}

```
