<template>
  <div>
    <div v-for="(error, i) in errors" :key="i">
      <el-alert :title="error" type="error" :closable="false" class="error-alert"></el-alert>
    </div>
    <el-form ref="form" :model="form">
      <el-form-item>
        <el-input v-model="form.title" placeholder="例: 私が◯◯できるようになるまでの過程"></el-input>
      </el-form-item>
      <el-form-item >
        <el-input type="textarea" v-model="form.content" rows=15 
        placeholder="内容 Markdown形式で書けます。">
      </el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="dialogVisible = true, submitPost">投稿する</el-button>
        <el-button @click="previewDialogVisible = true">プレビュー</el-button>
      </el-form-item>
    </el-form>
    <el-dialog
      title="投稿確認"
      :visible.sync="dialogVisible">
      <span>本当に投稿しますか？</span>
      <span slot="footer" class="dialog-footer">
        <el-button type="primary" @click="dialogVisible = false, checkForm()">投稿する</el-button>
        <el-button @click="dialogVisible = false">やめる</el-button>
      </span>
    </el-dialog>
    <el-dialog
      title="プレビュー"
      :visible.sync="previewDialogVisible"
      :fullscreen=true>
      <el-card class="box-card">
        <div slot="header" class="clearfix header">
          <h2>{{form.title}}</h2>
        </div>
        <div class="text item">
          <div v-html="compiledMarkdown"></div>
        </div>
      </el-card>
    </el-dialog>
  </div>
</template>

<script>
import axios from "axios";
import marked from "marked";

axios.defaults.headers["X-CSRF-TOKEN"] = document.querySelector(
  "meta[name=csrf-token]"
).content;

export default {
  data: function() {
    return {
      form: {
        title: "",
        content: ""
      },
      errors: [],
      dialogVisible: false,
      previewDialogVisible: false
    };
  },
  computed: {
    compiledMarkdown: function() {
      return marked(this.form.content, { sanitize: true });
    }
  },
  methods: {
    checkForm: function() {
      if (this.form.title && this.form.content) this.submitPost();
      this.errors = [];
      if (!this.form.title) this.errors.push("タイトルが必要です。");
      if (!this.form.content) this.errors.push("投稿内容が必要です。");
    },
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

<style lang="scss" scoped>
.error-alert {
  margin-bottom: 5px;
}
</style>
