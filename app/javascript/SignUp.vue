<template>
  <div>
    <flash animation="fade"></flash>
    <el-form ref="form" :model="form">
      <el-form-item label="名前">
        <el-input v-model="form.name" auto-complete="on"></el-input>
      </el-form-item>
      <el-form-item label="メールアドレス">
        <el-input v-model="form.email" auto-complete="on"></el-input>
      </el-form-item>
      <el-form-item label="Password">
        <el-input type="password" v-model="form.password" auto-complete="off"></el-input>
      </el-form-item>
      <el-form-item label="Passwordの確認">
        <el-input type="password" v-model="form.password_confirmation" auto-complete="off"></el-input>
      </el-form-item>
      <el-form-item>
        <el-button type="primary" @click="checkForm">サインアップ</el-button>
      </el-form-item>
    </el-form>
    <router-link to="/login">ログインする</router-link>
  </div>
</template>

<script>
import auth from "./auth.js";

export default {
  name: "SignUp",
  data: function() {
    return {
      form: {
        name: "",
        email: "",
        password: "",
        password_confirmation: ""
      }
    };
  },
  methods: {
    checkForm: function() {
      if (
        this.form.name &&
        this.form.email &&
        this.form.password &&
        this.form.password_confirmation
      )
        this.signup();
      else if (!this.form.name)
        this.$flash.notify("danger", "名前が必要です。");
      else if (!this.form.email)
        this.$flash.notify("danger", "メールアドレスが必要です。");
      else if (!this.form.password)
        this.$flash.notify("danger", "パスワードが必要です");
      else if (!this.form.password_confirmation)
        this.$flash.notify("danger", "パスワードの確認が必要です。");
    },
    signup: function() {
      auth
        .signup(
          this.form.name,
          this.form.email,
          this.form.password,
          this.form.password_confirmation
        )
        .catch(err => {
          this.$flash.notify("danger", "サインアップに失敗しました。");
        });
    }
  }
};
</script>

<style lang="scss" scoped>
</style>
