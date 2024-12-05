/*
create Hello World app in Node.js with output on port 5000. 
Handle Ctrl+C to stop.
*/

var express = require('express');
const process = require('process');

const app = express();

app.get('/', (req, res) => {
    res.send('{"message": "Jay\'s nodejs HWorld! v1"}');
});

app.listen(5000, function() {
    console.log('Server running on port 5000');
});

process.on('SIGINT', function() {
    console.log('Ctrl+C pressed; shutting down server...');
    process.exit(0);
});


