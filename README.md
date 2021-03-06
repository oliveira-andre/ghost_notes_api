# Ghost Notes API

> this message will be placed in both projects the `client` and `api`

```
This project was created thinking in some examples like anonfiles, ghostbin, pastebin etc...
i love to create ghost notes and we never can be sure of a project until read the code, then i started this
project to encrypt all notes to be sure that no one instead of you will access the information that you saved
```

## How to use

building and running api and postgres
```
sudo docker-compose up --build
```

creating and migrating database
```
sudo docker-compose run --rm api rails db:create db:migrate
```

## How to run tests

Rubocop
```
sudo docker-compose run --rm api rubocop -A
```

Rspec
```
sudo docker-compose run --rm api rspec
```

Brakeman
```
sudo docker-compose run --rm api brakeman
```

## Responses

### Notes

<details>
<summary>Create</summary>

curl

```
curl -kv -H 'content-type: application/json' -d '{ "notes": { "title": "i am first title", "body": "i am first body", "keys": "049c0e65185bc34574ec33c4e3ea7bc8189eec1cbccd7aa482c6e94931b1f699e312cf033be0c191fbb1285f4411a088a462f28ca39a4ac3f67769aaf675c4d6e2" } }' -X 'POST' 'http://localhost:3000/api/v1/notes' | jq
```

or with password

```
curl -kv -H 'content-type: application/json' -d '{ "notes": { "title": "i am first title", "body": "i am first body", "keys": "049c0e65185bc34574ec33c4e3ea7bc8189eec1cbccd7aa482c6e94931b1f699e312cf033be0c191fbb1285f4411a088a462f28ca39a4ac3f67769aaf675c4d6e2", "password": "safe" } }' -X 'POST' 'http://localhost:3000/api/v1/notes' | jq
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

<details>
<summary>Show</summary>

curl

```
curl -kv -H 'content-type: application/json' -X 'GET' 'http://localhost:3000/api/v1/notes/i-am-first-title-a8c9c608-6bb5-4937-8bdb-068b3b929134' | jq
```

or with password

```
curl -kv -H 'content-type: application/json' -X 'GET' 'http://localhost:3000/api/v1/notes/i-am-first-title-70acacdb-7145-4541-9edf-2e11a191e498/password/safe123' | jq
```

expected response

```json
{
  "title": "i am first title",
  "body": "i am first body",
  "password": null,
  "public_keys": [
    "049c0e65185bc34574ec33c4e3ea7bc8189eec1cbccd7aa482c6e94931b1f699e312cf033be0c191fbb1285f4411a088a462f28ca39a4ac3f67769aaf675c4d6e2"
  ],
  "slug": "i-am-first-title-a8c9c608-6bb5-4937-8bdb-068b3b929134"
}
```
</details>
