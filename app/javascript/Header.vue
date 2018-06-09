<template>
  <div>
    <el-menu :default-active="$route.fullPath" :router="true" class="el-menu-demo" mode="horizontal" @select="handleSelect">
      <el-menu-item index="/">TOP</el-menu-item>
      <el-menu-item index="about">ABOUT</el-menu-item>
      <el-menu-item index="new">新規投稿</el-menu-item>
    </el-menu>
  </div>
</template>

<script>
export default {
  data: function() {
    return {
      activeIndex: "1"
    };
  },
  methods: {
    handleSelect(key, keyPath) {
      console.log(this.activeIndex);
    }
  }
};
</script>
