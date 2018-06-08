import Vue from "vue";
import VueRouter from "vue-router";

import Index from "./Index";
import createPost from "./createPost";

Vue.use(VueRouter);

const router = new VueRouter({
  mode: "history",
  routes: [
    { path: "/", component: Index },
    { path: "/new", component: createPost }
  ]
});

export default router;
