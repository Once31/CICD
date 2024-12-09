@echo off
REM Create and use a multi-platform builder
docker buildx create --name multiarch-builder --use --driver docker-container
docker buildx inspect --bootstrap

REM Check if buildx creation was successful
if errorlevel 1 (
    echo Failed to initialize the multiarch builder. Please ensure Docker is running and Buildx is supported.
    exit /b 1
)

REM Build the multi-architecture Docker image
docker buildx build ^
  --platform linux/amd64,linux/arm64,linux/arm/v7 ^
  --secret id=secret.txt,src=local-secret.txt ^
  -t sidpalas/multi-arch-test:latest ^
  -f Dockerfile.sample ^
  --push ^
  .

REM Clean up the builder (optional, if you don’t need it after the build)
docker buildx rm multiarch-builder
