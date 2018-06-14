<template>
  <div>
    <el-form ref="form" :model="form">
      <el-form-item label="メールアドレス">
        <el-input v-model="form.email" auto-complete="on"></el-input>
      </el-form-item>
      <el-form-item label="Password">
        <el-input type="password" v-model="form.password" auto-complete="off"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="login">ログイン</el-button>
      </el-form-item>
    </el-form>
    <router-link to="/signup">アカウントを持っていない</router-link>
  </div>
</template>

<script>
import auth from "./auth.js";

export default {
  name: "Login",
  data: function() {
    return {
      form: {
        email: "",
        password: ""
      }
    };
  },
  methods: {
    login: function() {
      auth.login(this.form.email, this.form.password);
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
