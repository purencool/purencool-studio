const express = require('express'),
    app = express(),
    cors = require('cors'),
    customize = require('./customize'),
    morgan = require('morgan')

customize(app)

// Request logger
app.use(morgan('combined'))

// CORS cross origin request policy
app.use(cors({
    //origin: process.env.CORS || 'https://*.autopilothq.com'
}))
if (process.env.CORS) {
    console.info('CORS is set')
}

// Static files
app.use(express.static(__dirname + '/www'))

// Test webserver
app.get('/status', function (req, res) {
    res.send('Hello from the Node Webserver!')
});

// Page not found
app.use(function (req, res, next) {
    res.status(404).end()
});

app.listen(process.env.PORT || 8080, '0.0.0.0')
