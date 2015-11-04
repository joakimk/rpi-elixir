WIP: elixir image

[Docker Hub](https://hub.docker.com/r/joakimk/rpi-elixir/)

Elixir docker image for Raspberry Pi (compiled for it's ARM cpu).

* Optimized for size: the image is about ?MB
* It's built using a Raspberry Pi 2. Please open an issue if it does not work on your Raspberry Pi version.

Related docker images:

* [rpi-erlang](https://github.com/joakimk/rpi-erlang)

## Installing and running

On a Raspberry Pi running [an OS with docker](http://blog.hypriot.com/downloads/):

    docker pull joakimk/rpi-elixir
    # or: docker pull joakimk/rpi-elixir:1.1.1

    docker run -i -t joakimk/rpi-elixir iex

## Building

This takes ? minutes on a Raspberry Pi 2.

    make

## Publishing

    docker tag 5555555555 joakimk/rpi-elixir:version

    docker login

    # This takes about ? minutes:
    docker push joakimk/rpi-elixir:version

## TODO

- [ ] Make it work
- [ ] Make it small
- [ ] Record build times

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
