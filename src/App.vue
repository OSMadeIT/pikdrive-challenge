<template>
<div>
  <side-menu />
  <main class="col-md-9 ms-sm-auto col-lg-10 px-md-4">
      <router-view></router-view>
  </main>
</div>
</template>

<script>
import SideMenu from './components/menu/side_menu.vue'

export default {
  name: 'App',
  components: {
    SideMenu,
  }
}
</script>

<style>
@import '../src/assets/custom.css';
</style>
