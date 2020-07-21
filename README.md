# SINAPTIA Ruby on Rails Interview Test

This is the code kit for our Ruby/Rails interview test exercise.

You have two possibilites to set it up to start working:

1) Docker setup
2) Native setup

Pick the one of your preference below:

## Docker Setup

### Requirements

* Docker

### Instructions

```bash
$ docker-compose up --build
```

```bash
$ docker-compose run web rails db:create db:migrate db:seed
```

```bash
$ docker-compose run web yarn install
```

## Native Setup

### Requirements

* Ruby 2.7
* Bundler
* NodeJS
* Yarn

### Instructions

After installing all the requirements, install the dependencies:

```bash
$ bundle
$ yarn install
```

After installing all the dependencies, create, migrate and seed the database with:

```bash
$ bin/rails db:create db:migrate db:seed
```

To confirm everything is setup correctly:

* run the test suite

```bash
$ bin/rails spec
```

* start the development server:

```bash
$ bin/rails s
```

## The Test

This app is an IoT monitoring hub that manages a set of _devices_ that run 24/7 and send periodical updates to the hub.

Our client wants to store these updates in the database in order to analyse the data. They also want to display, in the devices list, some sort of indication of whether a device is online or offline, and get realtime updates when a device goes online or offline.

Each device will send the following data every minute:

* device uptime (`uptime`, in minutes)
* device load (`load`, float)
* device free memory (`free_mem`, in megabytes)

A device is considered online if it reported at least once in the last minute.

### Requirements

* Develop the following endpoint: `POST /api/v1/updates`, which will receive said updates.
  * The endpoint must be authenticated using an api key only known to the device and the hub. Devices send this api key in the headers of the request as `X-Api-Key`.
  * You need to add the `api_key` field to the device model and a way to generate secure api keys (random strings of url-safe characters) for new devices.
* Develop a page for displaying the updates of a given device.
* Display whether the devices are online or offline in the devices index page.

### Considerations

* Test suite is passing. Keep it that way. Adding test with your solution will be better considered. Few tests are better than no tests.
* We included a task that simulates devices sending updates as a tool for development. To run it open a new terminal tab and run:

```bash
$ bin/rails simulate
```

This dev tool is part of the code, you can change it as needed.
