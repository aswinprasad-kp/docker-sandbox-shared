CREATE TABLE users (
    id VARCHAR(50) PRIMARY KEY,
    username VARCHAR(100) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE messages (
    id SERIAL PRIMARY KEY,
    -- 🚨 Look at this magic: If a user is deleted, their messages vanish instantly!
    user_id VARCHAR(50) NOT NULL REFERENCES users(id) ON DELETE CASCADE,
    content TEXT,
    file_url TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);