# Steps

- `npm install`
- `npm run up`
- open Ruru
- execute the query

```graphql
query MyQuery {
  allLocations(
    first: 5
    after: "WyI3MDI4MmU5ZTRkIiwiNWE1NjZlNmItOTA4Yy00ZjA5LThhOTMtZDRkNzNhYjBlYTljIl0="
  ) {
    pageInfo {
      endCursor
      startCursor
      hasPreviousPage
      hasNextPage
    }
  }
}
```

expected: `pageInfo.hasPreviousPage` to be `true`
received: `false`
