<template>
<div class="Component zformfield zformitem">
  <div class="zformlabel">
    <slot></slot>
  </div>
  <div>
    <input
      class="zformfield_input"
      type="text"
      :name="name"
      :placeholder="placeholder"
      v-model="value"
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
    placeholder: {
      type: String,
      default: function () { return ""; }
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
