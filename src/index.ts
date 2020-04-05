var swig = require('swig-templates');
var path = require('path');
var template = swig.compileFile(path.join(__dirname, './distros/ubuntu1910/http/preseed.cfg.swig'));
var content = template({
    config: {
        choose_mirror_bin: true
    }
});
var fs = require('fs-extra');
fs.writeSync(path.join(__dirname, './distros/ubuntu1910/http/preseed.cfg.swig'));