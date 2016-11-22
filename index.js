var fs = require('fs');
var http = require('http');
var https = require('https');
var express = require('express');
var ParseServer = require('parse-server').ParseServer;
var ParseDashboard = require('parse-dashboard');
var app = express();
var port = 1234;

var myApplication = new ParseServer({
    databaseURI: 'mongodb://localhost:27017/myapp',
    appId: 'AppID',
    masterKey: 'MasterKey',
    serverURL: 'https://localhost:1234/myapp'
});

var dashboard = new ParseDashboard({
    'apps': [{
        'serverURL': 'https://localhost:1234/myapp',
        'appId': 'AppID',
        'masterKey': 'MasterKey',
        'appName': 'My Cool App'
    }],
    'users': [{
        'user': 'username',
        'pass': 'pa$$w0rd',
        'apps': [{'appId': 'AppID'}]
    }],
    'useEncryptedPasswords': false,
    'allowInsecureHTTP': true
});

var cert = {
    key: fs.readFileSync('privkey.pem', 'utf8'),
    cert: fs.readFileSync('fullchain.pem', 'utf8'),
};

app.use('/dashboard', dashboard);
app.use('/myapp', myApplication);

var server = https.createServer(cert, app).listen(port, function() {
    console.log('Parse listening on port ' + port);
});
