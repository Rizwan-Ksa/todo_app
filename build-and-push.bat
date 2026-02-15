@echo off
echo Building Docker image...
docker build -t rizwanuddindev/rizwan001:latest -t rizwanuddindev/rizwan001:v1.0 .

echo.
echo Logging into Docker Hub...
docker login

echo.
echo Pushing images to Docker Hub...
docker push rizwanuddindev/rizwan001:latest
docker push rizwanuddindev/rizwan001:v1.0

echo.
echo Done! Images pushed successfully.
