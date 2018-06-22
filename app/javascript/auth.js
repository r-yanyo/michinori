import axios from "axios";
import router from "./router.js";

export default {
  login: function(email, password) {
    const vm = this;
    return new Promise(function(resolve, reject) {
      axios
        .post("/api/sessions", {
          email,
          password
        })
        .then(res => {
          const user = res.data.user;
          vm.setAccessToken(user.id, user.remember_token);
          router.push("/mypage");
          resolve(res);
        })
        .catch(err => {
          console.log(err);
          reject(err);
        });
    });
  },
  logout: function() {
    axios
      .delete(`/api/sessions`)
      .then(res => {
        document.cookie = "user_id=; max-age=0";
        document.cookie = "token=; max-age=0";
        router.push("/login");
      })
      .catch(err => {
        console.log(err);
      });
  },
  signup: function(name, email, password, password_confirmation) {
    return new Promise(function(resolve, reject) {
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
          resolve(res);
        })
        .catch(err => {
          console.log(err);
          reject(err);
        });
    });
  },
  setAccessToken: function(id, token) {
    document.cookie = `user_id=${id};`;
    document.cookie = `token=${token}`;
  },
  isLoggedIn: function() {
    const cookies = this.getCookieArray();
    return !!cookies["token"];
  },
  getUserId: function() {
    const cookies = this.getCookieArray();
    return cookies["user_id"];
  },
  getToken: function() {
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
