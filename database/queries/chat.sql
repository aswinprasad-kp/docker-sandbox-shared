-- name: CreateUser :one
INSERT INTO users (id, username)
VALUES ($1, $2)
RETURNING *;

-- name: CreateMessage :one
INSERT INTO messages (user_id, content, file_url)
VALUES ($1, $2, $3)
RETURNING *;

-- name: ListMessages :many
SELECT * FROM messages
ORDER BY created_at ASC;