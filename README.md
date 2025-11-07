# 🍕 Sistema de Gestión para Pizzería  
Este proyecto presenta el diseño de la base de datos para la gestión de productos, combos, pedidos y clientes en una pizzería. El modelo busca organizar de forma eficiente la información relacionada con clientes, pedidos, productos, ingredientes y combos ofrecidos.

---

## 🧱 Modelo Lógico

El sistema se compone de las siguientes entidades principales:

| Tabla | Descripción |
|------|-------------|
| **CUSTOMER** | Almacena la información básica del cliente. |
| **ADDRESS** | Contiene las direcciones asociadas a un cliente. Un cliente puede tener múltiples direcciones. |
| **ORDER** | Registra los pedidos realizados por los clientes. |
| **PRODUCT** | Representa los productos vendidos (pizzas, panzarottis, bebidas, etc.). |
| **INGREDIENT** | Lista los ingredientes utilizados en los productos. |
| **ADDITION** | Registro de agregados o extras solicitados en un pedido. |
| **COMBO** | Contiene la información de combos promocionales disponibles. |
| **COMBO_ITEM** | Relaciona los productos que componen un combo. |

---

## 🔗 Relaciones Principales

- Un **cliente** puede tener **una o varias direcciones**.
- Un **cliente** puede realizar **muchos pedidos**.
- Un **pedido** contiene **productos**, los cuales indican su tipo y precio.
- Un **producto** puede tener **muchos ingredientes**.
- Un **combo** puede incluir **muchos productos**, con cantidad individual por producto.
- Un **pedido** puede incluir **adiciones o extras**.

---

## 📦 Tablas y Atributos

### CUSTOMER
| Atributo | Tipo |
|---------|------|
| id_customer (PK) | INT |
| nombre | VARCHAR |
| email | VARCHAR |
| telefono | INT |
| created_at | DATETIME |

### ADDRESS
| Atributo | Tipo |
|---------|------|
| id_address (PK) | INT |
| id_customer (FK) | INT |
| calle | VARCHAR |
| ciudad | VARCHAR |
| detalles | VARCHAR |

### ORDER
| Atributo | Tipo |
|---------|------|
| id_order (PK) | INT |
| tiempo_orden | DATETIME |
| tipo_orden | TEXT |
| estado | TEXT |
| total_cantidad | INT |
| id_customer (FK) | INT |

### PRODUCT
| Atributo | Tipo |
|---------|------|
| id_product (PK) | INT |
| nombre | VARCHAR |
| descripcion | VARCHAR |
| precio | INT |
| tipo_de_producto | TEXT |
| is_active | BOOLEAN |
| id_order (FK) | INT |

### INGREDIENT
| Atributo | Tipo |
|---------|------|
| id_ingredient (PK) | INT |
| nombre | VARCHAR |
| id_product (FK) | INT |

### ADDITION
| Atributo | Tipo |
|---------|------|
| id_addition (PK) | INT |
| nombre | TEXT |
| id_order (FK) | INT |

### COMBO
| Atributo | Tipo |
|---------|------|
| id_combo (PK) | INT |
| nombre | TEXT |
| descripcion | TEXT |
| precio | INT |
| cantidad | INT |

### COMBO_ITEM
| Atributo | Tipo |
|---------|------|
| id_combo (FK) | INT |
| id_product (FK) | INT |
| precio | INT |
| cantidad | INT |

---

## 🎯 Objetivo del Sistema

Optimizar la administración de pedidos y productos en una pizzería, permitiendo:
- Control eficiente de combos y productos.
- Registro detallado de cada orden y sus adicionales.
- Identificación de ingredientes por producto.
- Mantenimiento de historial de clientes y direcciones.

---

## 📌 Notas

- El modelo está preparado para escalar y permitir inclusión futura de:
  - Métodos de pago
  - Usuarios administradores
  - Descuentos y promociones avanzadas

---
