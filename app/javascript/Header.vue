<template>
  <div>
    <el-menu :default-active="activeIndex" :router="true" class="el-menu-demo" mode="horizontal">
      <el-menu-item index="/">TOP</el-menu-item>
      <el-menu-item index="/about">ABOUT</el-menu-item>
      <el-menu-item index="/new">新規投稿</el-menu-item>
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
