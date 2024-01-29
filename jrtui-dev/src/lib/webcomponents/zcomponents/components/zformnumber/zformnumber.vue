<template>
<div class="Component zformnumber zformitem">
  <div class="zformlabel">
    <slot></slot>
  </div>
  <div>
    <input
      class="zformnumber_input"
      type="number"
      v-model="value"
      :name="name"
    />
  </div>
</div>
</template>

<script>
export default {
  props: {
    initialValue: {
      type: Number,
      default: function () {
        return 0
      }
    },
    onChange: {
      type: Function,
      default: function () {}
    },
    name: {
      type: String,
      default: function () { return "default"; }
    }
  },
  data() {
    return {
      value: this.initialValue
    };
  },
  methods: {

  },
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
