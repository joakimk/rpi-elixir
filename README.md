An Elixir docker image for Raspberry Pi.

Just put [an OS with docker](http://blog.hypriot.com/downloads/) on it's memory card and run `docker pull joakimk/rpi-elixir` to get:

![](https://dl.dropboxusercontent.com/u/136929/github/rpi-elixir.png)

## About

* Includes basic tools like hex and rebar
* Optimized for size: the image is about 366MB (~345MB of that is OS and Erlang).
* Sets up an unpriviliged user
* It's built using a Raspberry Pi 2. Please open an issue if it does not work on your Raspberry Pi version.
* Built on [rpi-erlang](https://github.com/joakimk/rpi-erlang).
* Can also be found on [Docker Hub](https://hub.docker.com/r/joakimk/rpi-elixir/).

## Installing and running

On a Raspberry Pi running [an OS with docker](http://blog.hypriot.com/downloads/):

    # This takes about 7 minutes on a fast connection, less for updates later as
    # you will have the OS and erlang images already.
    docker pull joakimk/rpi-elixir

    # or: docker pull joakimk/rpi-elixir:1.1.1

    docker run -i -t joakimk/rpi-elixir iex

Example of mounting a project:

    $ echo "IO.puts('Hello')" > hello.exs
    $ docker run -v $PWD:/project -i -t joakimk/rpi-elixir bash
    deploy@33db28b1e140:~$ cd /project
    deploy@33db28b1e140:/project$ elixir hello.exs
    Hello

Example of running tests in a mix project:

    $ cd path/to/project
    $ docker run -v $PWD:/project -i -t joakimk/rpi-elixir bash
    deploy@33db28b1e140:~$ cd /project
    deploy@33db28b1e140:/project$ mix deps.get
    deploy@33db28b1e140:/project$ mix test

Also see the example of running a phoenix app: <https://github.com/joakimk/rpi-elixir-phoenix-app-example>

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
