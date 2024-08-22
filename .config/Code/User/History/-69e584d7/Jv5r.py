from llama_index.llms.ollama import Ollama

llm = Ollama(model="llama2", request_timeout=600) #base_url = 'http://localhost:11434',

response = llm.complete("Do you know about Claude-3?") ## stream_complete() for streaming response

response
print(response.text)