gulp = require("gulp")
browserSync = require("browser-sync")
handleErrors = require("../util/handleErrors")
jade = require('gulp-jade')
rename = require('gulp-rename')
config = require("../config")

gulp.task "jade", (->

  # app.html
  gulp.src(config.jade.src).pipe(jade()).on("error", handleErrors)
    .pipe(gulp.dest(config.jade.dest))
    .pipe(browserSync.reload(stream: true))

  # dev pages
#  gulp.src(config.jade.indexSrc).pipe(jade()).on("error", handleErrors)
#    .pipe(rename('people.html'))
#    .pipe(gulp.dest(config.jade.dest))
#    .pipe(browserSync.reload(stream: true))
#
#  gulp.src(config.jade.indexSrc).pipe(jade()).on("error", handleErrors)
#    .pipe(rename('config.html'))
#    .pipe(gulp.dest(config.jade.dest))
#    .pipe(browserSync.reload(stream: true))
#
#  gulp.src(config.jade.indexSrc).pipe(jade()).on("error", handleErrors)
#    .pipe(rename('data.html'))
#    .pipe(gulp.dest(config.jade.dest))
#    .pipe(browserSync.reload(stream: true))

  # test.html
  gulp.src(config.test.src).pipe(jade()).on("error", handleErrors)
    .pipe(gulp.dest(config.test.dest))
    .pipe(browserSync.reload(stream: true))

  return)
