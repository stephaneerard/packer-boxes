var swig  = require('swig-templates');
var path = require('path');
var template = swig.compileFile(path.join(__dirname, './distros/'));
var output = template({
    pagename: 'awesome people',
    authors: ['Paul', 'Jim', 'Jane']
});