--  PRUEBAS DE CALIDAD DE DATOS
--  EA2 - Construcción de Base de Datos Staging Jardinería

USE jardineria_staging;

-- VERIFICACIÓN DE COMPLETITUD

-- Clientes sin nombre
SELECT 'stg_cliente - nombre_cliente NULL' AS prueba, COUNT(*) AS registros_con_error
FROM stg_cliente WHERE nombre_cliente IS NULL OR nombre_cliente = '';

-- Clientes sin teléfono
SELECT 'stg_cliente - telefono NULL' AS prueba, COUNT(*) AS registros_con_error
FROM stg_cliente WHERE telefono IS NULL OR telefono = '';

-- Pedidos sin fecha
SELECT 'stg_pedido - fecha_pedido NULL' AS prueba, COUNT(*) AS registros_con_error
FROM stg_pedido WHERE fecha_pedido IS NULL;

-- Pedidos sin estado
SELECT 'stg_pedido - estado NULL' AS prueba, COUNT(*) AS registros_con_error
FROM stg_pedido WHERE estado IS NULL OR estado = '';

-- Productos sin código
SELECT 'stg_producto - CodigoProducto NULL' AS prueba, COUNT(*) AS registros_con_error
FROM stg_producto WHERE CodigoProducto IS NULL OR CodigoProducto = '';

-- Detalles sin cantidad
SELECT 'stg_detalle_pedido - cantidad NULL o cero' AS prueba, COUNT(*) AS registros_con_error
FROM stg_detalle_pedido WHERE cantidad IS NULL OR cantidad <= 0;

-- 2. VERIFICACIÓN DE DUPLICADOS

-- Clientes duplicados (mismo nombre + teléfono)
SELECT 'stg_cliente - duplicados por nombre+telefono' AS prueba, COUNT(*) AS registros_con_error
FROM (
  SELECT nombre_cliente, telefono, COUNT(*) AS total
  FROM stg_cliente
  GROUP BY nombre_cliente, telefono
  HAVING COUNT(*) > 1
) t;

-- Productos duplicados (mismo código)
SELECT 'stg_producto - CodigoProducto duplicado' AS prueba, COUNT(*) AS registros_con_error
FROM (
  SELECT CodigoProducto, COUNT(*) AS total
  FROM stg_producto
  GROUP BY CodigoProducto
  HAVING COUNT(*) > 1
) t;

-- Líneas de pedido duplicadas (mismo pedido + producto + numero_linea)
SELECT 'stg_detalle_pedido - lineas duplicadas' AS prueba, COUNT(*) AS registros_con_error
FROM (
  SELECT ID_pedido, ID_producto, numero_linea, COUNT(*) AS total
  FROM stg_detalle_pedido
  GROUP BY ID_pedido, ID_producto, numero_linea
  HAVING COUNT(*) > 1
) t;


-- 3. VERIFICACIÓN DE INTEGRIDAD REFERENCIAL

-- Pedidos sin cliente válido
SELECT 'stg_pedido - ID_cliente sin referencia' AS prueba, COUNT(*) AS registros_con_error
FROM stg_pedido p
LEFT JOIN stg_cliente c ON p.ID_cliente = c.ID_cliente
WHERE c.ID_cliente IS NULL;

-- Detalles sin pedido válido
SELECT 'stg_detalle_pedido - ID_pedido sin referencia' AS prueba, COUNT(*) AS registros_con_error
FROM stg_detalle_pedido d
LEFT JOIN stg_pedido p ON d.ID_pedido = p.ID_pedido
WHERE p.ID_pedido IS NULL;

-- Detalles sin producto válido
SELECT 'stg_detalle_pedido - ID_producto sin referencia' AS prueba, COUNT(*) AS registros_con_error
FROM stg_detalle_pedido d
LEFT JOIN stg_producto pr ON d.ID_producto = pr.ID_producto
WHERE pr.ID_producto IS NULL;

-- 4. VERIFICACIÓN DE RANGOS Y CONSISTENCIA-

-- Precios negativos o cero en productos
SELECT 'stg_producto - precio_venta invalido' AS prueba, COUNT(*) AS registros_con_error
FROM stg_producto WHERE precio_venta <= 0;

-- Stock negativo
SELECT 'stg_producto - cantidad_en_stock negativo' AS prueba, COUNT(*) AS registros_con_error
FROM stg_producto WHERE cantidad_en_stock < 0;

-- Pedidos donde fecha_entrega es anaterior a fecha_pedido
SELECT 'stg_pedido - fecha_entrega anterior a fecha_pedido' AS prueba, COUNT(*) AS registros_con_error
FROM stg_pedido
WHERE fecha_entrega IS NOT NULL AND fecha_entrega < fecha_pedido;

-- Límite de crédito negativo
SELECT 'stg_cliente - limite_credito negativo' AS prueba, COUNT(*) AS registros_con_error
FROM stg_cliente WHERE limite_credito < 0;

SELECT 'stg_cliente'         AS tabla, COUNT(*) AS total_registros FROM stg_cliente
UNION ALL
SELECT 'stg_producto',        COUNT(*) FROM stg_producto
UNION ALL
SELECT 'stg_pedido',          COUNT(*) FROM stg_pedido
UNION ALL
SELECT 'stg_detalle_pedido',  COUNT(*) FROM stg_detalle_pedido;
