#!/usr/bin/env bash
set -euo pipefail
COMFY_ROOT="/workspace/runpod-slim/ComfyUI"
VENV="/workspace/runpod-slim/venv"

pkill -f "main.py" || true
nohup "${VENV}/bin/python" "${COMFY_ROOT}/main.py" --listen 0.0.0.0 --port 8188 > /workspace/comfyui.log 2>&1 &
echo "Started ComfyUI. Log: /workspace/comfyui.log"
