from flask import Flask, request, jsonify
from llama_index import VectorStoreIndex, SimpleDirectoryReader, ServiceContext
from llama_index.llms import HuggingFaceLLM
from llama_index.prompts.prompts import SimpleInputPrompt
from llama_index.embeddings import HuggingFaceEmbedding
import torch

app = Flask(__name__)

# Load your documents
documents = SimpleDirectoryReader("/home/abhi/Documents/ChatBot/data").load_data()

# Set up the LLM
system_prompt = "You are a Q&A assistant. Your goal is to answer questions as accurately as possible based on the instructions and context provided."
query_wrapper_prompt = SimpleInputPrompt("{query_str}")

llm = HuggingFaceLLM(
    context_window=2048,
    max_new_tokens=128,
    generate_kwargs={"temperature": 0.0, "do_sample": False},
    system_prompt=system_prompt,
    query_wrapper_prompt=query_wrapper_prompt,
    tokenizer_name="TinyLlama/TinyLlama-1.1B-Chat-v1.0",
    model_name="TinyLlama/TinyLlama-1.1B-Chat-v1.0",
    device_map="cuda",
    model_kwargs={"torch_dtype": torch.bfloat16}
)

# Set up the embedding model
embed_model = HuggingFaceEmbedding(model_name="BAAI/bge-small-en-v1.5")

# Create the service context
service_context = ServiceContext.from_defaults(
    chunk_size=1024,
    llm=llm,
    embed_model=embed_model
)

# Create the index
index = VectorStoreIndex.from_documents(documents, service_context=service_context)
query_engine = index.as_query_engine()

@app.route('/chatbot', methods=['POST'])
def chatbot():
    data = request.json
    if 'input' not in data:
        return jsonify({"error": "Input data is missing"}), 400
    
    input_text = data['input']
    response = query_engine.query(input_text)
    return jsonify({"response": str(response)})

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
