# Компоненты

- Нижняя панель с вкладками: `Learn`, `Trade`, `Platforms`.
- Панель с балансом
- График торгов с переключением периода отображения
- Переключение торговой пары
- [Экран обучения](screen_1_learning.md)
- [Экран торговли](screen_2_trading.md)
- [Экран брокеров](screen_3_brokers.md).

## Данные и хранилища
| Класс | Поля (минимум) | Хранилище |
|-------|----------------|-----------|
| **Balance** | `amount: double` | Flutter Secure Storage |
| **Article** | `id`, `title`, `reward`, `htmlUrl` | Firebase REST API |
| **Asset** | `symbol`, `price`, `change`, `changePct`, `timestamp` | внешнее API котировок |
| **Trade** | `asset`, `direction`, `duration`, `entryPrice`, `expiry` | локально в памяти |
| **Broker** | `id`, `name`, `url`, `description`, `trustScore`, `founded`, `accounts`, `minDeposit`, `badges`, `warning` | Firebase REST API |

Экранная привязка данных:
- [Обучение](screen_1_learning.md) — `Article`, `Balance`.
- [Торговля](screen_2_trading.md) — `Asset`, `Trade`, `Balance`.
- [Брокеры](screen_3_brokers.md) — `Broker`, `Balance`.

Дополнительные сведения об API см. в разделе [API](api.md).
