import React, { useState, useEffect } from "react";
import { API_URL } from "../constants";

const PostsList = () => {
  const [posts, setPosts] = useState([]);

  useEffect(() => {
    const fetchData = async () => {
      try {
        const response = await fetch(API_URL+"/posts");
        const data = await response.json();
        setPosts(data);
      } catch (error) {
        console.error("Error fetching posts:", error);
      }
    };

    fetchData();
  }, []);

  return (
    <div className="app">
      <h1>This is a Vite + React app!</h1>
      <p>Find me in client/src/app.jsx</p>
      {posts.map((post) => (
        <div key={post.id}>
          <h2>{post.title}</h2>
          <p>{post.body}</p>
        </div>
      ))}
    </div>
  );
  
};


export default PostsList;
