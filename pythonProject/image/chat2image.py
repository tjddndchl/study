import openai

openai.api_key = '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'

messages = [
    {'role': 'system', 'content': 'You are a helpful assistant.'},
    {'role': 'user', 'content': 'ChatGPT에 대해 설명해줘.'},
]

res = openai.ChatCompletion.create(
    model='gpt-3.5-turbo',
    messages=messages
)
msg = res['choices'][0]['message']['content']

messages.append({
    'role': 'assistant',
    'content': msg
})

messages.append({
    'role': 'user',
    'content': '위의 문장을 50자로 요약해줘.'
})

res = openai.ChatCompletion.create(
    model='gpt-3.5-turbo',
    messages=messages
)

res['choices'][0]['message']['content']

from diffusers import StableDiffusionPipeline
import torch

model_id = 'dreamlike-art/dreamlike-photoreal-2.0'
pipe = StableDiffusionPipeline.from_pretrained(model_id, torch_dtype=torch.float16)
pipe = pipe.to('cuda')


prompt = 'photo, a church in the middle of a field of crops, bright cinematic lighting, gopro, fisheye lens'

pipe(prompt).images[0]

messages = [{
    'role': 'system',
    'content': 'You are a helpful assistant for organizing prompt for generating images.'
}]

messages.append({
    'role': 'user',
    'content': '이 세상에 존재하지 않는 동물을 상상해줘.'
})

res = openai.ChatCompletion.create(
    model='gpt-3.5-turbo',
    messages=messages
)

msg = res['choices'][0]['message']['content']

messages.append({
    'role': 'assistant',
    'content': msg
})

messages.append({
    'role': 'user',
    'content': '이 동물의 외형을 더 자세하게 묘사해줘.'
})

res = openai.ChatCompletion.create(
    model='gpt-3.5-turbo',
    messages=messages
)

msg = res['choices'][0]['message']['content']

messages.append({
    'role': 'assistant',
    'content': msg
})

messages.append({
    'role': 'user',
    'content': '위 문장을 영어로 번역해줘.'
})

res = openai.ChatCompletion.create(
    model='gpt-3.5-turbo',
    messages=messages
)

msg = res['choices'][0]['message']['content']
messages.append({
    'role': 'assistant',
    'content': msg
})

messages.append({
    'role': 'user',
    'content': 'Condense the description to focus on nouns and adjectives separated by ,'
})

res = openai.ChatCompletion.create(
    model='gpt-3.5-turbo',
    messages=messages
)

prompt = res['choices'][0]['message']['content']


pipe(prompt).images[0]