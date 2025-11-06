from datetime import date, datetime, time
from decimal import Decimal
from typing import List, Tuple, Any
import psycopg2
import logging
from google.adk.agents import Agent
from pydantic import BaseModel, Field

from .db_connection.db_connection import get_db_connection

logger = logging.getLogger(__name__)


class OutputSchema(BaseModel):
    query: str  = Field(description="The query that was executed")
    results: list[Any] = Field(description="The results of the query in serialised json format")


def serialise_result(result: List[Tuple]
 ):
    serializable_result = []
    for row in result:
        serializable_row = []
        for value in row:
            if isinstance(value, Decimal):
                # Convert Decimal to float
                serializable_row.append(float(value))
            elif isinstance(value, (date, datetime)):
                # Convert date/datetime to ISO format string
                serializable_row.append(value.isoformat())
            elif isinstance(value, time):
                # Convert time to ISO format string
                serializable_row.append(value.isoformat())
            else:
                # Keep other types as-is (str, int, bool, None)
                serializable_row.append(value)
        serializable_result.append(serializable_row)

    return serializable_result


def execute_query(database_name: str, query: str) -> dict:
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
        results = cursor.fetchall()
        print('RESULTS')
        print(results)
        json_results = serialise_result(results)
        return json_results
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
    name="query_agent",
    model='gemini-2.5-pro',
    description="Executes a provided SQL query against a database and returns the result to the Main Agent",
    instruction=
    """
        You are a Query Executor Agent. You take in queries from the Main Agent and execute them against a database. You then return the results to the Main Agent.
        
        The Main Agent will pass input structured like the following json format example:
            
            {
                "client_database": "bank_client",
                "query": "SELECT SUM("Impressions") AS "total_impressions" FROM public.google_ads WHERE "Date" >= '2025-02-01' AND "Date" <= '2025-02-28"
            }
        
        CRITICAL INSTRUCTION: If the Main Agent does not pass you information in this format, you MUST reject it and request the message is reformatted.
        
        ***INSTRUCTIONS***
        Whenever the Main Agent passes you a SQL query you will need to:
            - Show the user the contents of the entire message you have received from the Main Agent IN A USER FRIENDLY FORMAT.
            - Use the execute_query tool to establish a connection with the relevant database and execute the query against it.
            - Return the results to the Main Agent according to OutputSchema
    """,
    tools=[execute_query],
    output_schema=OutputSchema,

)
