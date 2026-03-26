# 🍰 Project 10 – CupcakeCorner

A SwiftUI app that allows users to order cupcakes, send data to a server, and handle responses.

---

## 🚀 Features

- Select cake type and quantity
- Add special requests (extra frosting and sprinkles)
- Enter delivery address
- Validate input, including whitespace-only text
- Send order using an HTTP POST request
- Handle network errors with user-friendly alerts
- Persist delivery address using UserDefaults
- Improve UI with gradients, reusable modifiers, and custom styling

---

## 🧠 What I Learned

- Building forms and multi-screen flows in SwiftUI
- Navigation with `NavigationStack`
- State management using `@Observable` and `@Bindable`
- Sending network requests with `URLSession`
- Using `async/await`
- Encoding data with `Codable`
- Handling API and connection errors
- Saving user data locally with `UserDefaults`
- Reusing UI through custom modifiers

---

## 🛠 Technologies

- SwiftUI
- Async/Await
- URLSession
- Codable
- UserDefaults

---

## ⚠️ API Note

The original course by Paul Hudson uses this endpoint:

`https://reqres.in/api/cupcakes`

However, ReqRes now requires an API key (`x-api-key`) and no longer works the same way for this tutorial without additional setup.

To keep the project functional for learning purposes, I replaced it with:

`https://jsonplaceholder.typicode.com/posts`

Notes:
- JSONPlaceholder does not provide a `/cupcakes` endpoint
- `/posts` is used only for demonstration and testing
- The response is not decoded back into `Order` because the structure is different

---

## 📸 Screenshots

<p align="center">
  <img src="CupcakeCorner(updated2)/Images/Screenshot%202026-03-27%20at%2000.35.04.png" width="180" />
  <img src="CupcakeCorner(updated2)/Images/Screenshot%202026-03-27%20at%2000.35.17.png" width="180" />
  <img src="CupcakeCorner(updated2)/Images/Screenshot%202026-03-27%20at%2000.35.28.png" width="180" />
  <img src="CupcakeCorner(updated2)/Images/Screenshot%202026-03-27%20at%2000.35.41.png" width="180" />
  <img src="CupcakeCorner(updated2)/Images/Screenshot%202026-03-27%20at%2000.35.51.png" width="180" />
</p>

---

## 📂 Project Structure

- `CupcakeCorner/` — base version
- `CupcakeCorner(updated)/` — challenge improvements
- `CupcakeCorner(updated2)/` — final polished version with UI improvements
- `Images/` — earlier screenshots
- `README.md` — project overview

---

## 🎯 Summary

This project demonstrates important real-world iOS development concepts:

- collecting user input
- validating data
- sending data to a server
- handling responses and errors
- persisting user data locally
- improving UI with reusable SwiftUI components

---

# 🇷🇺 Русская версия

## 🍰 Проект 10 – CupcakeCorner

Приложение на SwiftUI, в котором пользователь может заказать капкейки, отправить данные на сервер и обработать ответ.

---

## 🚀 Возможности

- Выбор типа и количества капкейков
- Дополнительные опции: глазурь и посыпка
- Ввод адреса доставки
- Проверка введённых данных, включая строки из одних пробелов
- Отправка заказа через POST-запрос
- Обработка сетевых ошибок через понятные alert-сообщения
- Сохранение адреса через `UserDefaults`
- Улучшенный интерфейс: градиенты, переиспользуемые модификаторы и стили

---

## 🧠 Чему я научился

- Создавать формы и многоэкранные сценарии в SwiftUI
- Использовать `NavigationStack`
- Работать с `@Observable` и `@Bindable`
- Выполнять сетевые запросы через `URLSession`
- Использовать `async/await`
- Кодировать данные через `Codable`
- Обрабатывать ошибки сети и API
- Сохранять данные локально через `UserDefaults`
- Делать переиспользуемый UI с помощью собственных modifiers

---

## 🛠 Технологии

- SwiftUI
- Async/Await
- URLSession
- Codable
- UserDefaults

---

## ⚠️ Примечание по API

В оригинальном курсе Paul Hudson используется адрес:

`https://reqres.in/api/cupcakes`

Но сейчас ReqRes требует API-ключ (`x-api-key`), поэтому без дополнительной настройки этот адрес больше не подходит для проекта в исходном виде.

Чтобы приложение работало корректно в учебных целях, я заменил адрес на:

`https://jsonplaceholder.typicode.com/posts`

Важно:
- у JSONPlaceholder нет endpoint `/cupcakes`
- `/posts` используется только для демонстрации и тестирования
- ответ сервера не декодируется обратно в `Order`, потому что структура отличается

---

## 📸 Скриншоты

<p align="center">
  <img src="CupcakeCorner(updated2)/Images/Screenshot%202026-03-27%20at%2000.35.04.png" width="180" />
  <img src="CupcakeCorner(updated2)/Images/Screenshot%202026-03-27%20at%2000.35.17.png" width="180" />
  <img src="CupcakeCorner(updated2)/Images/Screenshot%202026-03-27%20at%2000.35.28.png" width="180" />
  <img src="CupcakeCorner(updated2)/Images/Screenshot%202026-03-27%20at%2000.35.41.png" width="180" />
  <img src="CupcakeCorner(updated2)/Images/Screenshot%202026-03-27%20at%2000.35.51.png" width="180" />
</p>

---

## 📂 Структура проекта

- `CupcakeCorner/` — базовая версия
- `CupcakeCorner(updated)/` — версия с улучшениями challenge
- `CupcakeCorner(updated2)/` — финальная улучшенная версия с красивым UI
- `Images/` — более ранние скриншоты
- `README.md` — описание проекта

---

## 🎯 Итог

Этот проект показывает важные практические навыки iOS-разработки:

- работа с пользовательским вводом
- валидация данных
- отправка данных на сервер
- обработка ответа и ошибок
- локальное сохранение пользовательских данных
- улучшение интерфейса с помощью переиспользуемых компонентов SwiftUI

---

## 👨‍💻 Author

Amanzhol
