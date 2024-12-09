@echo off
set DOCKER_BUILDKIT=1
docker build ^
  --build-arg BASE_IMAGE_TAG=19.3 ^
  --secret id=secret.txt,src=local-secret.txt ^
  -t sample ^
  -f Dockerfile.sample ^
  .
