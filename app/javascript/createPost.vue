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
        <el-button type="primary" @click="dialogVisible = true, submitPost">投稿する</el-button>
      </el-form-item>
    </el-form>
    <el-dialog
      title="投稿確認"
      :visible.sync="dialogVisible">
      <span>本当に投稿しますか？</span>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="dialogVisible = false">投稿する</el-button>
        <el-button @click="dialogVisible = false">やめる</el-button>
      </span>
    </el-dialog>
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
      },
      dialogVisible: false
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
            this.form.title = "";
            this.form.content = "";
          },
          error => {
            console.log(error);
          }
        );
    },
    handleClose(done) {
      this.$confirm("Are you sure to close this dialog?")
        .then(_ => {
          done();
        })
        .catch(_ => {});
    }
  }
};
</script>

