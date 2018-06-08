<template>
  <ul>
    <li v-for="post in posts" :key="post.id">
      <div>
        {{post.title}}
      </div>
      <div>
        {{post.content}}
      </div>
    </li>
  </ul>
</template>

<script>
import axios from "axios";

export default {
  data: function() {
    return {
      posts: []
    };
  },
  mounted: function() {
    this.fetchPosts();
  },
  methods: {
    fetchPosts: function() {
      axios.get("/api/posts").then(
        res => {
          this.posts = res.data.posts;
        },
        error => {
          console.log(error);
        }
      );
    }
  }
};
</script>
