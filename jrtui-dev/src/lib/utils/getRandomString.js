const DEFAULT_ALPHABET = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

export default (len = 10, alphabet = DEFAULT_ALPHABET) => {
    let output = "";
    for(let i = 0; i < len; i++) {
      const c = alphabet[Math.floor(Math.random() * alphabet.length)]
      output += c;
    }
    return output;
};