CREATE DATABASE aptTalk; -- I created database

-- User table
CREATE TABLE users(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    userName VARCHAR(9) NOT NULL,
    email VARCHAR(50) NOT NULL UNIQUE,
    userPassword VARCHAR(200) NOT NULL,
    createdAt DATE
);

-- Post table
CREATE TABLE posts(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    postContent TEXT NOT NULL,
    picture VARCHAR(300),
    createdAt DATE,
    postAuthorId BIGINT REFERENCES users(id) NOT NULL --foreign key
);

-- Comment Table
CREATE TABLE comments(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    commentContent VARCHAR(300) NOT NULL,
    createdAt DATE,
    commentUserId BIGINT REFERENCES users(id) NOT NULL, --foreign key
    commentPostId BIGINT REFERENCES posts(id) NOT NULL --foreign key
);

-- Follow List Table
CREATE TABLE followers(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    followerId BIGINT REFERENCES users(id) NOT NULL, --foreign key (users in follow list)
    followedUserId BIGINT REFERENCES users(id) NOT NULL--foreign key
);

-- Post Reaction Table
CREATE TABLE reactions(
    id BIGSERIAL NOT NULL PRIMARY KEY,
    reactionPostId BIGINT REFERENCES posts(id) NOT NULL, --foreign key
    reactionUserId BIGINT REFERENCES users(id) NOT NULL --foreign key
);



-- INSERT INTO posts (postcontent, picture, id, postauthorid) VALUES ('Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quasi tempore ducimus ullam rerum? Optio soluta ullam dolores nihil placeat aspernatur velit totam. Sapiente voluptatem alias ipsam illum amet dolore vitae.', 'https://images.unsplash.com/photo-1502672260266-1c1ef2d93688?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8YXBhcnRtZW50fGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=1400&q=60', 1, 59);
