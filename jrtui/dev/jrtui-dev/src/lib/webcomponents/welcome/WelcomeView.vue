<template>
<div class="component WelcomeView">
  <div class="welcome_view_container" v-on:click="() => $root.is_loaded = true">
    <div class="display_table width_100x100 height_100x100">
      <div class="display_table_cell width_100x100 height_100x100 vertical_align_middle text_align_center">
        <span class="vertical_align_middle text_align_center">
          {{ $t("Welcome") }}
        </span>
      </div>
    </div>
  </div>
</div>
</template>

<script>
export default {
  name: "WelcomeView",
  props: {},
  data() {
    return {};
  },
  beforeCreate() {},
  created() {},
  beforeMount() {},
  mounted() {},
  beforeUpdate() {},
  updated() {},
  beforeUnmount() {},
  unmounted() {},
  activated() {},
  deactivated() {},

}
</script>

<style>
.welcome_view_container {
  position: fixed;
  top: 0;
  left: 0;
  right: 0;
  bottom: 0;
  background-color: #FFFFFF;
  color: #333333;
  z-index: 99999;
}
</style>
