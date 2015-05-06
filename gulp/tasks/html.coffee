changed = require("gulp-changed")
gulp = require("gulp")
config = require("../config").html

gulp.task "html", (->
  return gulp.src(config.src)
    .pipe(changed(config.dest))
    .pipe(gulp.dest(config.dest)))
