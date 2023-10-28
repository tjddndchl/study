import torch
from diffusers import DiffusionPipeline
import openai
import json

device = "cuda" if torch.cuda.is_available() else "cpu"

print(device)