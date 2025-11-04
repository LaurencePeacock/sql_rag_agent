import os
import logging
import psycopg2
from dotenv import load_dotenv

logger = logging.getLogger(__name__)

load_dotenv('.env')

def get_db_connection(db_name: str):
    logger.info(f"Establishing database connection for {db_name}")
    print(f"Establishing database connection for {db_name}")
    try:
        conn_params = {
            "host": os.environ["DB_HOST"],
            "port": os.environ["DB_PORT"],
            "dbname": db_name,
            "user": os.environ["DB_USER"],
            "password": os.environ["DB_PASSWORD"],
        }
        conn = psycopg2.connect(**conn_params)
        logger.info(f"Successfully connected to database '{db_name}'.")
        print(f"Successfully connected to database '{db_name}'.")
        return conn
    except (psycopg2.OperationalError, KeyError) as e:
        logger.error(f"Could not connect to database '{db_name}': {e}")
        print(f"Could not connect to database '{db_name}': {e}")
        logger.error("Please ensure DB_HOST, DB_PORT, DB_USER, and DB_PASSWORD are set in your .env file.")
        return None
