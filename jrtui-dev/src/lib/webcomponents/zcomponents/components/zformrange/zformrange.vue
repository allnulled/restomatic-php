<template>
<div class="Component zformrange zformitem">
  <div class="zformlabel">
    <slot></slot>
  </div>
  <div>
    <input
      class="zformrange_input"
      type="range"
      :min="minimum"
      :max="maximum"
      :step="step"
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
      default: function () { return "default"; }
    },
    minimum: {
      type: Number,
      default: function () { return 0; }
    },
    maximum: {
      type: Number,
      default: function () { return 100; }
    },
    step: {
      type: Number,
      default: function () { return 10 }
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
