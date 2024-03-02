#!/bin/sh

tmux new-session -d -s docker "docker start dcef"
tmux new-session -d -s tunnel "ssh -R 1337:localhost:21011 cutetrans-archive@serveo.net"
