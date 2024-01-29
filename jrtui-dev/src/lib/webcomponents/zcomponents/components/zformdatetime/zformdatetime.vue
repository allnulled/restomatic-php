<template>
<div class="Component zformdatetime zformitem">
  <div class="zformlabel">
    <slot></slot>
  </div>
  <table class="zformdatetime_table">
    <tr>
      <td style="vertical-align:top;">
        <input type="text" class="zformdatetime_input" v-model="value" disabled="true" :name="name" />
      </td>
      <td style="vertical-align:top;">
        <button class="zformdatetime_button" v-on:click="toggle_calendar">...</button>
      </td>
    </tr>
  </table>
  <div v-if="is_showing_calendar">
    <vuejscalendario mode="datetime" :initial-value="value" :on-change="v => value = v"></vuejscalendario>
  </div>
</div>
</template>

<script>
export default {
  props: {
    initialValue: {
      type: String,
      default: function() { return "" }
    },
    name: {
      type: String,
      default: function () { return "default"; }
    }
  },
  data() {
    return {
      value: this.initialValue,
      is_showing_calendar: false
    };
  },
  methods: {
    toggle_calendar() {
      this.is_showing_calendar = !this.is_showing_calendar;
    }
  },
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
