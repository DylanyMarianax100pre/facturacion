CREATE DATABASE facturacion;

USE facturacion;

CREATE TABLE t_ciudad(
    id_ciudad       INT(11)     AUTO_INCREMENT NOT NULL,
    ciudad          VARCHAR(100),
    CONSTRAINT      pk_ciudad   PRIMARY KEY(id_ciudad) 
)ENGINE=InnoDb;

CREATE TABLE    t_unidad(
    id_unidad           INT(11)     AUTO_INCREMENT NOT NULL,
    unidad              VARCHAR(50),
    CONSTRAINT          pk_unidad       PRIMARY KEY(id_unidad)
)ENGINE=InnoDb;

CREATE TABLE   t_cliente(
    id_cliente           INT(11)     AUTO_INCREMENT NOT NULL,
    nombre_cliente       VARCHAR(100),
    dirreccion           VARCHAR(100),
    id_ciudad            INT(11),
    CONSTRAINT          pk_cliente       PRIMARY KEY(id_cliente),
    CONSTRAINT          fk_ciudad        FOREIGN KEY(id_ciudad) REFERENCES  t_ciudad(id_ciudad)
)ENGINE=InnoDb;


CREATE TABLE   t_producto(
    id_producto          INT(11)     AUTO_INCREMENT NOT NULL,
    producto             VARCHAR(100),
    valor_unitario       FLOAT(10,2),
    id_unidad            INT(11),
    CONSTRAINT          pk_producto      PRIMARY KEY(id_producto),
    CONSTRAINT          fk_unidad        FOREIGN KEY(id_unidad) REFERENCES  t_unidad(id_unidad)
)ENGINE=InnoDb;