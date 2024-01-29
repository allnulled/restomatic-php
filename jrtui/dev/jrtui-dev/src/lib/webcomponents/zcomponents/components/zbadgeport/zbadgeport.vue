<template>
<div class="Component zbadgeviewer">
  <div class="position_fixed bottom_0 left_0 right_0">
    <div class="badge_viewer">
      <div class="window" :class="'badge_type_' + badge.mode" v-for="(badge, badgeIndex) in current_badges" v-bind:key="'badge-id-' + badgeIndex" v-on:click="badge.close">
        <div class="title-bar">
          <div class="title-bar-text">{{ $t(badge.title) }}</div>
        </div>
        <div class="window-body padding_1">{{ $t(badge.message) }}</div>
        <div class="status-bar" v-if="badge.footer">
          <div class="status-bar-field">{{ $t(badge.footer) }}</div>
        </div>
      </div>
    </div>
  </div>
</div>
</template>

<script>
const DEFAULT_BADGE_OPTIONS = {
  title: "",
  message: "...",
  footer: false,
  mode: "inform",
  timeout: 5000,
};

export default {
  name: "zbadgeviewer",
  props: {},
  data() {
    return {
      current_badges: [],
    };
  },
  beforeCreate() {},
  created() {},
  beforeMount() {},
  mounted() {},
  beforeUpdate() {},
  updated() {},
  beforeUnmount() {},
  unmounted() {},
  activated() {},
  deactivated() {},
  methods: {

    send(badgeOptionsParameter = {}) {
      const id = this.$utils.getRandomString(10);
      const options = Object.assign({}, DEFAULT_BADGE_OPTIONS, badgeOptionsParameter, {
        id
      });
      const close = () => {
        const position = this.current_badges.indexOf(options);
        clearTimeout(options.timeout_id);
        this.current_badges.splice(position, 1);
      };
      options.close = close;
      this.current_badges.unshift(options);
      options.timeout_id = setTimeout(close, options.timeout);
      return {
        badge: options,
        close
      };
    },

    closeAll() {
      this.current_badges = [];
    }

  }
}
</script>

<style>
</style>
