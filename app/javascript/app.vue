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
p {
  line-height: 30px;
}
.el-dialog {
  min-width: 300px;
}
</style>
