from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker
import os

DATABASE_URL = os.getenv("DATABASE_URL", "sqlite:///./embeddings.db")

# Use sqlite-specific connect_args only for SQLite URLs
if DATABASE_URL.startswith("sqlite"):
	engine = create_engine(DATABASE_URL, connect_args={"check_same_thread": False})
else:
	engine = create_engine(DATABASE_URL)

SessionLocal = sessionmaker(bind=engine, autoflush=False, autocommit=False)
Base = declarative_base()