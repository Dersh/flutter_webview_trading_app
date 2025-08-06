# API

Серверные интерфейсы реализованы на Firebase Cloud Functions и возвращают JSON.

## Articles `/api/articles`
Список обучающих уроков.
- `id`: идентификатор
- `title`: заголовок
- `reward`: награда
- `htmlUrl`: ссылка на HTML-контент
Используется на [экране обучения](screen_1_learning.md).

## Brokers `/api/brokers`
Список доступных брокеров.
- `id`, `name`, `url`, `description`
- `trustScore`, `founded`, `accounts`, `minDeposit`
- `badges`: массив строк
- `warning`: предупреждение
Используется на [экране брокеров](screen_3_brokers.md).

## Quotes `/api-v3/forex/latest`
Данные по активам для графика.
Ответ содержит поля:
```
p: double   # текущая цена
c: int      # изменение цены
cp: string  # изменение в процентах
t: int      # время последнего обновления (Unix UTC)
s: string   # символ
(tm поле тоже может присутствовать)
```
Используется на [экране торговли](screen_2_trading.md).

Коллекция запросов Postman: `api/FX_GPT_test.postman_collection.json`.
