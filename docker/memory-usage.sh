#!/bin/bash

containers=$(docker ps -a --format "{{.ID}} {{.Names}}")

echo -e "CONTAINER ID\tNAME\t\t\tMEM USAGE / LIMIT\tMEM %"

while IFS= read -r container; do
    container_id=$(echo $container | awk '{print $1}')
    container_name=$(echo $container | awk '{print $2}')
    stats=$(docker stats --no-stream --format "table {{.MemUsage}}\t{{.MemPerc}}" $container_id | tail -n +2)
    echo -e "$container_id\t$container_name\t$stats"
done <<< "$containers"
