<template>
<div class="Component zformsearchbox searchbox">
  <input type="search" :placeholder="$t(placeholder)" v-model="value" v-on:keypress.enter="onSearch" :name="name" />
  <button aria-label="search" v-on:click="onSearch"></button>
</div>
</template>

<script>
export default {
  props: {
    initialValue: {
      type: String,
      default: function () {
        return ""
      }
    },
    onChange: {
      type: Function,
      default: function () {}
    },
    name: {
      type: String,
      default: function () {
        return "default";
      }
    },
    onSearch: {
      type: Function,
      default: function () {}
    },
    placeholder: {
      type: String,
      default: function () {
        return "Search here..."
      }
    }
  },
  data() {
    return {
      value: this.initialValue
    };
  },
  methods: {},
  watch: {
    value(new_value) {
      this.onChange(new_value, this);
    }
  },
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
