#/bin/bash
source .env
docker run \
    -v ./configs/server/config.js:${BASEDIR}/${EDUMEET}/server/dist/config.js:ro \
    -v ./configs/server/config.yaml:${BASEDIR}/${EDUMEET}/server/dist/config.yaml:ro \
    -v ./configs/app/config.js:${BASEDIR}/${EDUMEET}/server/dist/public/config.js:ro \
	-v ./certs:${BASEDIR}/${EDUMEET}/server/certs \
	-v ./images:${BASEDIR}/${EDUMEET}/server/dist/public/images \
  	-v ./privacy:${BASEDIR}/${EDUMEET}/server/dist/public/static/privacy \
	-e BASEDIR=${BASEDIR} -e EDUMEET=${EDUMEET} \
	--network host \
	--restart unless-stopped \
	--name edumeet \
	--detach \
      ${REPOSITORY}/${EDUMEET}:${TAG}
