# cordova-plugin-dynamsoft-barcode-reader

![version](https://img.shields.io/npm/v/cordova-plugin-gcdwebserver.svg)

Cordova plugin of [GCDWebServer](https://github.com/swisspol/GCDWebServer) which can be used to serve static files.

## Supported Platforms

iOS

## How to use

### Install the plugin

```
$ cordova plugins add cordova-plugin-gcdwebserver
```

Or:

```
$ cordova plugins add https://github.com/xulihang/cordova-plugin-gcdwebserver.git
```

### Methods

* `startServer`

    Start the HTTP server. You can specify the port and the folder path.
    
    ```js
    cordova.plugins.GCDServer.startServer({port:8080, folder:"www"},successCallback,errorCallback);
    ```

* `stopServer`

    Stop the HTTP server.

    ```js
    cordova.plugins.GCDServer.stopServer("",successCallback,errorCallback);
    ```
    