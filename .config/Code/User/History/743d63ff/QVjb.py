from llama_index import VectorStoreIndex, SimpleDirectoryReader, ServiceContext
from llama_index.llms import HuggingFaceLLM
from llama_index.embeddings import HuggingFaceEmbedding
from llama_index.prompts.prompts import SimpleInputPrompt

# Load the documents from the specified directory
documents = SimpleDirectoryReader("/home/abhi/Documents/ChatBot/data").load_data()

# System and query wrapper prompts
system_prompt = "You are a Q&A assistant. Your goal is to answer questions as accurately as possible based on the instructions and context provided."
query_wrapper_prompt = SimpleInputPrompt("{query_str}")

# Define the HuggingFace LLM with DistilGPT-2
llm = HuggingFaceLLM(
    context_window=1024,  # Adjusted for DistilGPT-2, which has a smaller context window
    max_new_tokens=128,  # Reduced max tokens for faster response
    generate_kwargs={"temperature": 0.3, "do_sample": False},  # Adjusted temperature for better performance
    system_prompt=system_prompt,
    query_wrapper_prompt=query_wrapper_prompt,
    tokenizer_name="distilgpt2",
    model_name="distilgpt2",
    device_map="cpu"  # Ensure the model runs on CPU
)

# Use a more efficient embedding model
embed_model = HuggingFaceEmbedding(model_name="BAAI/bge-small-en-v1.5")

# Create a service context with optimized chunk size
service_context = ServiceContext.from_defaults(
    chunk_size=512,  # Smaller chunk size for faster processing on CPU
    llm=llm,
    embed_model=embed_model
)

# Load or build the index (Consider saving and loading the index from disk to avoid rebuilding)
index = VectorStoreIndex.from_documents(documents, service_context=service_context)

# Convert the index into a query engine
query_engine = index.as_query_engine()

# Define the predict function
def predict(input, history):
    response = query_engine.query(input)
    return str(response)

# Example usage
# response = predict("Your question here", None)
# print(response)
