<template>
  <div>
    <div>
      <input type='text' v-model="title" placeholder="タイトル">
    </div>
    <div>
      <textarea name='' id='' cols='30' rows='10' v-model="content" placeholder="本文"></textarea>
    </div>
    <div>
      <button @click="submitPost">投稿する</button>
    </div>
  </div>
</template>

<script>
import axios from "axios";

export default {
  data: function() {
    return {
      title: "",
      content: ""
    };
  },
  methods: {
    submitPost: function() {
      axios
        .post("/api/posts", {
          title: this.title,
          content: this.content
        })
        .then(
          res => {
            console.log(res);
            this.title = "";
            this.content = "";
          },
          error => {
            console.log(error);
          }
        );
    }
  }
};
</script>
