<template>
<div class="Component zformcombobox zformitem">
  <div class="zformlabel">
    <slot></slot>
  </div>
  <div>
    <div v-for="option, option_index in options" v-bind:key="'option-' + option_index">
      <div v-on:click="() => select_option(option_index)">
        <input class="zformcombobox_input" type="radio" :checked="option === value ? 'checked' : ''" />
        <label>{{ option }}</label>
      </div>
    </div>
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
    select_option(option_index) {
      this.value = this.options[option_index];
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
