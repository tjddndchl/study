import torch
from diffusers import DiffusionPipeline
import openai
import json

device = "cuda" if torch.cuda.is_available() else "cpu"

model_id = "youngmki/musinsaigo-2.0"
pipe = DiffusionPipeline.from_pretrained(
    "stabilityai/stable-diffusion-xl-base-1.0", torch_dtype=torch.float32
)
pipe = pipe.to(device)
pipe.load_lora_weights(model_id)

def make_prompt(prompt: str) -> str:
    prompt_prefix = "RAW photo"
    prompt_suffix = "(high detailed skin:1.2), 8k uhd, dslr, soft lighting, high quality, film grain, Fujifilm XT3"
    return ", ".join([prompt_prefix, prompt, prompt_suffix]).strip()


def make_negative_prompt(negative_prompt: str) -> str:
    negative_prefix = "(deformed iris, deformed pupils, semi-realistic, cgi, 3d, render, sketch, cartoon, drawing, anime:1.4), \
    text, close up, cropped, out of frame, worst quality, low quality, jpeg artifacts, ugly, duplicate, morbid, mutilated, \
    extra fingers, mutated hands, poorly drawn hands, poorly drawn face, mutation, deformed, blurry, dehydrated, bad anatomy, \
    bad proportions, extra limbs, cloned face, disfigured, gross proportions, malformed limbs, missing arms, missing legs, \
    extra arms, extra legs, fused fingers, too many fingers, long neck"

    return (
        ", ".join([negative_prefix, negative_prompt]).strip()
        if len(negative_prompt) > 0
        else negative_prefix
    )

PROMPT = "A Korean woman in her 20s wearing a white large hoodie in street fashion"
NEGATIVE_PROMPT = ""

def generate_image(prompt):
    image = pipe(
        prompt=make_prompt(prompt),
        height=1024,
        width=768,
        num_inference_steps=50,
        guidance_scale=7.5,
        negative_prompt=make_negative_prompt(NEGATIVE_PROMPT),
        cross_attention_kwargs={"scale": 0.75},
    ).images[0]

    return image

generate_image(PROMPT)

