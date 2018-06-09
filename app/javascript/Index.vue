<template>
  <ul>
    <li v-for="post in posts" :key="post.id">
      <el-card class="box-card">
        <div slot="header" class="clearfix header">
          <h2>{{post.title}}</h2>
        </div>
        <div class="text item">
          <p>{{post.content}}</p>
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
.box-card {
  .header h2 {
    margin: 5px;
  }
  .item p {
    line-height: 40px;
  }
}
</style>

