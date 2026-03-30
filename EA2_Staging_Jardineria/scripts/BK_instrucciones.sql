-- BACKUP de jardineria:
-- mysqldump -u root -p jardineria > BK_jardineria.sql

-- BACKUP de jardineria_staging:
-- mysqldump -u root -p jardineria_staging > BK_jardineria_staging.sql

--  VERIFICACIÓN: estos SELECT confirman que ambas BDs
--  tienen los datos correctamente cargados antes del backup.

USE jardineria;
SELECT 'BK jardineria - cliente'          AS verificacion, COUNT(*) AS registros FROM cliente
UNION ALL SELECT 'BK jardineria - producto',        COUNT(*) FROM producto
UNION ALL SELECT 'BK jardineria - pedido',          COUNT(*) FROM pedido
UNION ALL SELECT 'BK jardineria - detalle_pedido',  COUNT(*) FROM detalle_pedido;

USE jardineria_staging;
SELECT 'BK staging - stg_cliente'         AS verificacion, COUNT(*) AS registros FROM stg_cliente
UNION ALL SELECT 'BK staging - stg_producto',       COUNT(*) FROM stg_producto
UNION ALL SELECT 'BK staging - stg_pedido',         COUNT(*) FROM stg_pedido
UNION ALL SELECT 'BK staging - stg_detalle_pedido', COUNT(*) FROM stg_detalle_pedido;
