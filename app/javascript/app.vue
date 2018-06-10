<template>
  <div id="app">
    <el-container>
      <el-header><Header /></el-header>
      <el-main><Content /></el-main>
    </el-container>
  </div>
</template>

<script>
import Header from "./Header";
import Content from "./Content";
import createPost from "./createPost";

export default {
  components: { Header, Content, createPost }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>

<style lang="scss">
body {
  font-size: 15px;
  font-family: "Quicksand", "游ゴシック体", "Yu Gothic", YuGothic,
    "ヒラギノ角ゴシック Pro", "Hiragino Kaku Gothic Pro", "メイリオ", Meiryo,
    Osaka, "ＭＳ Ｐゴシック", "MS PGothic", sans-serif;
}
p {
  line-height: 1.65;
}
.el-dialog {
  min-width: 300px;
}
</style>
