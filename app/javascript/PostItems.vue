<template>
  <div>
    <el-pagination
    background
    layout="prev, next"
    :page-size="POSTS_PER_PAGE"
    :pager-count=5
    :total="posts.length" :current-page.sync="currentPage"
    @current-change="moveTop">
    </el-pagination>
    <ul v-loading="loading" class="post-list">
      <li v-for="post in pagingPosts" :key="post.id">
        <el-card class="box-card">
          <div slot="header" class="clearfix header">
            <h2>{{post.title}}</h2>
            <p>投稿者: {{post.author}}</p>
          </div>
          <div class="text item">
            <div v-html="post.compiledMarkdown"></div>
          </div>
          <el-row class="card-footer">
            <el-button round :disabled="buttonDisabled" @click="addLikeNum(post.id)">拍手: {{post.likeNum}}</el-button>
            <div class="date">投稿日: {{post.created_at | moment}}</div>
          </el-row>
        </el-card>
      </li>
    </ul>
    <el-pagination
    background
    layout="prev, next"
    :page-size="POSTS_PER_PAGE"
    :pager-count=5
    :total="posts.length" :current-page.sync="currentPage"
    @current-change="moveTop">
    </el-pagination>
  </div>
</template>

<script>
import auth from "./auth.js";
import axios from "axios";
import moment from "moment";
import marked from "marked";

moment.locale("ja");
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
  filters: {
    moment: function(date) {
      return moment(date).format("YYYY年 MMMM Do");
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
    },
    moveTop: function() {
      window.scroll({ top: 0, left: 0 });
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
.card-footer {
  display: flex;
  align-items: center;
  .date {
    font-size: 0.8rem;
    margin-left: 20px;
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
