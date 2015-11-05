FROM joakimk/rpi-erlang:18.1.3
MAINTAINER Joakim Kolsjo <joakim.kolsjo<at>gmail.com>

ENV ELIXIR_VERSION=1.1.1 \
    DOWNLOAD_SHA=3b7d6e4fdbcc82d19fa76f4e384f8a87535abcd00ef04528dc6b6706f32a106a

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

# NOTE: Things are grouped in the most optimal way to remove temporary files from the final image so that it is as small as possible. So don't refactor this for readability if that adds more "RUN" steps.

RUN set -xe \
  && curl -SL https://github.com/elixir-lang/elixir/archive/v${ELIXIR_VERSION}.tar.gz -o elixir.tar.gz \
  && echo "${DOWNLOAD_SHA}  elixir.tar.gz" | sha256sum -c - \
  && mkdir -p /usr/src/elixir \
  && tar -xzC /usr/src/elixir --strip-components=1 -f elixir.tar.gz \
  && rm elixir.tar.gz \
  && cd /usr/src/elixir \
  && make -j $(nproc) \
  && make install \
  && rm -rf /usr/src/elixir

# The following isn't strictly needed to run elixir code, but most things you
# do in elixir could use them. It will also set up a non-priviliged user.
#
# If you can provide a strong case for an elixir image without these tools
# then that could maybe become rpi-elixir-core.

# This:
# - gets git to be able to install elixir packages
# - gets adduser to add the deploy user
RUN apt-get update \
  && apt-get install -y --no-install-recommends git adduser \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# Add user deploy that will have the same uid as the raspberry user
# which is useful when you mount volumes.
RUN adduser --disabled-password --gecos '' deploy

# If you need root, then create a Dockerfile and build your image based on this one where
# you set USER to root. I've tried to make this image secure-by-default as best I can.
USER deploy

RUN yes Y | mix local.hex \
  && yes Y | mix local.rebar

WORKDIR "/home/deploy"

CMD ["iex"]
