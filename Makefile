
BUILD_ID ?= ${USER}


.PHONY: builder
builder:
	docker build -t apk_builder:${BUILD_ID} builder/

target:
	mkdir -p target
aports:
	git clone git://dev.alpinelinux.org/aports

.PHONY: aports_update
aports_update: aports
	GIT_DIR=aports/.git git fetch origin -p
	GIT_DIR=aports/.git git pull origin master

user.abuild:
	mkdir -p user.abuild

build: builder target
	docker run -ti \
		-v ${PWD}/user.abuild/:/home/packager/.abuild \
		-v ${PWD}/work:/work \
		-v ${PWD}/target:/target \
		-v ${HOME}/.gitconfig/:/home/packager/.gitconfig \
		apk_builder:${BUILD_ID} \
		sh
