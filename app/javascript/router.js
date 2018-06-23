import Vue from "vue";
import VueRouter from "vue-router";

import Index from "./Index";
import About from "./About";
import PostItem from "./PostItem";
import CreatePost from "./CreatePost";
import Login from "./Login";
import MyPage from "./MyPage";
import SignUp from "./SignUp";

import auth from "./auth.js";

Vue.use(VueRouter);

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: Index },
    { path: "/about", component: About },
    { path: "/post/:id", component: PostItem },
    { path: "/new", component: CreatePost },
    { path: "/login", component: Login },
    { path: "/mypage", component: MyPage, meta: { requiresAuth: true } },
    { path: "/signup", component: SignUp }
  ]
});

// filter Page required Authorization
router.beforeEach((to, from, next) => {
  if (
    to.matched.some(record => record.meta.requiresAuth) &&
    !auth.isLoggedIn()
  ) {
    next({ path: "/login" });
  } else {
    next();
  }
});

export default router;
