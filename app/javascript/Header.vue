<template>
  <div class="header">
      <el-menu :default-active="activeIndex" :router="true" mode="horizontal">
        <el-menu-item index="/"><h1 class="main-logo">道のり</h1></el-menu-item>
        <el-menu-item index="/about">道のりとは</el-menu-item>
        <el-menu-item index="/new">新規投稿</el-menu-item>
        <el-menu-item v-if="!isLoggedIn()" index="/login">ログイン</el-menu-item>
        <el-menu-item v-else index="/mypage">マイページ</el-menu-item>
      </el-menu>
  </div>
</template>

<script>
import auth from "./auth.js";

export default {
  name: "Header",
  data: function() {
    return {};
  },
  computed: {
    activeIndex: function() {
      return this.$route.fullPath;
    }
  },
  methods: {
    isLoggedIn: function() {
      return auth.isLoggedIn();
    }
  }
};
</script>

<style lang="scss" scoped>
.main-logo {
  display: inline;
}
</style>
