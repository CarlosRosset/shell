#!/bin/bash
curl --location --request POST 'https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyBLUauRW0Q_QJGPzYjPOeQIAPsZKqNtIIY' \
--header 'Content-Type: application/json' \
--data-raw '{
	"email":"erp@serquip-al.com",
	"password":"serquip2020",
	"returnSecureToken": "true",
}'
