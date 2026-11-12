# Backend E-commerce T3 — UPN

API REST con Spring Boot 3.5.6 / Java 17, Spring Data JPA, MySQL para desarrollo, PostgreSQL en Render, autenticación JWT Stateless, BCrypt, CORS, Swagger/OpenAPI y Docker.

## Despliegue Render

- API: https://be-ecommerce-davidenciso.onrender.com
- Salud: https://be-ecommerce-davidenciso.onrender.com/actuator/health
- Swagger: https://be-ecommerce-davidenciso.onrender.com/swagger-ui.html
- OpenAPI: https://be-ecommerce-davidenciso.onrender.com/v3/api-docs
- Repositorio: https://github.com/enciso2265-ctrl/be-ecommerce-David-Enciso

La base PostgreSQL de Render se llama `ecommerce-t3-db`; el servicio web es `be-ecommerce-davidenciso`. La contraseña administrativa se genera como secreto en Render, no se guarda en GitHub.

## Preparación de Postman para la demostración

Importar `Postman_T3_Render_DavidEnciso.json`. En las variables de la colección, sustituir `PEGAR_ADMIN_PASSWORD_DE_RENDER` por el valor de `ADMIN_PASSWORD` del apartado Environment del servicio Render. Usuario: `DavidEnciso`. Ejecutar en orden:
1. Login JWT: obtiene el token y lo guarda automáticamente.
2. Listar productos: demuestra endpoint protegido.
3. Crear producto de evidencia: guarda el ID generado.
4. Consultar producto por ID: muestra el registro creado.

## Acceso externo a PostgreSQL para DBeaver / pgAdmin

En el dashboard de `ecommerce-t3-db`, abrir Connect y copiar los datos de External Connection. Antes de conectar, en Networking / IP Allow List, permitir la IP pública actual del equipo con máscara `/32`. No es recomendable dejar `0.0.0.0/0` abierto. Usar SSL requerido si el cliente lo solicita. Para mostrar datos en el video:
```sql
SELECT * FROM productos ORDER BY id;
```

La base de datos es del plan gratuito temporal y Render muestra como fecha de expiración el 12 de diciembre de 2026. El servicio gratuito puede entrar en reposo cuando no recibe tráfico.

## Endpoints principales

- `POST /api/auth/login`
- `GET /api/productos`
- `GET /api/productos/{id}`
- `POST /api/productos`
- `PUT /api/productos/{id}`
- `DELETE /api/productos/{id}`

Los endpoints de productos requieren Bearer JWT. El login, Swagger y Actuator Health son públicos.
