<template>
<div>
  <post-items></post-items>
</div>
</template>

<script>
import PostItems from "./PostItems";

export default {
  name: "Index",
  data: function() {
    return {};
  },
  components: { "post-items": PostItems }
};
</script>
