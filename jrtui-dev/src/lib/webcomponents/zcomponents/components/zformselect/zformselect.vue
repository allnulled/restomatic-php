<template>
<div class="Component zformselect zformitem">
  <div class="zformlabel">
    <slot></slot>
  </div>
  <div>
    <select class="zformselect_input" v-model="value" :name="name">
      <option v-for="option, option_index in options" v-bind:key="'option-' + option_index">
        {{ option }}
      </option>
    </select>
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
    options: {
      type: Array,
      required: true
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
