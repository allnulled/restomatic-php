export default {
  inserted(el, binding) {
    const { value = {} } = binding;
    const { handle = false } = value;
    const jQuery = window.jQuery;
    const options = {};
    if(handle) {
      options.handle = handle;
    } else {
      // @OK
    }
    jQuery(el).draggable(options);
  }
};