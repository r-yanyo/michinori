<template>
  <div id="app">
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

    <div>
      <input type='text' v-model="title" placeholder="タイトル">
    </div>
    <div>
      <textarea name='' id='' cols='30' rows='10' v-model="content" placeholder="本文"></textarea>
    </div>
    <div>
      <button @click="submitPost">投稿する</button>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: function() {
    return {
      title: "",
      content: "",
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
          this.title = "";
          this.content = "";
          this.posts = res.data.posts;
        },
        error => {
          console.log(error);
        }
      );
    },
    submitPost: function() {
      axios
        .post("/api/posts", {
          title: this.title,
          content: this.content
        })
        .then(
          res => {
            this.fetchPosts();
          },
          error => {
            console.log(error);
          }
        );
    }
  }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
