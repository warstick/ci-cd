var gulp = require('gulp');
const tar = require('gulp-tar');
var gzip = require('gulp-gzip');

gulp.task('zipProject', function (done) {
    gulp.src('**/**')
        .pipe(tar('build.tar'))
        .pipe(gzip())
        .pipe(gulp.dest('build'))
    done();
});
