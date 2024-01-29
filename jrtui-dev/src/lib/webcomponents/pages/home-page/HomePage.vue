<template>
<div class="component HomePage">
  <zjumbotron>{{ $t("Home") }}</zjumbotron>
  <ztitle>{{ $t("Home") }}</ztitle>
  <zspacedlayoutnopaddingvertical>
    <zparagraph>{{$t("Home page")}}.</zparagraph>
  </zspacedlayoutnopaddingvertical>
</div>
</template>

<script>
export default {
  name: "HomePage",
  props: {},
  data() {
    return {
      projects: {}
    };
  },
  methods: {},
  beforeCreate() {},
  created() {},
  beforeMount() {},
  async mounted() {
    try {
        this.$utils.trace("HomePage.mounted");
      
    } catch (error) {
      console.log(error);
      this.$dialogs.error(error);
    }
  },
  beforeUpdate() {},
  updated() {},
  beforeUnmount() {},
  unmounted() {},
  activated() {},
  deactivated() {},

}
</script>

<style>
</style>
