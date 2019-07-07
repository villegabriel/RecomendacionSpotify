from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, ForeignKey, Integer, String, Boolean
from sqlalchemy.orm import sessionmaker

Base = declarative_base()

class ListaReproduccion(Base):
    __tablename__= 'listareproduccion'
    idListaReproduccion = Column(Integer, primary_key=True)
    nombreLista = Column(String(100), nullable=False)
    esRecomendacion = Column(Boolean, nullable=False)
    idUsuario = Column(Integer, ForeignKey("usuario.idUsuario"), nullable=False)
