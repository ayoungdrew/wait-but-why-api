#!/bin/bash

curl "http://localhost:4741/episodes" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "episode": {
      "title": "'"${TITLE}"'",
      "date": "'"${DATE}"'",
      "why": "'"${WHY}"'",
      "description": "'"${DESCRIPTION}"'"
    }
  }'

echo
