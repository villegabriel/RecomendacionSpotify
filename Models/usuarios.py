from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.orm import sessionmaker
from appConfig import Connection


Base = Connection.get_base()
class Usuario(Base):
    __tablename__= 'usuarios'
    idUsuario = Column(Integer, primary_key=True)
    nombreUsuario = Column(String(100), nullable=False)
