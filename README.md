# Docker container for Berkshelf-api

## Usage

In order for this container to work you'll need to have a client key from your chef server. You can create a new client using knife

    knife client create berkshelf-api --filename client.pem

Copy the client.pem file to the same folder as the Dockerfile

Copy config.json.example to config.json. Edit config.json and change the chef server url to match your chef environment

Build the docker image (depending on your docker setup you may need to use sudo)

    docker build -t berkshelf-api .
