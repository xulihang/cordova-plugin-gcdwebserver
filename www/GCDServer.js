var exec = require('cordova/exec');

exports.startServer = function (arg0, success, error) {
    exec(success, error, 'GCDServer', 'startServer', [arg0]);
};

exports.stopServer = function (arg0, success, error) {
    exec(success, error, 'GCDServer', 'stopServer', [arg0]);
};
