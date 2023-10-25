dk() {
	docker $*
}

dkp() {
	docker ps $*
}

dkps() {
	docker ps --all $*
}

dkx() {
	docker exec -it $1 ${2:-bash}
}
