<template>
  <div class="header">
    <div class="main-logo">
      <router-link to="/"><h1>道のり</h1></router-link>
    </div>
    <div class="menus">
      <el-menu :default-active="activeIndex" :router="true" class="el-menu-demo" mode="horizontal">
        <el-menu-item index="/about">このアプリについて</el-menu-item>
        <el-menu-item index="/new">新規投稿</el-menu-item>
      </el-menu>
    </div>
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
.header {
  display: flex;
}
.main-logo a {
  text-decoration: none;
}
</style>

