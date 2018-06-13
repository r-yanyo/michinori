import axios from "axios";
import router from "./router.js";

export default {
  login: function(email, password) {
    axios
      .post("/api/sessions", {
        email,
        password
      })
      .then(res => {
        const post = res.data.post;
        this.setAccessToken(post.id, post.remember_token);
        router.push("/mypage");
      })
      .catch(err => {
        console.log(err);
      });
  },
  logout: function() {
    axios
      .delete(`/api/sessions`)
      .then(res => {
        localStorage.removeItem("user_id");
        localStorage.removeItem("token");
        router.push("/login");
      })
      .catch(err => {
        console.log(err);
      });
  },
  setAccessToken: function(id, token) {
    localStorage.setItem("user_id", id);
    localStorage.setItem("token", token);
  },
  isLoggedIn: function() {
    return !!localStorage.getItem("token");
  },
  getUserId: function() {
    return localStorage.getItem("user_id");
  },
  getToken: function() {
    return localStorage.getItem("token");
  }
};
