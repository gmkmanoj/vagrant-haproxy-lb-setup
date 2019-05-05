#!/bin/bash


# Updated index.html in nginx default root folder

echo "<html>
<body>
<h1>Hello World</h1>
<p>Response from : Nginx web2</p>
</body>
</html> " >/usr/share/nginx/html/index.html
