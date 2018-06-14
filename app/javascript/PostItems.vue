<template>
  <div>
    <ul v-loading="loading" class="post-list">
      <li v-for="post in pagingPosts" :key="post.id">
        <el-card class="box-card">
          <div slot="header" class="clearfix header">
            <h2>{{post.title}}</h2>
            <p>author: {{post.author}}</p>
          </div>
          <div class="text item">
            <div v-html="post.compiledMarkdown"></div>
          </div>
          <el-row>
            <el-button round :disabled="buttonDisabled" @click="addLikeNum(post.id)">拍手: {{post.likeNum}}</el-button>
          </el-row>
        </el-card>
      </li>
    </ul>
    <el-pagination
    background
    layout="prev, pager, next"
    :page-size="POSTS_PER_PAGE"
    :total="posts.length" :current-page.sync="currentPage">
    </el-pagination>
  </div>
</template>

<script>
import auth from "./auth.js";
import axios from "axios";
import marked from "marked";

axios.defaults.headers["Authorization"] = auth.getToken();

export default {
  name: "post-items",
  data: function() {
    return {
      posts: [],
      currentPage: 1,
      buttonDisabled: false,
      loading: true,
      POSTS_PER_PAGE: 10
    };
  },
  props: ["user_id"],
  mounted: function() {
    //this.fetchPosts(this.currentPage);
    this.fetchPostsAll();
  },
  watch: {
    currentPage: function(bef, af) {
      //this.fetchPosts(this.currentPage);
    }
  },
  computed: {
    pagingPosts: function() {
      return this.posts.slice(
        (this.currentPage - 1) * this.POSTS_PER_PAGE,
        this.currentPage * this.POSTS_PER_PAGE
      );
    }
  },
  methods: {
    fetchPosts: function(pageNum) {
      let url = "";
      if (this.user_id) url = `/api/users/${this.user_id}/posts`;
      else url = "/api/posts";
      axios.get(`${url}?page=${pageNum}`).then(
        res => {
          let tmp = res.data.posts;
          tmp.forEach(element => {
            element.compiledMarkdown = marked(element.content, {
              sanitize: true
            });
          });
          this.posts = tmp;
          this.loading = false;
        },
        error => {
          console.log(error);
        }
      );
    },
    fetchPostsAll: function() {
      let url = "";
      if (this.user_id) url = `/api/users/${this.user_id}/posts`;
      else url = "/api/posts";
      axios.get(`${url}`).then(
        res => {
          let tmp = res.data.posts;
          tmp.forEach(element => {
            element.compiledMarkdown = marked(element.content, {
              sanitize: true
            });
          });
          this.posts = tmp;
          this.loading = false;
        },
        error => {
          console.log(error);
        }
      );
    },
    addLikeNum: function(post_id) {
      this.buttonDisabled = true;
      axios.post(`/api/like/post/${post_id}`).then(
        res => {
          this.posts.find(el => {
            return el.id == post_id;
          }).likeNum++;
          this.buttonDisabled = false;
        },
        error => {
          console.log(error);
          this.buttonDisabled = false;
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
.post-list {
  min-height: 400px;
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
