#!/bin/bash

# Script to launch Airflow services in tmux panes
SESSION_NAME="airflow-dev"

# Find airflow container
AIRFLOW_CONTAINER=$(docker ps --filter "name=airflow" --format "{{.Names}}" | head -1)

if [ -z "$AIRFLOW_CONTAINER" ]; then
    echo "Error: No airflow container found running"
    docker ps --format "table {{.Names}}\t{{.Status}}"
    exit 1
fi

echo "Found airflow container: $AIRFLOW_CONTAINER"

# Kill existing airflow processes in the container
echo "Killing existing airflow processes..."
docker exec $AIRFLOW_CONTAINER pkill -f "airflow" 2>/dev/null || true

# Wait a moment for processes to fully terminate
sleep 2

# Kill existing session if it exists
tmux kill-session -t $SESSION_NAME 2>/dev/null

# Create session with first command running immediately
tmux new-session -d -s $SESSION_NAME "echo 'API Server' && docker exec -it $AIRFLOW_CONTAINER airflow api-server; exec bash"

# Split horizontally to create 2 panes (left|right)
tmux split-window -h "echo 'Scheduler' && docker exec -it $AIRFLOW_CONTAINER airflow scheduler; exec bash"

# Go back to left pane and split it vertically (top-left, bottom-left)
tmux select-pane -L  # Move to left pane
tmux split-window -v "echo 'Triggerer' && docker exec -it $AIRFLOW_CONTAINER airflow triggerer; exec bash"

# Go to right pane and split it vertically (top-right, bottom-right)
tmux select-pane -R  # Move to right pane
tmux select-pane -R  # Move to right pane (in case we're in middle)
tmux split-window -v "echo 'DAG Processor' && docker exec -it $AIRFLOW_CONTAINER airflow dag-processor; exec bash"

# Set to tiled layout for equal sizes
tmux select-layout -t $SESSION_NAME tiled

# Show how many panes were created
PANE_COUNT=$(tmux list-panes -t $SESSION_NAME | wc -l)
echo "Created $PANE_COUNT panes with airflow services"

# Auto-attach to the session
if [ -n "$TMUX" ]; then
    echo "Switching to airflow-dev session..."
    tmux switch-client -t $SESSION_NAME
else
    echo "Attaching to airflow-dev session..."
    tmux attach-session -t $SESSION_NAME
fi