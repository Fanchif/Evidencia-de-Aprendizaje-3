-- Bases de Datos II
-- Antonio Jesús Valderrama Jaramillo
--  Evidencia de Aprendizaje 2
--  Juan Sebastián Fandiño Urrego 
--  Ingeniería en Software y Datos

--  Tablas seleccionadas: cliente, pedido, detalle_pedido, producto



--  BASE DE DATOS JARDINERÍA -- 

DROP DATABASE IF EXISTS jardineria;
CREATE DATABASE jardineria
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_spanish_ci;

USE jardineria;

-- Cliente
CREATE TABLE cliente (
    ID_cliente INTEGER NOT NULL AUTO_INCREMENT,
    nombre_cliente VARCHAR(50) NOT NULL,
    nombre_contacto VARCHAR(30) DEFAULT NULL,
    apellido_contacto VARCHAR(30) DEFAULT NULL,
    telefono VARCHAR(15) NOT NULL,
    fax VARCHAR(15) NOT NULL,
    linea_direccion1 VARCHAR(50) NOT NULL,
    linea_direccion2 VARCHAR(50) DEFAULT NULL,
    ciudad VARCHAR(50) NOT NULL,
    region VARCHAR(50) DEFAULT NULL,
    pais VARCHAR(50) DEFAULT NULL,
    codigo_postal VARCHAR(10) DEFAULT NULL,
    ID_empleado_rep_ventas INTEGER DEFAULT NULL,
    limite_credito DECIMAL(15 , 2 ) DEFAULT NULL,
    PRIMARY KEY (ID_cliente)
);

-- Pedido
CREATE TABLE pedido (
  ID_pedido       INTEGER     NOT NULL AUTO_INCREMENT,
  fecha_pedido    DATE        NOT NULL,
  fecha_esperada  DATE        NOT NULL,
  fecha_entrega   DATE        DEFAULT NULL,
  estado          VARCHAR(15) NOT NULL,
  comentarios     TEXT        DEFAULT NULL,
  ID_cliente      INTEGER     NOT NULL,
  PRIMARY KEY (ID_pedido),
  FOREIGN KEY (ID_cliente) REFERENCES cliente (ID_cliente)
);

-- Producto
CREATE TABLE producto (
  ID_producto       INTEGER       NOT NULL AUTO_INCREMENT,
  CodigoProducto    VARCHAR(15)   NOT NULL,
  nombre            VARCHAR(70)   NOT NULL,
  Categoria         INT           NOT NULL,
  dimensiones       VARCHAR(25)   DEFAULT NULL,
  proveedor         VARCHAR(50)   DEFAULT NULL,
  descripcion       TEXT          DEFAULT NULL,
  cantidad_en_stock SMALLINT      NOT NULL,
  precio_venta      DECIMAL(15,2) NOT NULL,
  precio_proveedor  DECIMAL(15,2) DEFAULT NULL,
  PRIMARY KEY (ID_producto)
);

-- Detalle pedido
CREATE TABLE detalle_pedido (
  ID_detalle_pedido INTEGER       NOT NULL AUTO_INCREMENT,
  ID_pedido         INTEGER       NOT NULL,
  ID_producto       INTEGER       NOT NULL,
  cantidad          INTEGER       NOT NULL,
  precio_unidad     DECIMAL(15,2) NOT NULL,
  numero_linea      SMALLINT      NOT NULL,
  PRIMARY KEY (ID_detalle_pedido),
  FOREIGN KEY (ID_pedido)   REFERENCES pedido (ID_pedido),
  FOREIGN KEY (ID_producto) REFERENCES producto (ID_producto)
);


