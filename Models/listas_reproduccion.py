from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, ForeignKey, Integer, String, Boolean
from sqlalchemy.orm import sessionmaker
from appConfig import Connection


Base = Connection.get_base()
class ListaReproduccion(Base):
    __tablename__= 'listas_reproduccion'
    idListaReproduccion = Column(Integer, primary_key=True)
    nombreLista = Column(String(100), nullable=False)
    esRecomendacion = Column(Boolean, nullable=False)
    idUsuario = Column(Integer, ForeignKey("usuario.idUsuario"), nullable=False)
