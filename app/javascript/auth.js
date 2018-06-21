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
        const user = res.data.user;
        console.log(user);
        this.setAccessToken(user.id, user.remember_token);
        router.push("/mypage");
      })
      .catch(err => {
        console.log(err);
        return false;
      });
  },
  logout: function() {
    axios
      .delete(`/api/sessions`)
      .then(res => {
        // localStorage.removeItem("user_id");
        // localStorage.removeItem("token");
        document.cookie = "user_id=; max-age=0";
        document.cookie = "token=; max-age=0";
        router.push("/login");
      })
      .catch(err => {
        console.log(err);
      });
  },
  signup: function(name, email, password, password_confirmation) {
    axios
      .post(`api/users`, {
        user: {
          name,
          email,
          password,
          password_confirmation
        }
      })
      .then(res => {
        router.push("/login");
      })
      .catch(err => {
        console.log(err);
      });
  },
  setAccessToken: function(id, token) {
    // localStorage.setItem("user_id", id);
    // localStorage.setItem("token", token);
    document.cookie = `user_id=${id};`;
    document.cookie = `token=${token}`;
  },
  isLoggedIn: function() {
    // return !!localStorage.getItem("token");
    const cookies = this.getCookieArray();
    return !!cookies["token"];
  },
  getUserId: function() {
    // return localStorage.getItem("user_id");
    const cookies = this.getCookieArray();
    return cookies["user_id"];
  },
  getToken: function() {
    // return localStorage.getItem("token");
    const cookies = this.getCookieArray();
    return cookies["token"];
  },
  getCookieArray: function() {
    let arr = [];
    if (document.cookie != "") {
      const tmp = document.cookie.split("; ");
      for (let i = 0; i < tmp.length; i++) {
        const data = tmp[i].split("=");
        arr[data[0]] = decodeURIComponent(data[1]);
      }
    }
    return arr;
  }
};
