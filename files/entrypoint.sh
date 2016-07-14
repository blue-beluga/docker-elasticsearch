#!/bin/sh

set -e

# Add elasticsearch as command if needed.
if [ "${1:0:1}" = '-' ]; then
	set -- elasticsearch "$@"
fi

# Drop root privileges if we are running elasticsearch allow the container to
# be started with `--user`.
if [ "$1" = 'elasticsearch' -a "$(id -u)" = '0' ]; then
	chown -R elasticsearch:elasticsearch "${ES_HOME}/data"

	set -- su-exec ${ES_USER} "$@"
fi

# As argument is not related to elasticsearch, then assume that user wants to
# run his own process, for example a `bash` shell to explore this image.
exec "$@"
