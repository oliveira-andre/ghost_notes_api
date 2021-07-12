# Ghost Notes API

> this message will be placed in both projects the `client` and `api`

```
This project was created thinking in some examples like anonfiles, ghostbin, pastebin etc...
i love to create ghost notes and we never can be sure of a project until read the code, then i started this
project to encrypt all notes to be sure that no one instead of you will access the information that you saved
```

## Responses

### Notes

<details>
<summary>Create</summary>

curl

```
curl -kv -H 'content-type: application/json' -d '{ "notes": { "title": "i am first title", "body": "i am first body", "keys": "049c0e65185bc34574ec33c4e3ea7bc8189eec1cbccd7aa482c6e94931b1f699e312cf033be0c191fbb1285f4411a088a462f28ca39a4ac3f67769aaf675c4d6e2" } }' -X 'POST' 'http://localhost:3000/api/v1/notes' | jq
```

expected response

```json
{
  "title": "i am first title",
  "body": "i am first body",
  "password": "$2a$12$OPYstkMfBmzVntbdlTx3Cey0Mu.CWz2VpZDGdyfrbckLtQ1t9rnES",
  "public_keys": [
    "049c0e65185bc34574ec33c4e3ea7bc8189eec1cbccd7aa482c6e94931b1f699e312cf033be0c191fbb1285f4411a088a462f28ca39a4ac3f67769aaf675c4d6e2"
  ],
  "slug": "i-am-first-title-e4ea3746-6381-4a5b-9b16-68d3f6f4330f"
}
```
</details>

<details>
<summary>Destroy</summary>

curl

```
curl -kv -H 'content-type: application/json' -X 'DELETE' 'http://localhost:3000/api/v1/notes/i-am-first-title-e4ea3746-6381-4a5b-9b16-68d3f6f4330f'
```

expected response

```
no content
```
</details>
