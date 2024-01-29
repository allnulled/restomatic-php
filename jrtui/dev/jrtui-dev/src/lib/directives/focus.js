export default {
  inserted(el) {
    el.focus();
    console.log(el.tagName);
    OnNoInputs:
    if(el.tagName !== "INPUT") {
      const first_input_element = el.querySelectorAll("input,textarea,select")[0];
      console.log(first_input_element);
      if(!first_input_element) break OnNoInputs;
      first_input_element.focus();
    }
  }
};