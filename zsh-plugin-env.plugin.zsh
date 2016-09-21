#!/bin/bash

reloadenv() {
	local NAME
	if [ -n "${HOME}" ] && [ -d "${HOME}/env" ]; then
		#shellcheck disable=2162,2164
		while read NAME; do
			NAME="$(basename "${NAME}")"
			if [ -n "${NAME}" ]; then
				#shellcheck disable=2046,2086
				eval export ${NAME}=\"$(<"${HOME}/env/${NAME}")\"
			fi
		done <<<"$(find "${HOME}/env" -mindepth 1 -maxdepth 1 -type f)"
	fi
}

reloadenv
