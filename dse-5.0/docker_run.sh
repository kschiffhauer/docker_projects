#!/bin/bash
IMAGE=$1
NUM_NODES=$2
NODE_OPTS=$3
[ -z "$CLUSTER_NAME" ] && CLUSTER_NAME="Test_Cluster"
#docker run --link opscenter -d -e CLUSTER_NAME="$CLUSTER_NAME" --name node1 $IMAGE $NODE_OPTS
docker run -P -v /Users/kaitlynschiffhauer/projects/docker_projects/dse:/mount_data/ --link opscenter -d -e CLUSTER_NAME="$CLUSTER_NAME" --name node1 $IMAGE $NODE_OPTS
SEEDS=$(docker inspect --format '{{ .NetworkSettings.IPAddress }}' node1)
let n=1
while [ $n != $NUM_NODES ]; do
	let n=n+1
	# docker run --link opscenter -d -e SEEDS=$SEEDS -e CLUSTER_NAME="$CLUSTER_NAME" --name node${n} $IMAGE $NODE_OPTS
	docker run -P -v /Users/kaitlynschiffhauer/projects/docker_projects/dse:/mount_data/ --link opscenter -d -e CLUSTER_NAME="$CLUSTER_NAME" --name node${n} $IMAGE $NODE_OPTS
done