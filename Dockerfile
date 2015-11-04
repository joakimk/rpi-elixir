FROM joakim/rpi-erlang:18.1.3
MAINTAINER Joakim Kolsjö <joakim.kolsjo<at>gmail.com>

ENV ELIXIR_VERSION=1.1.1 \
    DOWNLOAD_SHA=TODO

ENV DEBIAN_FRONTEND=noninteractive \
    LANG=en_US.UTF-8 \
    LANGUAGE=en_US.UTF-8 \
    LC_ALL=en_US.UTF-8

# NOTE: Things are grouped in the most optimal way to remove temporary files from the final image so that it is as small as possible. So don't refactor this for readability if that adds more "RUN" steps.

# TODO:
# RUN

CMD ["iex"]
