[Docker Hub](https://hub.docker.com/r/joakimk/rpi-elixir/)

Elixir docker image for Raspberry Pi (compiled for it's ARM cpu).

Just get [an OS with docker](http://blog.hypriot.com/downloads/) on the memory card and run `docker pull joakimk/rpi-elixir:1.1.1` to get:

![](https://s3-eu-west-1.amazonaws.com/uploads-eu.hipchat.com/10794/29896/UqWChcQoYl7vADa/Screen%20Shot%202015-11-04%20at%2018.47.27.png)

About:

* Optimized for size: the image is about 349MB (~345MB of that is OS and Erlang)
* It's built using a Raspberry Pi 2. Please open an issue if it does not work on your Raspberry Pi version.

Related docker images:

* [rpi-erlang](https://github.com/joakimk/rpi-erlang)

## Installing and running

On a Raspberry Pi running [an OS with docker](http://blog.hypriot.com/downloads/):

    # This takes about 7 minutes on a fast connection, less for updates later as
    # you will have the OS and erlang images already.
    docker pull joakimk/rpi-elixir:1.1.1

    docker run -i -t joakimk/rpi-elixir:1.1.1 iex
    
Example of mounting a project:

    $ echo "IO.puts('Hello')" > hello.exs
    $ docker run -v $PWD:/project -i -t joakimk/rpi-elixir:1.1.1 bash
    root@c0091ee9dfee:/# cd /project/
    root@c0091ee9dfee:/project# elixir hello.exs
    Hello
    
More on this, and not running as root, soon :)

## Building

This takes 12 minutes on a Raspberry Pi 2.

    make

## Publishing

    docker tag 5555555555 joakimk/rpi-elixir:version

    docker login

    # This takes about a minute:
    docker push joakimk/rpi-elixir:version

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
