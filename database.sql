CREATE DATABASE facturacion;

USE facturacion;


CREATE TABLE t_rol(
    id_rol              INT(11) AUTO_INCREMENT NOT NULL,
    rol                 VARCHAR(100)         NOT NULL,
    CONSTRAINT          pk_rol     PRIMARY KEY(id_rol)

)ENGINE=InnoDb;

CREATE TABLE   t_usuario(
    id_usuario           INT(11)  AUTO_INCREMENT   NOT NULL,
    nombre               VARCHAR(100)   NOT NULL,
    apellido             VARCHAR(100)   NOT NULL,
    correo               VARCHAR(100)   NOT NULL,
    password             VARCHAR(100)   NOT NULL,
    id_rol               INT(11)        NOT NULL,
    CONSTRAINT          pk_usuario     PRIMARY KEY(id_usuario),
    CONSTRAINT          fk_rol         FOREIGN KEY(id_rol) REFERENCES  t_rol(id_rol)
)ENGINE=InnoDb;

CREATE TABLE t_ciudad(
    id_ciudad       INT(11)     AUTO_INCREMENT NOT NULL,
    ciudad          VARCHAR(100),
    CONSTRAINT      pk_ciudad   PRIMARY KEY(id_ciudad) 
)ENGINE=InnoDb;

INSERT INTO t_ciudad (id_ciudad, ciudad) VALUES (NULL, "Bogota");
INSERT INTO t_ciudad (id_ciudad, ciudad) VALUES (NULL, "Ibague");
INSERT INTO t_ciudad (id_ciudad, ciudad) VALUES (NULL, "Cartagena");


CREATE TABLE    t_unidad(
    id_unidad           INT(11)     AUTO_INCREMENT NOT NULL,
    unidad              VARCHAR(50),
    CONSTRAINT          pk_unidad       PRIMARY KEY(id_unidad)
)ENGINE=InnoDb;

INSERT INTO t_unidad (id_unidad, unidad) VALUES (NULL, "UNIDAD");
INSERT INTO t_unidad (id_unidad, unidad) VALUES (NULL, "KILO");
INSERT INTO t_unidad (id_unidad, unidad) VALUES (NULL, "RESMA");

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
    id_unidad            INT(11),
    valor_unitario       FLOAT(10,2),
    CONSTRAINT          pk_producto      PRIMARY KEY(id_producto),
    CONSTRAINT          fk_unidad        FOREIGN KEY(id_unidad) REFERENCES  t_unidad(id_unidad)
)ENGINE=InnoDb;

CREATE TABLE   t_factura(
    id_factura           INT(11)     AUTO_INCREMENT NOT NULL,
    id_usuario           INT(11),
    id_cliente           INT(11),
    id_producto          INT(11),
    fecha                DATE,
    cantidad             VARCHAR(50),  
    valor_unitario       FLOAT(10,2),
    CONSTRAINT          pk_factura       PRIMARY KEY(id_factura),
    CONSTRAINT          fk_cliente        FOREIGN KEY(id_cliente) REFERENCES  t_cliente(id_cliente),
    CONSTRAINT          fk_producto       FOREIGN KEY(id_producto) REFERENCES  t_producto(id_producto),
    CONSTRAINT          fk_usuario        FOREIGN KEY(id_usuario) REFERENCES  t_usuario(id_usuario)
)ENGINE=InnoDb;


SELECT  fac.id_factura,
		fac.fecha,
		fac.id_usuario,
		usu.nombre,
        usu.apellido,
        fac.id_cliente,
        cli.nombre_cliente,
        cli.dirreccion,
        fac.id_producto,
        prod.producto,
        fac.cantidad,
		fac.valor_unitario,
        fac.cantidad * fac.valor_unitario AS total
FROM t_factura fac
INNER JOIN t_usuario usu ON usu.id_usuario = fac.id_usuario
INNER JOIN t_cliente cli ON cli.id_cliente = fac.id_cliente
INNER JOIN t_producto prod ON prod.id_producto = prod.id_producto
