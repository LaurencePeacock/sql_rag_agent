# SQL RAG Agent

#### Scenario: 
You have a large datalake with structured data but no consistency around table names, columns or what data is included across multiple databases
#### Aim: 
For non-technical users to conduct flexible, adhoc analysis of the datalake via natural language prompts
#### Issues: 
Without correct context and instructions, AI Agents struggle to generate SQL queries that are accurate, relevant and verifiable
#### Solution: 
A Retrieval-Augmented Generation (RAG) Agent that builds SQL queries based on reliable context and validates read-only queries before returning structured feedback
Implementation: An ADK agent is provided with tools to access a database containing schema context from which to generate queries. 

### To run the SQL RAG Agent:

1. Get a Gemini API Key from https://aistudio.google.com/api-keys

2. Update the .env file, adding the API to the GOOGLE_API_KEY variable

3. Start the Postgres container. From the project root:
``` shell
   docker compose up
```

4. Start the Google ADK Web UI. From the project root:
```shell
   adk web
```

5. Open the provided localhost address and port

6. Select 'agent' from the 'Select an agent' dropdown

7. Here are some sample prompts
> sample prompts here

8. To view the database, use the connection details in .env

9. CSVs are also included in the sample_data directory of the same data

10. To stop the container and delete data:
```shell
   docker-compose down -v
```

Please note, if you see these errors while using the agent, unfortunately these are rate limit errors or service outages from the Gemini API

```google.genai.errors.ClientError: 429 RESOURCE_EXHAUSTED. {'error': {'code': 429, 'message': 'You exceeded your current quota, please check your plan and billing details. For more information on this error, head to: https://ai.google.dev/gemini-api/docs/rate-limits. To monitor your current usage, head to: https://ai.dev/usage?tab=rate-limit. \n* Quota exceeded for metric: generativelanguage.googleapis.com/generate_content_free_tier_requests, limit: 2\nPlease retry in 39.630122109s.', 'status': 'RESOURCE_EXHAUSTED', 'details': [{'@type': 'type.googleapis.com/google.rpc.Help', 'links': [{'description': 'Learn more about Gemini API quotas', 'url': 'https://ai.google.dev/gemini-api/docs/rate-limits'}]}```

```google.genai.errors.ServerError: 503 UNAVAILABLE. {'error': {'code': 503, 'message': 'The model is overloaded. Please try again later.', 'status': 'UNAVAILABLE'}}```