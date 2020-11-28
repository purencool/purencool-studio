/**
 * Imported packages needed
 */
const express = require('express')
const compression = require('compression')


/**
 * Server configuration
 */

// Port Number
const port = 3000



/**
 *  Server run time
 * @type {*|Express}
 */
const app = express()
app.use(compression())
app.use(express.static('www'))
app.listen(port, () => {
    console.log(`Purencool Studio is  listening on http://localhost:${port}`)
})
