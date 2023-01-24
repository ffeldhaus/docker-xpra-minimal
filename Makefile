IMAGE   := ghcr.io/lambdalisue/xpra-minimal
VERSION := $$(git describe --tags --always --dirty || echo 'v0.0.0')

.PHONY: image-build
build-image:	FORCE
	docker buildx build \
		--load \
		--cache-from=${IMAGE} \
		-t ${IMAGE}:${VERSION} \
		-t ${IMAGE} \
		.

.PHONY: image-push
release-image:	FORCE
	docker buildx build \
		--push \
		--platform linux/amd64,linux/arm64 \
		--cache-from=${IMAGE} \
		-t ${IMAGE} \
		.

FORCE:
