gulp = require("gulp")

gulp.task "build", [
  "browserify"
  "jade"
  "html"
  "sass"
  "images"
]