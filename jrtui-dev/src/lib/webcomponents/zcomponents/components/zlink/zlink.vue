<template>
  <a class="zlink" :href="link">
    <slot></slot>
  </a>
</template>
<script>
  export default {
    props: {
      link: {
        type: String,
        default: "javascript:void(0)"
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