-- Datos
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('GoldFish Garden','Daniel G','GoldFish','5556901745','5556901746','False Street 52 2 A',NULL,'San Francisco',NULL,'USA','24006',19,3000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Gardening Associates','Anne','Wright','5557410345','5557410346','Wall-e Avenue',NULL,'Miami','Miami','USA','24010',19,6000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Gerudo Valley','Link','Flaute','5552323129','5552323128','Oaks Avenue nº22',NULL,'New York',NULL,'USA','85495',22,12000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Tendo Garden','Akane','Tendo','55591233210','55591233211','Null Street nº69',NULL,'Miami',NULL,'USA','696969',22,600000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Lasas S.A.','Antonio','Lasas','34916540145','34914851312','C/Leganes 15',NULL,'Fuenlabrada','Madrid','Spain','28945',8,154310);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Beragua','Jose','Bermejo','654987321','916549872','C/pintor segundo','Getafe','Madrid','Madrid','Spain','28942',11,20000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Club Golf Puerta del hierro','Paco','Lopez','62456810','919535678','C/sinesio delgado','Madrid','Madrid','Madrid','Spain','28930',11,40000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Naturagua','Guillermo','Rengifo','689234750','916428956','C/majadahonda','Boadilla','Madrid','Madrid','Spain','28947',11,32000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('DaraDistribuciones','David','Serrano','675598001','916421756','C/azores','Fuenlabrada','Madrid','Madrid','Spain','28946',11,50000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Madrileña de riegos','Jose','Tacaño','655983045','916689215','C/Lagañas','Fuenlabrada','Madrid','Madrid','Spain','28943',11,20000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Lasas S.A.','Antonio','Lasas','34916540145','34914851312','C/Leganes 15',NULL,'Fuenlabrada','Madrid','Spain','28945',8,154310);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Camunas Jardines S.L.','Pedro','Camunas','34914873241','34914871541','C/Virgenes 45','C/Princesas 2 1ºB','San Lorenzo del Escorial','Madrid','Spain','28145',8,16481);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Dardena S.A.','Juan','Rodriguez','34912453217','34912484764','C/Nueva York 74',NULL,'Madrid','Madrid','Spain','28003',8,321000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Jardin de Flores','Javier','Villar','654865643','914538776','C/ Oña 34',NULL,'Madrid','Madrid','Spain','28950',30,40000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Flores Marivi','Maria','Rodriguez','666555444','912458657','C/Leganes24',NULL,'Fuenlabrada','Madrid','Spain','28945',5,1500);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Flowers, S.A','Beatriz','Fernandez','698754159','978453216','C/Luis Salquillo4',NULL,'Montornes del valles','Barcelona','Spain','24586',5,3500);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Naturajardin','Victoria','Cruz','612343529','916548735','Plaza Magallón 15',NULL,'Madrid','Madrid','Spain','28011',30,5050);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Golf S.A.','Luis','Martinez','916458762','912354475','C/Estancado',NULL,'Santa cruz de Tenerife','Islas Canarias','Spain','38297',12,30000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Americh Golf Management SL','Mario','Suarez','964493072','964493063','C/Letardo',NULL,'Barcelona','Cataluña','Spain','12320',12,20000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Aloha','Cristian','Rodrigez','916485852','914489898','C/Roman 3',NULL,'Canarias','Canarias','Spain','35488',12,50000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('El Prat','Francisco','Camacho','916882323','916493211','Avenida Tibidabo',NULL,'Barcelona','Cataluña','Spain','12320',12,30000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Sotogrande','Maria','Santillana','915576622','914825645','C/Paseo del Parque',NULL,'Sotogrande','Cadiz','Spain','11310',12,60000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Vivero Humanes','Federico','Gomez','654987690','916040875','C/Miguel Echegaray 54',NULL,'Humanes','Madrid','Spain','28970',30,7430);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Fuenla City','Tony','Muñoz Mena','675842139','915483754','C/Callo 52',NULL,'Fuenlabrada','Madrid','Spain','28574',5,4500);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Jardines y Mansiones Cactus SL','Eva María','Sánchez','916877445','914477777','Polígono Industrial Maspalomas, Nº52','Móstoles','Madrid','Madrid','Spain','29874',9,76000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Jardinerías Matías SL','Matías','San Martín','916544147','917897474','C/Francisco Arce, Nº44','Bustarviejo','Madrid','Madrid','Spain','37845',9,100500);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Agrojardin','Benito','Lopez','675432926','916549264','C/Mar Caspio 43',NULL,'Getafe','Madrid','Spain','28904',30,8040);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Top Campo','Joseluis','Sanchez','685746512','974315924','C/Ibiza 32',NULL,'Humanes','Madrid','Spain','28574',5,5500);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Jardineria Sara','Sara','Marquez','675124537','912475843','C/Lima 1',NULL,'Fuenlabrada','Madrid','Spain','27584',5,7500);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Campohermoso','Luis','Jimenez','645925376','916159116','C/Peru 78',NULL,'Fuenlabrada','Madrid','Spain','28945',30,3250);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('france telecom','François','Toulou','(33)5120578961','(33)5120578961','6 place d Alleray 15ème',NULL,'Paris',NULL,'France','75010',16,10000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Musée du Louvre','Pierre','Delacroux','(33)0140205050','(33)0140205442','Quai du Louvre',NULL,'Paris',NULL,'France','75058',16,30000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Tutifruti S.A','Jacob','Jones','2 9261-2433','2 9283-1695','level 24, St. Martins Tower.-31 Market St.',NULL,'Sydney','Nueva Gales del Sur','Australia','2000',31,10000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('Flores S.L.','Antonio','Romero','654352981','685249700','Avenida España',NULL,'Madrid','Fuenlabrada','Spain','29643',18,6000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('The Magic Garden','Richard','Mcain','926523468','9364875882','Lihgting Park',NULL,'London','London','United Kingdom','65930',18,10000);
INSERT INTO cliente (nombre_cliente, nombre_contacto, apellido_contacto, telefono, fax, linea_direccion1, linea_direccion2, ciudad, region, pais, codigo_postal, ID_empleado_rep_ventas, limite_credito) VALUES ('El Jardin Viviente S.L','Justin','Smith','2 8005-7161','2 8005-7162','176 Cumberland Street The rocks',NULL,'Sydney','Nueva Gales del Sur','Australia','2003',31,8000);

