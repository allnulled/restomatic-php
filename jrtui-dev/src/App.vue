<template>
  <div id="app" class="win7">
    <div class="app_static">
      <zbadgeport ref="zbadgeport" />
      <zdialogport />
      <znavigationpanel ref="znavigationpanel" :root="this" />
    </div>
    <ApplicationPage />
  </div>
</template>

<script>
import "./lib/styles/all.css";

export default {
  name: "App",
  components: {},
  data() {
    return {
      is_loaded: false,
    };
  },
  methods: {
    goToPath(newPath) {
      if(this.$route.path !== newPath) {
        this.$router.push(newPath);
      }
    }
  },
  async beforeCreate() {
    try {
      this.$root = this;
      await this.$storage.initialize();
      await this.$database.initialize();
    } catch (error) {
      console.error("Error loading App (on beforeCreate):", error);
    }
  },
  created() {},
  beforeMount() {

  },
  async mounted() {
    try {
      await this.$badges.initialize(this);
      await this.$badges.send({ title: "Welcome", message: "" + this.$metadata.app + " (v" + this.$metadata.version + ")"});
      await this.$utils.timeout(3000);
      this.is_loaded = true;
    } catch (error) {
      console.error("Error loading App (on mounted):", error);
    }
    // @TOREMOVE: Just for debug purposes:
    window.app = this;
  },
  beforeUpdate() {},
  updated() {},
  beforeUnmount() {},
  unmounted() {},
  activated() {},
  deactivated() {},
};
</script>

<style>
@font-face {
  font-family: "Roboto";
  src: local("Roboto"), url(./lib/assets/fonts/Roboto/Roboto-Regular.ttf);
}
#app {
  font-family: Roboto, Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  color: #2c3e50;
  margin-top: 0px;
}
.navigation_button {
  width: 100%;
  height: 100%;
  border: 1px solid #DDDDDD;
  border-left: 0px;
  padding: 10px;
  cursor: pointer;
  font-size: 17px;
  color: #333333;
  text-shadow: 0 0 1px #333333;
  text-transform: uppercase;
  background-color: #FFFFFF;
}
.navigation_button:hover {
  background-color: #EEEEEE;
}
.navigation_button.selected {
  background-color: #DDDDDD;
}
</style>
