<template>
  <div class="header">
      <el-menu :default-active="activeIndex" :router="true" class="el-menu-demo" mode="horizontal">
        <el-menu-item index="/"><h1 class="main-logo">道のり</h1></el-menu-item>
        <el-menu-item index="/about">道のりとは</el-menu-item>
        <el-menu-item index="/new">新規投稿</el-menu-item>
        <el-menu-item index="/login">ログイン</el-menu-item>
      </el-menu>
  </div>
</template>

<script>
export default {
  data: function() {
    return {};
  },
  computed: {
    activeIndex: function() {
      return this.$route.fullPath;
    }
  }
};
</script>

<style lang="scss" scoped>
.main-logo {
  display: inline;
}
</style>
