#!/usr/bin/env bash
set -euo pipefail

COMFY_ROOT="/workspace/runpod-slim/ComfyUI"
VENV="/workspace/runpod-slim/venv"

# Create venv if missing
if [ ! -d "${VENV}" ]; then
  python3 -m venv "${VENV}"
fi

source "${VENV}/bin/activate"
pip install -U pip

# Install ComfyUI base requirements into venv
pip install -r "${COMFY_ROOT}/requirements.txt"

# IMPORTANT: Match host driver CUDA 12.4 pool
pip uninstall -y torch torchvision torchaudio || true
pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cu124

# Video helper dependency
pip install -U imageio imageio-ffmpeg

# IPAdapter common deps
pip install -U opencv-python insightface onnxruntime-gpu || pip install -U onnxruntime

echo "Venv ready at ${VENV}"
