An Elixir docker image for Raspberry Pi.

Just put [an OS with docker](http://blog.hypriot.com/downloads/) on it's memory card and run `docker run -i -t joakimk/rpi-elixir` to get:

![](https://dl.dropboxusercontent.com/u/136929/github/rpi-elixir.png)

## About

* Includes basic tools like hex and rebar
* Optimized for size: the image is about 366MB (~345MB of that is OS and Erlang).
* Secure by default (by using a unpriviliged user, which can be overriden in [your own Dockerfile](#adding-more-software-or-overriding-settings-locally)).
* It's built using a Raspberry Pi 2.
  - Please open an issue if it does not work on your Raspberry Pi version.
* Built on [rpi-erlang](https://github.com/joakimk/rpi-erlang).
* Can also be found on [Docker Hub](https://hub.docker.com/r/joakimk/rpi-elixir/).
* Downloading takes about 7 minutes on a fast connection, less for updates.

## Installing

On a Raspberry Pi running [an OS with docker](http://blog.hypriot.com/downloads/):

    docker pull joakimk/rpi-elixir
    
Or get a specific tag:
    
    docker pull joakimk/rpi-elixir:1.1.1
    
All available tags can be found on [Docker Hub](https://hub.docker.com/r/joakimk/rpi-elixir/tags/).

## Running

Running an iex prompt:

    docker run -i -t joakimk/rpi-elixir
    # or: docker run -i -t joakimk/rpi-elixir:1.1.1

Example of running a mix/phoenix project without building a new image:

    $ cd path/to/project
    $ docker run -v $PWD:/project -i -t -p 4000:4000 joakimk/rpi-elixir bash
    deploy@33db28b1e140:~$ cd /project
    deploy@33db28b1e140:/project$ mix deps.get
    deploy@33db28b1e140:/project$ mix test
    deploy@33db28b1e140:/project$ mix phoenix.server

You can also try the phoenix chat app example: [rpi-elixir-phoenix-app-example](https://github.com/joakimk/rpi-elixir-phoenix-app-example).

## Adding more software or overriding settings locally

Add a "Dockerfile":

    FROM joakimk/rpi-elixir
    USER root
    RUN apt-get update \
      && apt-get install -y --no-install-recommends vim \
      && apt-get clean \
      && rm -rf /var/lib/apt/lists/*
    USER deploy
    CMD ["bash"]
    
Then build your own image:
    
    $ docker build -t elixir-dev .
    
And use it:
  
    $ docker run -i -t -p 4000:4000 elixir-dev
    deploy@33db28b1e140:~$ $ vim --version|head -1
    VIM - Vi IMproved 7.3 (2010 Aug 15, compiled Feb 20 2013 06:48:10)

## Building

    make

## Publishing

    docker tag 5555555555 joakimk/rpi-elixir:version
    docker tag 5555555555 joakimk/rpi-elixir:latest

    docker login

    # This takes about a minute:
    docker push joakimk/rpi-elixir:version
    docker push joakimk/rpi-elixir:latest

## License

Copyright (c) 2015 [Joakim Kolsjö](https://twitter.com/joakimk)

MIT License

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
"Software"), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
