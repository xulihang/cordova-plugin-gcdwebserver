var exec = require('cordova/exec');


exports.startServer = function (arg0, success, error) {
    exec(success, error, 'GCDWebServer', 'startServer', [arg0]);
};

exports.stopServer = function (arg0, success, error) {
    exec(success, error, 'GCDWebServer', 'stopServer', [arg0]);
};