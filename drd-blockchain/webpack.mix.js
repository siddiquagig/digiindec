let fs = require('fs');
let mix = require('laravel-mix');

/*
 |--------------------------------------------------------------------------
 | Mix Asset Management
 |--------------------------------------------------------------------------
 |
 | Mix provides a clean, fluent API for defining some Webpack build steps
 | for your Laravel application. By default, we are compiling the Sass
 | file for the application as well as bundling up all the JS files.
 |
 */


const files_js = [
    'resources/assets/js/app.js'
];
const files_scss = [
    'resources/assets/sass/app.scss'
];

const modules_dir = 'Modules';

fs.readdirSync(modules_dir).forEach(dir => {
    if (fs.existsSync(modules_dir + '/' + dir + '/Resources/assets/sass/' + dir.toLowerCase() + '.scss')) {
        files_scss.push(modules_dir + '/' + dir + '/Resources/assets/sass/' + dir.toLowerCase() + '.scss');
    }
    if (fs.existsSync(modules_dir + '/' + dir + '/Resources/assets/js/' + dir.toLowerCase() + '.js')) {
        files_js.push(modules_dir + '/' + dir + '/Resources/assets/js/' + dir.toLowerCase() + '.js');
    }
});


files_js.forEach(file => {
    mix.js(file, 'public/js');
});

files_scss.forEach(file => {
    mix.sass(file, 'public/css');
});

mix.copy('resources/assets/images/', 'public/images/', false);

mix.version();