<template>
    <div class="Component znavigationpanel">
      <template v-if="is_opened">
        <div class="navigation_background" v-on:click="closeState"></div>
        <div class="position_fixed top_0 left_0 right_0 bottom_0">
          <div class="position_relative">
            <div class="position_absolute top_0 navigation_component" style="z-index:9999;" :class="{ is_selected: is_opened }">
              <div class="padding_2 navigation_height_compensation" style="margin-top: 2px; margin-bottom: 2px;">{{ $t("Navigation") }}</div>
              <ul class="margin_0 padding_0 list_style_type_none width_100x100">
                <li class="width_100x100" v-on:click="() => is_opened = false">
                  <router-link to="/">
                    <button class="width_100x100">{{ $t("Home") }}</button>
                  </router-link>
                </li>
                <li class="width_100x100" v-on:click="() => is_opened = false">
                  <router-link to="/about-us">
                    <button class="width_100x100">{{ $t("About us") }}</button>
                  </router-link>
                </li>
                <li class="width_100x100" v-on:click="() => is_opened = false">
                  <router-link to="/contact">
                    <button class="width_100x100">{{ $t("Contact") }}</button>
                  </router-link>
                </li>
                <li class="width_100x100" v-on:click="() => is_opened = false">
                  <router-link to="/settings">
                    <button class="width_100x100">{{ $t("Settings") }}</button>
                  </router-link>
                </li>
                <li class="width_100x100" v-on:click="() => is_opened = false">
                  <router-link to="/zcomponents">
                    <button class="width_100x100">{{ $t("All zcomponents") }}</button>
                  </router-link>
                </li>
                <li class="width_100x100" v-on:click="() => is_opened = false">
                  <a href="https://github.com/allnulled/vue-boilerplate-better" target="_blank">
                    <button class="width_100x100">{{ $t("Github page") }}</button>
                  </a>
                </li>
              </ul>
            </div>
          </div>
        </div>
      </template>
    </div>
</template>

<script>
export default {
    props: {},
    data() {
      return {
        is_opened: false
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
      toggleState() {
        this.is_opened = !this.is_opened;
        this.$forceUpdate(true);
      },
      closeState() {
        this.is_opened = false;
        this.$forceUpdate(true);
      }
    }

}
</script>

<style>
</style>