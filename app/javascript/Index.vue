<template>
<div>
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
  <el-pagination
    layout="prev, pager, next"
    :total="50" :current-page.sync="currentPage">
  </el-pagination>
</div>
</template>

<script>
import axios from "axios";

export default {
  data: function() {
    return {
      posts: [],
      currentPage: 1
    };
  },
  mounted: function() {
    this.fetchPosts();
  },
  watch: {
    currentPage: function(bef, af) {
      this.fetchPosts(this.currentPage);
    }
  },
  methods: {
    fetchPosts: function(pageNum) {
      axios.get(`/api/posts?page=${pageNum}`).then(
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
ul {
  padding: 0;
}
li {
  list-style: none;
}
.box-card {
  margin-bottom: 10px;
  .header h2 {
    margin: 5px;
  }
  .item p {
    line-height: 40px;
  }
}
.v-enter-active {
  transition: opacity 1s;
}
.v-enter {
  opacity: 0;
}
.v-enter-to {
  opacity: 1;
}
</style>

