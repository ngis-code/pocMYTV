#!/bin/bash

flutter pub get
flutter build web

docker build -t televolution_frontend_lite:0.0.1 .
docker run -d --restart=always -p 8001:8001 --name televolution_frontend_lite televolution_frontend_lite:0.0.1
