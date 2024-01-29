<template>
<div class="component SettingsPage">
  <zjumbotron>{{ $t("Settings") }}</zjumbotron>
  <ztitle>{{ $t("Settings") }}</ztitle>
  <zsubtitle>{{ $t("Language") }}</zsubtitle>
  <zlayout>
    <zformselect :initial-value="selected_language" :options="['English', 'Español', 'Català']" :on-change="v => selected_language = getLanguageIso(v)">
      <span>{{ $t("Select your language") }}:</span>
    </zformselect>
  </zlayout>
</div>
</template>

<script>
const LANGUAGE_CONFIGURATIONS = {
  isos: {
    "English": "en",
    "Español": "es",
    "Català": "ca"
  },
  languages: {
    "en": "English",
    "es": "Español",
    "ca": "Català"
  }
};

export default {
  name: "TareasPage",
  props: {},
  data() {
    return {
      ...LANGUAGE_CONFIGURATIONS,
      selected_language: LANGUAGE_CONFIGURATIONS.languages[this.$i18n.i18next.language]
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
    getLanguageIso(language) {
      return this.isos[language];
    }
  },
  watch: {
    selected_language: function (nuevo_valor) {
      this.$i18n.i18next.changeLanguage(nuevo_valor);

    }
  }
}
</script>

<style>
</style>
