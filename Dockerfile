FROM python:3.10-slim 
# Use an official Python runtime as a parent image

WORKDIR /app
# Set the working directory in the container , if app is there it will use that otherwise it will create a new one, it's like using mkdir app and cd app

COPY requirements.txt .
#This copies only the requirements.txt file from your local machine into the container's /app directory.
#syntax: COPY <source> <destination>
RUN pip install --no-cache-dir -r requirements.txt

COPY . .
#This copies everything else from your current local directory (the first .) into the container's working directory, /app (the second .). This includes your main.py file and any other files your application needs.

EXPOSE 8000
# This is a form of documentation. It tells Docker that the application inside the container will be listening on port 8000. It doesn't actually "open" the port to the outside world, but it's a necessary step before you can map it during the docker run command.

CMD ["uvicorn","main:app","--host","0.0.0.0","--port","8000"]
#CMD: This specifies the default command to run when a container starts from this image.

#"uvicorn": The ASGI server used to run the FastAPI application.

#"main:app": This tells Uvicorn where to find the FastAPI applica###tion instance. It means: "In the file named main.py, find the object named app."

#"--host", "0.0.0.0": This is crucial for Docker. It tells Uvicorn to listen for connections on all available network interfaces inside the container, not just localhost. This makes it possible for Docker to forward traffic from the host machine to the container.

#"--port", "8000": This tells Uvicorn to run on port 8000, which matches the EXPOSE instruction.