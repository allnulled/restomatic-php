<template>
<div class="Component zformcheckbox zformitem">
  <div class="zformlabel">
    <slot></slot>
  </div>
  <div>
    <div v-on:click="toggle_option">
      <input class="zformcheckbox_input" type="checkbox" v-model="value" :name="name" />
      <label>{{ value ? messageOn : messageOff }}</label>
    </div>
  </div>
</div>
</template>

<script>
export default {
  props: {
    initialValue: {
      type: Boolean,
      default: function () {
        return false
      }
    },
    onChange: {
      type: Function,
      default: function () {}
    },
    name: {
      type: String,
      default: function () { return "default" }
    },
    messageOn: {
      type: String,
      default: function() {return "Yes"}
    },
    messageOff: {
      type: String,
      default: function() {return "No"}
    }
  },
  data() {
    return {
      value: this.initialValue
    };
  },
  methods: {
    toggle_option() {
      this.value = !this.value;
    }
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
