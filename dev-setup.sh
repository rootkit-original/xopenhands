#!/bin/bash
# OpenHands Development Setup Script

echo "🚀 OpenHands Development Environment Setup"
echo "========================================="

# Function to start backend
start_backend() {
    echo "🐍 Starting Backend (Port 3000)..."
    cd /workspaces/OpenHands
    python -m openhands.server.listen --host 127.0.0.1 --port 3000 &
    BACKEND_PID=$!
    echo "Backend PID: $BACKEND_PID"
}

# Function to start frontend
start_frontend() {
    echo "⚛️ Starting Frontend (Port 4001)..."
    cd /workspaces/OpenHands/frontend
    # Use basic dev server approach
    echo "Frontend setup complete. For now, use Docker for full functionality."
}

# Function to start Docker version
start_docker() {
    echo "🐳 Starting OpenHands via Docker (Port 3000)..."
    docker run -d --rm \
        -e SANDBOX_RUNTIME_CONTAINER_IMAGE=docker.all-hands.dev/all-hands-ai/runtime:0.57-nikolaik \
        -e LOG_ALL_EVENTS=true \
        -v /var/run/docker.sock:/var/run/docker.sock \
        -p 4001:3000 \
        --add-host host.docker.internal:host-gateway \
        --name openhands-app \
        docker.all-hands.dev/all-hands-ai/openhands:0.57
    echo "✅ xCloudAi running at http://localhost:4001"
}

# Function to stop all services
stop_services() {
    echo "🛑 Stopping all services..."
    docker stop openhands-app 2>/dev/null || true
    pkill -f "openhands.server.listen" 2>/dev/null || true
    echo "✅ Services stopped"
}

# Main menu
case "$1" in
    "backend")
        start_backend
        ;;
    "frontend")
        start_frontend
        ;;
    "docker")
        start_docker
        ;;
    "stop")
        stop_services
        ;;
    *)
        echo "Usage: $0 {backend|frontend|docker|stop}"
        echo ""
        echo "Commands:"
        echo "  backend  - Start backend development server"
        echo "  frontend - Setup frontend for development"
        echo "  docker   - Start full OpenHands via Docker (recommended)"
        echo "  stop     - Stop all services"
        echo ""
        echo "📝 For development:"
        echo "  - Use 'docker' for full functionality"
        echo "  - Frontend files: /workspaces/OpenHands/frontend/src/"
        echo "  - Backend files: /workspaces/OpenHands/openhands/"
        ;;
esac
