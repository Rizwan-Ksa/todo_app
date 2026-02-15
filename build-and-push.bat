@echo off
echo Building Docker image...
docker build -t rizwanuddindev/django-todo:latest -t rizwanuddindev/django-todo:v1.0 .

echo.
echo Logging into Docker Hub...
docker login

echo.
echo Pushing images to Docker Hub...
docker push rizwanuddindev/django-todo:latest
docker push rizwanuddindev/django-todo:v1.0

echo.
echo Done! Images pushed successfully.
