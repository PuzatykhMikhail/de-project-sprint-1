# 1.3. Качество данных

## Оцените, насколько качественные данные хранятся в источнике.
Опишите, как вы проверяли исходные данные и какие выводы сделали.

## Укажите, какие инструменты обеспечивают качество данных в источнике.
Ответ запишите в формате таблицы со следующими столбцами:
- `Наименование таблицы` - наименование таблицы, объект которой рассматриваете.
- `Объект` - Здесь укажите название объекта в таблице, на который применён инструмент. Например, здесь стоит перечислить поля таблицы, индексы и т.д.
- `Инструмент` - тип инструмента: первичный ключ, ограничение или что-то ещё.
- `Для чего используется` - здесь в свободной форме опишите, что инструмент делает.

Пример ответа:

| Таблицы             | Объект                      | Инструмент      | Для чего используется |
| ------------------- | --------------------------- | --------------- | --------------------- |
| production.Products | id int NOT NULL PRIMARY KEY | Первичный ключ  | Обеспечивает уникальность записей о пользователях |
| production.Products | products_price_check        | check           | (price >= (0)::numeric) обеспечивает проверку значений |
| production.users    | id int NOT NULL PRIMARY KEY | Первичный ключ  | Обеспечивает уникальность записей о пользователях |
| production.orderstatuses | id int NOT NULL PRIMARY KEY | Первичный ключ  | Обеспечивает уникальность записей о пользователях |
| production.orderstatuses | key varchar(255)  | not null   | Обеспечивает отсутствие null значений  |
| production.orders   | order_pkey PRIMARY KEY | Первичный ключ  | Обеспечивает уникальность записей о пользователях |
| production.orders | orders check | check | (cost = (payment + bonus_payment) обеспечивает проверку значений |
| production.orders  | order_ts,user_id,bonus_payment,payment,cost,bonus_grant,status  | not null | Обеспечивает отсутствие null значений  |
| production.orderitems | orderitems_pkey | Первичный ключ  | Обеспечивает уникальность записей о пользователях |
| production.orderitems | orderitems_order_id_product_id_key | unique key  | Обеспечивает уникальность записей о пользователях |
| production.orderitems | orderitems_check | check  | (((discount >= (0)::numeric) AND (discount <= price))) обеспечивает проверку значений |
| production.orderitems | orderitems_price_check | check  | ((price >= (0)::numeric)) обеспечивает проверку значений |
| production.orderitems | orderitems_quantity_check | check  | ((quantity > 0)) обеспечивает проверку значений |
| production.orderitems | orderitems_product_id_fkey | FK  | Обеспечивает согласованность данных |
| production.orderitems | orderitems_order_id_fkey | FK  | Обеспечивает согласованность данных |


