# go-web-server

## Instructions

Write a Dockerfile that compiles and then runs the web server in this repository.  

Write it as if your container will be used in production.  

-----

## Notes
This Go webserver compiles with Go version 1.12 - 1.16+.

It exposes a web server on port 8080 and logs to STDOUT.  The port is configurable by setting the PORT environment variable.  

It only has one endpoint that returns status code 200: `/health`. All other requests will return 404: "404 page not found".  
