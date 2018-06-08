<template>
  <div id="app">
    <Header />
    <Content />
  </div>
</template>

<script>
import Header from "./Header";
import Content from "./Content";
import createPost from "./createPost";

export default {
  components: { Header, Content, createPost }
};
</script>

<style scoped>
p {
  font-size: 2em;
  text-align: center;
}
</style>
