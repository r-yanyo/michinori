<template>
  <div id="app">
    <el-container>
      <el-header height="100%"><Header /></el-header>
      <el-main><Content /></el-main>
    </el-container>
  </div>
</template>

<script>
import Header from "./Header";
import Content from "./Content";

export default {
  components: { Header, Content }
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
  margin: 0;
  font-size: 15px;
  font-family: "Quicksand", "游ゴシック体", "Yu Gothic", YuGothic,
    "ヒラギノ角ゴシック Pro", "Hiragino Kaku Gothic Pro", "メイリオ", Meiryo,
    Osaka, "ＭＳ Ｐゴシック", "MS PGothic", sans-serif;
}
@media (min-width: 480px) {
  body {
    margin: 0 25px;
  }
}
p {
  line-height: 1.65;
}
.el-dialog {
  min-width: 300px;
}
.sy-vue-notify {
  a {
    float: right;
    font-size: 21px;
    font-weight: 700;
    line-height: 1;
    color: #000;
    text-shadow: 0 1px 0 #fff;
    filter: alpha(opacity=20);
    opacity: 0.2;
  }
}
</style>
