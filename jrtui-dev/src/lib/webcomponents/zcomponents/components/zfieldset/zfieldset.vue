<template>
  <fieldset class="Component zfieldset">
    <zlegend v-if="legend">{{ legend }}</zlegend>
    <slot></slot>
  </fieldset>
</template>
<script>
  export default {
    props: {
      legend: {
        type: [String, Boolean],
        default: function () { return false }
      }
    },
    data() {
      return {};
    },
    methods: {},
    watch: {},
    computed: {},
    beforeCreate() {},
    created() {},
    beforeMount() {},
    mounted() {},
    beforeUpdate() {},
    updated() {},
    beforeUnmount() {},
    unmounted() {},
  };
</script>
<style>
  
</style>