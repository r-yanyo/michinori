<template>
  <div>
    <el-form ref="form" :model="form">
      <el-form-item>
        <el-input v-model="form.title" placeholder="title"></el-input>
      </el-form-item>
      <el-form-item >
        <el-input type="textarea" v-model="form.content" placeholder="content"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="submitPost">投稿する</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: function() {
    return {
      form: {
        title: "",
        content: ""
      }
    };
  },
  methods: {
    submitPost: function() {
      axios
        .post("/api/posts", {
          title: this.form.title,
          content: this.form.content
        })
        .then(
          res => {
            console.log(res);
            this.form.title = "";
            this.form.content = "";
          },
          error => {
            console.log(error);
          }
        );
    }
  }
};
</script>
