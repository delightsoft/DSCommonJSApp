dest = "./build"
src = "./src"
app = "./src/app"
test = "./test"
libs = "./static/libs"
data = "./data"

module.exports =

  copyLibs:
    dest: dest
    libs: libs

  copyData:
    dest: dest
    data: data

  browserSync:
    server:

    # We're serving the src folder as well
    # for sass sourcemap linking
      baseDir: [dest, src]

    files: [
        "#{dest}/**"
      # Exclude Map files
        "!#{dest}/**.map"
    ]

  jade:
    indexSrc: "#{app}/index.jade"
    src: "#{app}/**/*.jade"
    dest: dest

  html:
    src: "#{app}/**/*.html"
    dest: dest

  test:
    src: "#{test}/**/*.jade"
    dest: dest

  sass:
    src: "#{src}/sass/**/*.{sass,scss}"
    dest: dest
    settings:
    # Required if you want to use SASS syntax
    # See https://github.com/dlmanning/gulp-sass/issues/81
      sass: './src/sass'
      css: './build'
      sourceComments: "map"
      imagePath: "/images" # Used by the image-url helper
#      require: ['susy', 'breakpoint', 'modular-scale']
      indentedSyntax: true

  images:
    src: "#{src}/images/**"
    dest: "#{dest}/images"

  browserify:

  # Enable source maps
    debug: false

  # Additional file extentions to make optional
    extensions: [".coffee", ".hbs"]

  # A separate bundle will be generated for each
  # bundle config in the list below
    bundleConfigs: [
      {
        entries: app + "/app.coffee"
        dest: dest
        outputName: "app.js"
      }
      {
        entries: test + "/test.coffee"
        dest: dest
        outputName: "test.js"
      }
    ]