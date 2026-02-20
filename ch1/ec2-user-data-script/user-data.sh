#!/bin/bash
set -e

yum update -y
yum install -y nodejs

cat << 'EOF' > /home/ec2-user/app.js
const http = require('http');

http.createServer((req, res) => {
  res.writeHead(200, {'Content-Type': 'text/plain'});
  res.end('Sample App from Chapter 1\n');
}).listen(80);
EOF

node /home/ec2-user/app.js &
