# Containerizing a Large Language Model App with Serge and Docker

Large language models (LLMs) are powerful AI tools trained on extensive text datasets, used for tasks like text generation and translation. Serge is an open-source chat platform for LLMs that simplifies self-hosting and local experimentation. This guide will walk you through containerizing your LLM app with Serge using Docker.

## Prerequisites

To follow this tutorial, you'll need:

- A computer with Docker installed
- The Serge source code
- A pre-trained LLM model

**Note**: Ensure your computer has sufficient disk space and available RAM for the LLM model. For example, 7B requires about 4.5 GB of free RAM, 13B requires around 12 GB, and 30B needs about 20 GB.

## Step 1: Create a New App Directory

Create a new directory for your app:

```bash
mkdir my-app
cd my-app
```

## Step 2: Clone Serge Repository

Clone the Serge repository into your app directory:

```bash
git clone https://github.com/serge-chat/serge.git
```

## Step 3: Create Dockerfile

Create a Dockerfile in your app directory:

```Dockerfile
FROM serge-chat/serge:latest

COPY my-model.pkl /app/

CMD ["python", "app.py"]
```

## Step 4: Build Docker Image

Build the Docker image for your app:

```bash
docker build -t my-app .
```

## Step 5: Run Docker Image

Run the Docker image for your app:

```bash
docker run -it my-app
```

## Step 6: Using Docker Compose

If you prefer Docker Compose, create a `docker-compose.yml` file with the following content:

```yaml
version: '3'
services:
  serge:
    image: ghcr.io/serge-chat/serge:latest
    container_name: serge
    restart: unless-stopped
    ports:
      - 8008:8008
    volumes:
      - weights:/usr/src/app/weights
      - datadb:/data/db/
volumes:
  weights:
  datadb:
```

Visit  http://localhost:8008/  to access your app, and find API documentation at http://localhost:8008/api/docs.

## Conclusion

This guide has demonstrated how to containerize your LLM app using Serge. By following these steps, you can easily deploy your LLM app to various environments.

## Images

The following images are used in this guide:
- [Serge GitHub Project](https://github.com/serge-chat/serge)
- [Dockerfile for LLM App](https://github.com/serge-chat/serge/blob/main/Dockerfile)
- [Serge Chat Platform](https://serge.chat/)

