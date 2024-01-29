import Vue from "vue";
import App from "./App.vue";
import Check from "@allnulled/check-that";
import i18next from "i18next";
import VueI18Next from "@panter/vue-i18next";
import i18nResources from "./lib/i18n/resources.js";
import LanguageDetector from "i18next-browser-languagedetector";
import VueRouter from "vue-router";
import Push from "push.js";
import axios from "axios";
import routerFactory from "./lib/routes/factory.js";
import metadata from "./metadata.js";
import components from "./lib/webcomponents/all.js";
import storage from "./lib/database/storage.js";
import Database from "./lib/database/classes/Database.js";
import badges from "./lib/webcomponents/zcomponents/components/zbadgeport/badges.js";
import utils from "./lib/utils/all.js";
import directives from "./lib/directives/all.js";

const main = async function () {

  Vue.config.productionTip = false

  /* INTERNATIONALIZATION */
  Vue.use(VueI18Next);
  i18next.use(LanguageDetector).init({
    fallbackLng: "en",
    resources: i18nResources,
  });
  const i18n = new VueI18Next(i18next);

  /* FRAMEWORK */
  Vue.prototype.$check = Check;
  Vue.prototype.$storage = storage;
  Vue.prototype.$pushNotifications = Push;
  Vue.prototype.$badges = badges;
  Vue.prototype.$metadata = metadata;
  Vue.prototype.$utils = utils;
  Vue.prototype.$noop = () => 0;
  Vue.prototype.$window = window;
  Vue.prototype.$vue = Vue;
  Vue.prototype.$ajax = axios.create();

  // await Database.dropDatabaseIfExists(metadata.settings.database.id);
  Vue.prototype.$database = await Database.connect(metadata.settings.database.id, [
    /*
    [{
      note: "++id,name,contents,tags"
    }, function () {}]
    //*/
  ]);

  window.Vue = Vue;

  /* DIRECTIVES */
  for (let directive_id in directives) {
    const directive = directives[directive_id];
    Vue.directive(directive_id, directive);
  }

  /* COMPONENTS */
  for (let componentId in components) {
    Vue.component(componentId, components[componentId]);
  }

  /* ROUTER */
  Vue.use(VueRouter);
  const router = new VueRouter({ routes: routerFactory(components) });

  /* VUE */
  return new Vue({
    i18n,
    router,
    render: h => h(App),
  }).$mount("#app");

};

export default main();