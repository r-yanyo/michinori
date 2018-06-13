<template>
  <div>
    <el-form ref="form" :model="form">
      <el-form-item>
        <el-button type="danger" @click="logout">ログアウト</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import auth from "./auth.js";

export default {
  data: function() {
    return {
      form: {
        email: "",
        password: ""
      }
    };
  },
  methods: {
    logout: function() {
      auth.logout();
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
