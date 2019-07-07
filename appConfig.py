from sqlalchemy import create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy import Column, ForeignKey, Integer, String
from sqlalchemy.orm import sessionmaker

class Connection():

    Session = None
    Base = None

    @staticmethod
    def get_base():
        if Connection.Base != None:
            return Connection.Base
        else:
            Connection.Base = declarative_base()
            engine = Connection.get_engine()
            Connection.Base.metadata.bind=engine
            return Connection.Base

    @staticmethod
    def get_session():
        if Connection.Session != None:
            return Connection.Session
        else:
            DBSession=sessionmaker()
            DBSession.bind = Connection.get_engine()
            Connection.Session = DBSession()
            return Connection.Session

    @staticmethod
    def get_engine():
        return create_engine('mysql+pymysql://root:root@localhost/recomendacionspotify',echo=True)
#usu = Usuario()
#usu.nombreUsuario = "el pibe 10"

#session.add(usu)
#session.commit()


#lp = session.query(Usuario).filter(Usuario.id == 2).all()
#lp = session.query(Usuario).all()
#for p in lp:
#    print(p.nombre)
