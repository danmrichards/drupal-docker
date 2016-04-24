# Drupal Docker

A quick-start NGINX and PHP Docker container intended for Drupal development.

## Summary

The scope of this container is to provide only the A and P of LAMP in keeping with [Docker best practice](https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/) of one container per process.

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
docker run -v /docroot:/opt/www -p 8080:80 danmrichards/drupal-docker
```
