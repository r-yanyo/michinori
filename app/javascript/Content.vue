<template>
  <div class="content">

    <keep-alive include="CreatePost">
      <router-view />
    </keep-alive>
  </div>
</template>

<script>
</script>

<style lang="scss" scoped>
.content {
  min-height: 100%;
}
</style>
