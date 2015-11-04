FROM joakimk/rpi-erlang:18.1.3
MAINTAINER Joakim Kolsjö <joakim.kolsjo<at>gmail.com>

ENV ELIXIR_VERSION=1.1.1 \
    DOWNLOAD_SHA=3b7d6e4fdbcc82d19fa76f4e384f8a87535abcd00ef04528dc6b6706f32a106a

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

# NOTE: Things are grouped in the most optimal way to remove temporary files from the final image so that it is as small as possible. So don't refactor this for readability if that adds more "RUN" steps.

# TODO:
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

CMD ["iex"]
