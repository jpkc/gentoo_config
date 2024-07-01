# Put your fun stuff here.
g213-led -p /etc/g810-led/root

exit_session() {
	g213-led -p /etc/g810-led/user
}

trap exit_session EXIT
