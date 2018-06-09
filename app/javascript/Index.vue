<template>
  <ul>
    <li v-for="post in posts" :key="post.id">
      <el-card class="box-card">
        <div slot="header" class="clearfix">
          {{post.title}}
        </div>
        <div class="text item">
          {{post.content}}
        </div>
      </el-card>
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

<style lang="scss" scoped>
li {
  list-style: none;
}
</style>

