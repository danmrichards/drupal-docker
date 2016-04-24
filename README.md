# Drupal Docker

A quick-start NGINX and PHP Docker container intended for Drupal development.

## Summary

The scope of this container is to provide only the E(nginx) and P(hp) of LEMP in keeping with [Docker best practice](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/) of one container per process.

This container provides:

* PHP-FPM
* NGINX
* Composer
* Drush
* Drupal Console

## Installation

### Github

Clone down the repo and build the image.

```
git clone https://github.com/danmrichards/drupal-docker.git
cd drupal-docker
docker build -t danmrichards/drupal-docker .
```

### Docker Hub

Coming soon...

## Usage

This container does not download Drupal for you; instead relying on the codebase residing on your local machine.

So assuming your Drupal installation is in a folder called `docroot`, run this command:

```
docker run -d -v `pwd`/docroot:/opt/www -p 8000:8000 -t danmrichards/drupal-docker
```
