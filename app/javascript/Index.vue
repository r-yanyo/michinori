<template>
<div>
  <post-items :user_id="getUserId()"></post-items>
</div>
</template>

<script>
import auth from "./auth.js";
import PostItems from "./PostItems";

export default {
  name: "Index",
  data: function() {
    return {};
  },
  methods: {
    getUserId: function() {
      return auth.getUserId();
    }
  },
  components: { "post-items": PostItems }
};
</script>
