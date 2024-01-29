const fs = require("fs");
const path = require("path");

fs.readdirSync(__dirname).forEach(f_name => {
  if(f_name === "build-docs.js") return;
  const f = path.resolve(__dirname, f_name);
  console.log("[*] Creating md file for: " + f);
  const output_file = f + "/" + f_name + ".md";
  fs.writeFileSync(output_file,
    "Back to [src/components/zcomponents/zcomponents.md](../../zcomponents.md)\n\n# "
    + f_name
    + "\n\n - See [Vue.js (v2) component file contents](./"
    + f_name
    + ".vue)\n - See [Sass/Css component file contents](./"
    + f_name
    + ".scss)\n",
  "utf8");
});