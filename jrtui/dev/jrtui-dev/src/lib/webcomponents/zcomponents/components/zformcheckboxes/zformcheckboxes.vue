<template>
<div class="Component zformcheckboxes zformitem">
  <div class="zformlabel">
    <slot></slot>
  </div>
  <div>
    <div v-for="option, option_index in options" v-bind:key="'option-' + option_index">
      <div v-on:click="() => select_option(option_index)">
        <input class="zformcheckboxes_input" type="checkbox" :checked="value.indexOf(option) !== -1 ? 'checked' : ''" :name="name" />
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
      type: Array,
      default: function () {
        return []
      }
    },
    onChange: {
      type: Function,
      default: function () {}
    },
    options: {
      type: Array,
      required: true
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
    select_option(option_index) {
      const option = this.options[option_index];
      const position = this.value.indexOf(option);
      if(position === -1) {
        this.value.push(option);
      } else {
        this.value.splice(position, 1);
      }
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
