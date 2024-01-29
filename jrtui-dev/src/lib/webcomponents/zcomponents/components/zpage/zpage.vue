<template>
  <div class="Component zpage">
    <ztitle v-if="title">{{ title }}</ztitle>
    <div class="contents">
      <div class="page">
        <slot></slot>
      </div>
    </div>
  </div>
</template>
<script>
  export default {
    props: {
      title: {
        type: String,
        default: function() {return ""}
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