const esbuild = require("esbuild");
const path = require("path");

const watch = process.argv.includes("--watch");

const esbuildConfig = {
  entryPoints: ["app/javascript/application.js"],
  bundle: true,
  sourcemap: true,
  outdir: path.join("app", "assets", "builds"),
};

if (watch) {
  esbuild
    .context(esbuildConfig)
    .then((ctx) => {
      console.log("Watching for changes...");
      ctx.watch();
    })
    .catch(() => process.exit(1));
} else {
  esbuild
    .build(esbuildConfig)
    .then(() => {
      console.log("Build succeeded");
    })
    .catch(() => process.exit(1));
}