from pydantic import BaseModel, Field

class QueryOutputSchema(BaseModel):
    client_database: str = Field(description="The name of the database. Either 'bank_client' or 'insurance_client'.")
    query: str = Field(description="Query string")