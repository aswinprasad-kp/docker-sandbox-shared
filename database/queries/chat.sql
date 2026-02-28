-- name: CreateUser :one
INSERT INTO users (id, username, password_hash) 
VALUES ($1, $2, $3) 
RETURNING id, username, created_at;

-- name: CreateMessage :one
INSERT INTO messages (user_id, content, file_url)
VALUES ($1, $2, $3)
RETURNING *;

-- name: ListMessages :many
SELECT * FROM messages
ORDER BY created_at ASC;

-- name: GetMessages :many
SELECT m.id, m.user_id, u.username, m.content, m.file_url, m.created_at 
FROM messages m
JOIN users u ON m.user_id = u.id
ORDER BY m.created_at ASC 
LIMIT 100;

-- name: GetUserByUsername :one
SELECT id, username, password_hash, created_at 
FROM users 
WHERE username = $1 LIMIT 1;