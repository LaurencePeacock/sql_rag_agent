import sqlglot
from sqlglot import ErrorLevel
import logging

logger = logging.getLogger(__name__)

def query_is_valid_postgres(query: str):
    try:
        sqlglot.transpile(
            sql=query,
            read="postgres",
            error_level=ErrorLevel.IMMEDIATE
        )
        logger.info(f"Successfully validated query '{query}'.")
        return True
    except Exception as e:
            return f"Query {query} is not valid postgres: {e}"