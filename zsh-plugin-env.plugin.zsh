#!/bin/bash

reloadenv() {
	local NAME
	if [ -n "${HOME}" ] && [ -d "${HOME}/env" ]; then
		#shellcheck disable=2162,2164
		while read NAME; do
			#shellcheck disable=2086
			eval export ${NAME}="$(<"${HOME}/env/${NAME}")"
		done <<<"$(cd "${HOME}/env"; ls -1)"
	fi
}

reloadenv
