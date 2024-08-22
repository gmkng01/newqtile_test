from llama_index import VectorStoreIndex, SimpleDirectoryReader, ServiceContext
from llama_index.llms import HuggingFaceLLM
# import torch

documents = SimpleDirectoryReader("/home/abhi/Documents/ChatBot/data").load_data()

from llama_index.prompts.prompts import SimpleInputPrompt

system_prompt = "You are a Q&A assistant. Your goal is to answer questions as accurately as possible based on the instructions and context provided."

# This will wrap the default prompts that are internal to llama-index
query_wrapper_prompt = SimpleInputPrompt("<|USER|>{query_str}<|ASSISTANT|>")



llm = HuggingFaceLLM(
    context_window=2048,
    max_new_tokens=256,
    generate_kwargs={"temperature": 0.0, "do_sample": False},
    system_prompt=system_prompt,
    query_wrapper_prompt=query_wrapper_prompt,
    tokenizer_name="TinyLlama/TinyLlama-1.1B-Chat-v1.0",
    model_name="TinyLlama/TinyLlama-1.1B-Chat-v1.0",
    device_map="cpu",
    # uncomment this if using CUDA to reduce memory usage
    # model_kwargs={"torch_dtype": torch.bfloat16}
)
