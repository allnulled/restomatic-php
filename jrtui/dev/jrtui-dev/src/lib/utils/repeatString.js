export default (txt, repetitions) => {
    let out = "";
    for(let index = 0; index < repetitions; index++) {
      out += txt;
    }
    return out;
};