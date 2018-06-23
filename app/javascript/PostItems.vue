<template>
  <div>
    <flash-float animation="fade"></flash-float>
    <el-input placeholder="投稿を検索する" v-model="searchValue" prefix-icon="el-icon-search" class="search-box">
    </el-input>
    <el-pagination
    background
    layout="prev, next"
    :page-size="POSTS_PER_PAGE"
    :pager-count=5
    :total="searchedPosts.length" :current-page.sync="currentPage"
    @current-change="moveTop">
    </el-pagination>
    <ul v-loading="loading" :fullscreen="false" class="post-list">
      <li v-for="post in pagingPosts" :key="post.id">
        <el-card class="box-card">
          <div slot="header" class="clearfix header">
            <h2><router-link :to="{ path: `post/${post.id}`}">{{post.title}}</router-link></h2>
            <p>投稿者: {{post.author}}</p>
          </div>
          <div class="text item">
            <div v-html="post.compiledMarkdown"></div>
          </div>
          <div class="card-footer">
            <el-row>
              <div>
                <div class="date">投稿日: {{post.created_at | moment}}</div>
              </div>
            </el-row>
            <el-row>
              <div>
                <el-button round :disabled="buttonDisabled" @click="addLikeNum(post.id)">拍手: {{post.likeNum}}</el-button>
                <el-button v-if="isDeletable(post)" :disabled="deleteButtonDisabled" round @click="dialogVisible = true, selectedPost = post.id">削除する</el-button>
                <el-button round @click="tweet(post)"><i class="fab fa-twitter"></i></el-button>
              </div>
            </el-row>
          </div>
        </el-card>
      </li>
    </ul>
    <el-pagination
    background
    layout="prev, next"
    :page-size="POSTS_PER_PAGE"
    :pager-count=5
    :total="searchedPosts.length" :current-page.sync="currentPage"
    @current-change="moveTop">
    </el-pagination>
    <el-dialog
      title="削除確認"
      :visible.sync="dialogVisible">
      <span>本当に削除しますか？</span>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="dialogVisible = false, removePost(selectedPost)">削除する</el-button>
        <el-button @click="dialogVisible = false">やめる</el-button>
      </span>
    </el-dialog>
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
      searchValue: "",
      buttonDisabled: false,
      deleteButtonDisabled: false,
      loading: true,
      POSTS_PER_PAGE: 10,
      selectedPost: null,
      dialogVisible: false
    };
  },
  props: ["fetch_user_id", "user_id"],
  mounted: function() {
    this.fetchPostsAll();
  },
  watch: {
    searchValue: function(bef, af) {
      this.currentPage = 1;
    }
  },
  computed: {
    searchedPosts: function() {
      return this.posts.filter(post => post.title.includes(this.searchValue));
    },
    pagingPosts: function() {
      return this.searchedPosts.slice(
        (this.currentPage - 1) * this.POSTS_PER_PAGE,
        this.currentPage * this.POSTS_PER_PAGE
      );
    }
  },
  filters: {
    moment: function(date) {
      return moment(date).format("YYYY年 MMMMDo");
    },
    twitterShareUrl: function(post) {
      return `https://twitter.com/intent/tweet?url=https://michinori.herokuapp.com/post/${
        post.id
      }&text=${post.title}`;
    }
  },
  methods: {
    fetchPosts: function(pageNum) {
      let url = "";
      if (this.fetch_user_id) url = `/api/users/${this.fetch_user_id}/posts`;
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
      if (this.fetch_user_id) url = `/api/users/${this.fetch_user_id}/posts`;
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
    removePost: function(post_id) {
      this.deleteButtonDisabled = true;
      axios.delete(`/api/posts/${post_id}`).then(
        res => {
          console.log(res);
          this.deleteButtonDisabled = false;
          this.fetchPostsAll();
          this.$flash.notify("success", "投稿を削除しました。");
        },
        error => {
          console.log(error);
          this.deleteButtonDisabled = false;
          this.$flash.notify("danger", "投稿の削除に失敗しました。");
        }
      );
    },
    isDeletable: function(post) {
      //adminである || 名無しの投稿でない && 自分の投稿である
      return (
        this.user_id == 1 ||
        (post.user_id == this.user_id && post.user_id !== null)
      );
    },
    moveTop: function() {
      window.scroll({ top: 0, left: 0 });
    },
    tweet: function(post) {
      window.open(
        `https://twitter.com/intent/tweet?url=https://michinori.herokuapp.com/post/${
          post.id
        }&text=${post.title}`
      );
    }
  }
};
</script>

<style lang="scss" scoped>
a {
  color: #333;
  text-decoration: none;
}
a:hover {
  color: #00a3e2;
}
ul {
  padding: 0;
}
li {
  list-style: none;
}
.search-box {
  margin-bottom: 10px;
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
  align-items: center;
  margin-top: 20px;
  .date {
    font-size: 0.8rem;
    margin: 10px 0;
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
