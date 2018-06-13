import Vue from "vue";
import VueRouter from "vue-router";

import Index from "./Index";
import About from "./About";
import CreatePost from "./CreatePost";
import Login from "./Login";
import MyPage from "./MyPage";

Vue.use(VueRouter);

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: Index },
    { path: "/about", component: About },
    { path: "/new", component: CreatePost },
    { path: "/login", component: Login },
    { path: "/mypage", component: MyPage }
  ]
});

export default router;
