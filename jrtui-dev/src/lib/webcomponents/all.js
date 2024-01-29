// @TODO: drop this line when you caught the thing:
import pages from "./pages/pages.js";
import zcomponents from "./zcomponents/zcomponents.js";
import WelcomeView from "./welcome/WelcomeView.vue";

export default {
    WelcomeView,
    ...pages,
    ...zcomponents
};