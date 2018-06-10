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
  font-family: "Helvetica Neue", Helvetica, "PingFang SC", "Hiragino Sans GB",
    "Microsoft YaHei", "微软雅黑", Arial, sans-serif;
}
p {
  line-height: 1.65;
}
.el-dialog {
  min-width: 300px;
}
</style>
