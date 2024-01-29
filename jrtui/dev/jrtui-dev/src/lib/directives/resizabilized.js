export default {
  inserted(el) {
    const jQuery = window.jQuery;
    const options = {};
    jQuery(el).resizable(options);
  }
};