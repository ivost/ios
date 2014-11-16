//
//  push.js
//  iPhone-PushMsg
//
//  Created by David Black on 01/07/2014.
//  Copyright (c) 2014 David Black. All rights reserved.
//

var zmq = require('zmq')
, sock = zmq.socket('push');

sock.bindSync('tcp://127.0.0.1:3001');
console.log('Push bound to port 3001');

setInterval(function(){
            console.log('sending message');
            sock.send('push js: msg');
}, 5000);