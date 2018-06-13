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
        <el-button type="primary" @click="submit">送信する</el-button>
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import axios from "axios";
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
    submit: function() {
      auth.login(this.form.email, this.form.password);
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
