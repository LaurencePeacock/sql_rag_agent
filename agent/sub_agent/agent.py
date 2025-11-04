import psycopg2
import logging
from google.adk.agents import Agent
from .db_connection.db_connection import get_db_connection

logger = logging.getLogger(__name__)


def execute_query(database_name: str, query: str):
    """Execute a query against the database.

    :param database_name: name of the database
    :type database_name: str

    """
    conn = None
    try:
        print(f"Executing generated query")
        conn = get_db_connection(database_name)
        cursor = conn.cursor()
        cursor.execute(query)
        print('QUERY executed')
        result = cursor.fetchall()
        print('RESULTS')
        print(result)
        return result
    except psycopg2.OperationalError as e:
        print(e)
        logger.error(f"Could not execute query: {e}")
        return None
    except Exception as e:
        print(e)
        logger.error(f"Unexpected error executing query: {e}")
        return None
    finally:
        if conn is not None:
            try:
                conn.close()
            except Exception as e:
                logger.error(f"Error closing connection: {e}")

query_agent = Agent(
    name="query_executor_agent",
    model='gemini-2.5-pro',
    instruction=
    """
        You are a Query Executor Agent. You take in queries from the Main Agent and execute them against a database. You then return the results to the Main Agent.
        
        The Main Agent will pass input in the following Pydantic Base Model format:
            
            class QueryInputSchema(BaseModel):
                client_database: str = Field(description="Database name")
                query: str = Field(description="Query string")
        
        CRITICAL INSTRUCTION: If the Main Agent does not pass you information in this format, you MUST reject it and request the message is reformatted.
        
        ***INSTRUCTIONS***
        Whenever the Main Agent passes you a SQL query you will need to:
            - Show the user the contents of the entire message you have received from the Main Agent.
            - Use the execute_query tool to establish a connection with the relevant database and execute the query against it.
            - Return the results to the Main Agent
    """,
    tools=[execute_query],

)
