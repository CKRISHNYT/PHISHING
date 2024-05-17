#!/bin/bash

# I'm not that familiar with docker. Send a PR if something is wrong (^.^)

BASE_DIR=$(realpath "$(dirname "$BASH_SOURCE")")
if [[ ! -d "$BASE_DIR/auth" ]]; then
    echo "Creating Auth Directory.."
	mkdir -p "$BASE_DIR/auth"
fi

CONTAINER="zphisher"
IMAGE="PHISHER/PHISHER:latest"
IMG_MIRROR="ghcr.io/htr-tech/PHISHER:latest"
MOUNT_LOCATION=${BASE_DIR}/auth
check_container=$(docker ps --all --format "{{.Names}}")

if [[ ! $check_container == $CONTAINER ]]; then
	echo "Creating new container..."
	docker create \
		--interactive --tty \
		--volume ${MOUNT_LOCATION}:/PHISHER/auth/ \
		--network host \
		--name "${CONTAINER}" \
		"${IMAGE}"
fi

docker start --interactive "${CONTAINER}"

# docker run --rm -ti --network="host" -v ${MOUNT_LOCATION}:/PHISHER/auth/ --name "$CONTAINER" "$IMAGE"
