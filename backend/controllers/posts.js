import { pool } from "../db/connectDb.js";

// all posts that show on home page
export const getAllPosts = async (req, res) => {
  try {
    const posts = await pool.query(
      "SELECT p.*, u.username FROM posts AS p INNER JOIN users AS u ON p.postauthorid = u.id ORDER BY p.createdat DESC"
    ); //latest posts up top
    return res.status(200).json(posts);
  } catch (error) {
    console.log(error);
    res.status(500).json(error);
  }
};

// add post
export const addPost = async (req, res) => {
  const { postContent, picture, createdAt, postAuthorId } = req.body;
  try {
    const addOnePost = await pool.query(
      "INSERT INTO posts (postcontent, picture, createdat, postauthorid) VALUES ($1, $2, $3, $4)",
      [postContent, picture, createdAt, postAuthorId]
    );
    return res.status(200).json(addOnePost);
  } catch (error) {
    console.log(error);
    res.status(500).json(error);
  }
};