<template>
  <div>
    <el-form ref="form" :model="form">
      <el-form-item>
        <el-button type="danger" @click="logout">ログアウト</el-button>
      </el-form-item>
    </el-form>
    <post-items :user_id="getUserId()" :fetch_user_id="getUserId()" />
  </div>
</template>

<script>
import auth from "./auth.js";
import PostItems from "./PostItems";

export default {
  name: "MyPage",
  data: function() {
    return {
      form: {
        email: "",
        password: ""
      }
    };
  },
  methods: {
    getUserId: function() {
      return auth.getUserId();
    },
    logout: function() {
      auth.logout();
    }
  },
  components: { "post-items": PostItems }
};
</script>

<style lang="scss" scoped>
</style>