-- Datos producto
INSERT INTO producto (CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('11679','Sierra de Poda 400MM',2,'0,258','HiperGarden Tools','Herramienta de poda profesional',15,14,11);
INSERT INTO producto (CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('21636','Pala',2,'0,156','HiperGarden Tools','Pala de acero con cresta de corte',15,14,13);
INSERT INTO producto (CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('22225','Rastrillo de Jardín',2,'1,064','HiperGarden Tools','Rastrillo para eliminar piedras y hojas',15,12,11);
INSERT INTO producto (CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('30310','Azadón',2,'0,168','HiperGarden Tools','Herramienta fabricada en acero y pintura epoxi',15,12,11);
INSERT INTO producto (CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('AR-001','Ajedrea',3,'15-20','Murcia Seasons','Planta aromática condimentaria',140,1,0);
INSERT INTO producto (CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('AR-002','Lavándula Dentata',3,'15-20','Murcia Seasons','Espliego de jardín aromático',140,1,0);
INSERT INTO producto (CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('FR-1','Expositor Cítricos Mix',4,'100-120','Frutales Talavera S.A','Expositor mixto de cítricos',15,7,5);
INSERT INTO producto (CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('FR-10','Limonero 2 años injerto',4,'','NaranjasValencianas.com','Limonero de 2 años de injerto',15,7,5);
INSERT INTO producto (CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('FR-100','Nectarina',4,'8/10','Frutales Talavera S.A','Árbol derivado por mutación de melocotonero',50,11,8);
INSERT INTO producto (CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('FR-101','Nogal',4,'8/10','Frutales Talavera S.A','Árbol frutal de porte grande',50,13,10);
INSERT INTO producto (CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('OR-001','Anthurium','5','',NULL,'Planta ornamental tropical',15,14,11);
INSERT INTO producto (CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('OR-002','Spatiphyllum Vivaldi',5,'',NULL,'Planta de interior de flor blanca',15,9,7);
INSERT INTO producto (CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('OR-099','Mimosa DEALBATA',5,'200-225','Viveros EL OASIS','Árbol ornamental de floración amarilla',100,14,11);
INSERT INTO producto (CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('HER-001','Fertilizante NPK',1,'1kg','AgroSupplies','Fertilizante mineral balanceado',200,8,5);
INSERT INTO producto (CodigoProducto, nombre, Categoria, dimensiones, proveedor, descripcion, cantidad_en_stock, precio_venta, precio_proveedor) VALUES ('HER-002','Sustrato Universal',1,'5L','AgroSupplies','Sustrato para todo tipo de plantas',150,6,4);

-- Datos pedido
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2006-01-17','2006-01-19','2006-01-19','Entregado','Pagado a plazos',5);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2007-10-23','2007-10-28','2007-10-26','Entregado','La entrega llegó antes de lo esperado',5);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2008-06-20','2008-06-25',NULL,'Rechazado','Limite de credito superado',5);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2009-01-20','2009-01-26',NULL,'Pendiente',NULL,5);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2008-11-09','2008-11-14','2008-11-14','Entregado','El cliente paga la mitad con tarjeta y la otra mitad con efectivo',1);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2008-12-22','2008-12-27','2008-12-28','Entregado','El cliente comprueba la integridad del paquete, todo correcto',1);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2009-01-15','2009-01-20',NULL,'Pendiente','El cliente llama para confirmar la fecha',3);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2009-01-20','2009-01-27',NULL,'Pendiente','El cliente requiere entrega de 16:00h a 22:00h',1);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2009-01-12','2009-01-14','2009-01-15','Entregado',NULL,7);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2009-01-06','2009-01-07','2009-01-15','Entregado',NULL,7);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2009-01-05','2009-01-06','2009-01-07','Entregado',NULL,9);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2008-07-14','2008-07-31','2008-07-25','Entregado',NULL,14);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2007-01-07','2007-01-19','2007-01-27','Entregado','Entrega tardía, el cliente puso reclamación',4);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2007-05-20','2007-05-28',NULL,'Rechazado','El pedido fue anulado por el cliente',4);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2008-10-15','2008-12-15','2008-12-10','Entregado',NULL,14);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2009-03-05','2009-03-06','2009-03-07','Entregado',NULL,19);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2009-03-22','2009-03-23','2009-03-27','Entregado',NULL,19);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2008-03-17','2008-03-30','2008-03-29','Entregado','Según el cliente el pedido llegó defectuoso',26);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2008-10-01','2008-10-14','2008-10-14','Entregado','Todo entregado a tiempo y en perfecto estado',26);
INSERT INTO pedido (fecha_pedido, fecha_esperada, fecha_entrega, estado, comentarios, ID_cliente) VALUES ('2009-01-24','2009-01-31','2009-01-30','Entregado','Todo correcto',3);

-- Datps detalle pedido
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (1,7,10,70,3);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (1,11,40,4,1);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (1,12,25,4,2);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (2,7,3,29,6);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (2,8,7,8,7);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (2,12,20,5,2);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (3,9,120,9,6);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (3,10,32,5,4);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (4,8,12,8,7);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (4,9,42,8,6);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (5,8,3,11,1);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (5,9,1,32,2);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (5,10,10,100,3);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (6,5,80,1,3);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (6,9,80,8,1);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (7,10,5,70,2);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (7,11,30,75,1);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (8,10,180,1,3);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (9,13,290,1,1);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (10,1,5,14,1);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (10,2,12,14,2);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (11,8,3,4,2);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (11,9,12,9,3);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (12,1,5,14,1);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (12,3,5,12,3);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (13,4,12,12,1);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (13,3,10,9,2);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (14,1,5,14,1);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (14,3,5,12,3);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (15,4,9,12,5);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (15,6,1,32,2);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (16,1,14,14,1);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (16,4,8,12,2);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (17,2,5,14,3);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (17,3,22,4,1);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (18,9,25,9,1);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (19,10,40,22,3);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (19,11,24,22,4);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (20,3,34,12,2);
INSERT INTO detalle_pedido (ID_pedido, ID_producto, cantidad, precio_unidad, numero_linea) VALUES (20,4,15,12,1);


-- STAGING 

DROP DATABASE IF EXISTS jardineria_staging;
CREATE DATABASE jardineria_staging
  DEFAULT CHARACTER SET utf8mb4
  DEFAULT COLLATE utf8mb4_spanish_ci;

USE jardineria_staging;

-- Tabla stg_cliente
CREATE TABLE stg_cliente (
  ID_cliente                INTEGER       NOT NULL AUTO_INCREMENT,
  nombre_cliente            VARCHAR(50)   NOT NULL,
  nombre_contacto           VARCHAR(30)   DEFAULT NULL,
  apellido_contacto         VARCHAR(30)   DEFAULT NULL,
  telefono                  VARCHAR(15)   NOT NULL,
  fax                       VARCHAR(15)   NOT NULL,
  linea_direccion1          VARCHAR(50)   NOT NULL,
  ciudad                    VARCHAR(50)   NOT NULL,
  pais                      VARCHAR(50)   DEFAULT NULL,
  limite_credito            DECIMAL(15,2) DEFAULT NULL,
  -- Columnas de auditoría staging
  fecha_carga               DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fuente                    VARCHAR(50)   NOT NULL DEFAULT 'jardineria',
  PRIMARY KEY (ID_cliente)
);

-- Tabla stg_producto
CREATE TABLE stg_producto (
  ID_producto       INTEGER       NOT NULL AUTO_INCREMENT,
  CodigoProducto    VARCHAR(15)   NOT NULL,
  nombre            VARCHAR(70)   NOT NULL,
  Categoria         INT           NOT NULL,
  proveedor         VARCHAR(50)   DEFAULT NULL,
  cantidad_en_stock SMALLINT      NOT NULL,
  precio_venta      DECIMAL(15,2) NOT NULL,
  precio_proveedor  DECIMAL(15,2) DEFAULT NULL,
  -- Columnas de auditoría staging
  fecha_carga       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fuente            VARCHAR(50)   NOT NULL DEFAULT 'jardineria',
  PRIMARY KEY (ID_producto)
);

-- Tabla stg_pedido
CREATE TABLE stg_pedido (
  ID_pedido         INTEGER     NOT NULL AUTO_INCREMENT,
  fecha_pedido      DATE        NOT NULL,
  fecha_esperada    DATE        NOT NULL,
  fecha_entrega     DATE        DEFAULT NULL,
  estado            VARCHAR(15) NOT NULL,
  comentarios       TEXT        DEFAULT NULL,
  ID_cliente        INTEGER     NOT NULL,
  -- Columnas de auditoría staging
  fecha_carga       DATETIME    NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fuente            VARCHAR(50) NOT NULL DEFAULT 'jardineria',
  PRIMARY KEY (ID_pedido),
  FOREIGN KEY (ID_cliente) REFERENCES stg_cliente (ID_cliente)
);

-- Tabla stg_detalle_pedido
CREATE TABLE stg_detalle_pedido (
  ID_detalle_pedido INTEGER       NOT NULL AUTO_INCREMENT,
  ID_pedido         INTEGER       NOT NULL,
  ID_producto       INTEGER       NOT NULL,
  cantidad          INTEGER       NOT NULL,
  precio_unidad     DECIMAL(15,2) NOT NULL,
  numero_linea      SMALLINT      NOT NULL,
  -- Columnas de auditoría staging
  fecha_carga       DATETIME      NOT NULL DEFAULT CURRENT_TIMESTAMP,
  fuente            VARCHAR(50)   NOT NULL DEFAULT 'jardineria',
  PRIMARY KEY (ID_detalle_pedido),
  FOREIGN KEY (ID_pedido)   REFERENCES stg_pedido (ID_pedido),
  FOREIGN KEY (ID_producto) REFERENCES stg_producto (ID_producto)
);



-- Migración jardineria -> Jardineria_staging

-- 1. Clientes
INSERT INTO jardineria_staging.stg_cliente
  (ID_cliente, nombre_cliente, nombre_contacto, apellido_contacto,
   telefono, fax, linea_direccion1, ciudad, pais, limite_credito)
SELECT
  ID_cliente, nombre_cliente, nombre_contacto, apellido_contacto,
  telefono, fax, linea_direccion1, ciudad, pais, limite_credito
FROM jardineria.cliente;

-- 2. Productos
INSERT INTO jardineria_staging.stg_producto
  (ID_producto, CodigoProducto, nombre, Categoria, proveedor,
   cantidad_en_stock, precio_venta, precio_proveedor)
SELECT
  ID_producto, CodigoProducto, nombre, Categoria, proveedor,
  cantidad_en_stock, precio_venta, precio_proveedor
FROM jardineria.producto;

-- 3. Pedidos
INSERT INTO jardineria_staging.stg_pedido
  (ID_pedido, fecha_pedido, fecha_esperada, fecha_entrega,
   estado, comentarios, ID_cliente)
SELECT
  ID_pedido, fecha_pedido, fecha_esperada, fecha_entrega,
  estado, comentarios, ID_cliente
FROM jardineria.pedido;

-- 4. Detalles de pedido
INSERT INTO jardineria_staging.stg_detalle_pedido
  (ID_detalle_pedido, ID_pedido, ID_producto,
   cantidad, precio_unidad, numero_linea)
SELECT
  ID_detalle_pedido, ID_pedido, ID_producto,
  cantidad, precio_unidad, numero_linea
FROM jardineria.detalle_pedido;


-- VALIDACIÓN -- 

SELECT
  'jardineria'        AS base_de_datos,
  'cliente'           AS tabla,
  COUNT(*)            AS total_registros
FROM jardineria.cliente
UNION ALL
SELECT 'jardineria', 'producto',       COUNT(*) FROM jardineria.producto
UNION ALL
SELECT 'jardineria', 'pedido',         COUNT(*) FROM jardineria.pedido
UNION ALL
SELECT 'jardineria', 'detalle_pedido', COUNT(*) FROM jardineria.detalle_pedido
UNION ALL
SELECT 'staging', 'stg_cliente',           COUNT(*) FROM jardineria_staging.stg_cliente
UNION ALL
SELECT 'staging', 'stg_producto',          COUNT(*) FROM jardineria_staging.stg_producto
UNION ALL
SELECT 'staging', 'stg_pedido',            COUNT(*) FROM jardineria_staging.stg_pedido
UNION ALL
SELECT 'staging', 'stg_detalle_pedido',    COUNT(*) FROM jardineria_staging.stg_detalle_pedido;