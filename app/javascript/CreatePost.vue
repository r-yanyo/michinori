<template>
  <div>
    <flash animation="fade"></flash>
    <el-form ref="form" :model="form">
      <el-row :gutter="24">
        <el-col :span="24" :sm="12">
          <el-form-item label="タイトル">
            <el-input v-model="form.title" placeholder="例: 私が◯◯できるようになるまでの過程"></el-input>
          </el-form-item>
          <el-form-item label="投稿内容">
            <el-input type="textarea" v-model="form.content" rows=15 placeholder="内容 Markdown形式で書けます。"></el-input>
          </el-form-item>
        <el-form-item>
          <el-button type="primary" @click="dialogVisible = true">投稿する</el-button>
          <el-button @click="previewDialogVisible = true">プレビュー</el-button>
        </el-form-item>
        </el-col>
        <el-col :sm="12" class="sync-preview">
          <label class="label">プレビュー</label>
          <el-card class="box-card">
            <div slot="header" class="clearfix header">
              <h2>{{form.title}}</h2>
            </div>
            <div class="text item">
              <div v-html="compiledMarkdown"></div>
            </div>
          </el-card>
        </el-col>
      </el-row>
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
      :fullscreen="true">
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
import auth from "./auth.js";
import axios from "axios";
import marked from "marked";

axios.defaults.headers["Authorization"] = auth.getToken();
axios.defaults.headers["X-CSRF-TOKEN"] = document.querySelector(
  "meta[name=csrf-token]"
).content;

export default {
  name: "CreatePost",
  data: function() {
    return {
      form: {
        title: "",
        content: ""
      },
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
      else if (!this.form.title)
        this.$flash.notify("danger", "タイトルが必要です。");
      else if (!this.form.content)
        this.$flash.notify("danger", "投稿内容が必要です。");
    },
    submitPost: function() {
      axios.defaults.headers["Authorization"] = auth.getToken();
      axios
        .post("/api/posts", {
          title: this.form.title,
          content: this.form.content
        })
        .then(
          res => {
            if (res.status == 200) {
              this.form.title = "";
              this.form.content = "";
              this.$flash.notify("success", "投稿しました。");
            }
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
.alert {
  margin-bottom: 5px;
}
.sync-preview {
  display: none;
  .label {
    line-height: 40px;
  }
  .box-card {
    min-height: 430px;
    .header h2 {
      margin: 5px;
    }
    .item p {
      line-height: 40px;
    }
  }
}
@media (min-width: 768px) {
  .sync-preview {
    display: block;
  }
}
</style>
