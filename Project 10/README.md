# 🍰 Project 10 – CupcakeCorner

A SwiftUI app that allows users to order cupcakes, send data to a server, and handle responses.

---

## 🚀 Features

- Select cake type and quantity
- Add special requests (extra frosting, sprinkles)
- Enter delivery address
- Validate input (including whitespace handling)
- Send order via HTTP POST request
- Handle network errors gracefully
- Persist user address using UserDefaults
- Modern UI with gradients and reusable modifiers

---

## 🧠 What I Learned

- Building forms with SwiftUI
- Navigation using NavigationStack
- Working with `@Observable` and `@Bindable`
- Networking with `URLSession`
- Using `async/await`
- Encoding and decoding with `Codable`
- Handling errors from APIs
- Saving data locally with `UserDefaults`
- Creating reusable UI components

---

## 🛠 Technologies

- SwiftUI
- Async/Await
- URLSession
- Codable
- UserDefaults

---

## ⚠️ API Note

The original course by Paul Hudson uses:

https://reqres.in/api/cupcakes

However, this API now requires an API key (`x-api-key`), and without it returns a different response format, causing decoding errors.

To ensure the app works correctly, the project uses:

https://jsonplaceholder.typicode.com/posts

Notes:
- JSONPlaceholder does not have a `/cupcakes` endpoint
- `/posts` is used for demonstration purposes
- The response is not decoded back into `Order` due to different structure

---

## 📸 Screenshots

<p align="center">
  <img src="Images/Screenshot%202026-03-27%20at%2000.35.04.png" width="200"/>
  <img src="Images/Screenshot%202026-03-27%20at%2000.35.17.png" width="200"/>
  <img src="Images/Screenshot%202026-03-27%20at%2000.35.28.png" width="200"/>
  <img src="Images/Screenshot%202026-03-27%20at%2000.35.41.png" width="200"/>
  <img src="Images/Screenshot%202026-03-27%20at%2000.35.51.png" width="200"/>
</p>

---

## 📂 Project Structure

- `CupcakeCorner/` – base version
- `CupcakeCorner(updated)/` – improved logic
- `CupcakeCorner(updated2)/` – final version with UI improvements

---

## 🎯 Summary

This project demonstrates real-world iOS development concepts:
- collecting user input
- sending data to a server
- handling responses
- persisting user data locally

---

# 🇷🇺 Русская версия

## 🍰 Проект 10 – CupcakeCorner

Приложение на SwiftUI для заказа капкейков с отправкой данных на сервер и обработкой ответа.

---

## 🚀 Возможности

- Выбор типа и количества капкейков
- Дополнительные опции (глазурь, посыпка)
- Ввод адреса доставки
- Валидация данных (включая пробелы)
- Отправка заказа (POST-запрос)
- Обработка сетевых ошибок
- Сохранение адреса через UserDefaults
- Современный UI (градиенты и кастомные модификаторы)

---

## 🧠 Чему я научился

- Работа с формами в SwiftUI
- Навигация между экранами
- Использование `@Observable` и `@Bindable`
- Сетевые запросы через `URLSession`
- Async/Await
- Работа с `Codable`
- Обработка ошибок
- Сохранение данных локально
- Создание переиспользуемого UI

---

## ⚠️ Примечание по API

В оригинальном курсе используется:

https://reqres.in/api/cupcakes

Сейчас этот API требует `x-api-key`, и без него возвращает другой формат ответа, что приводит к ошибке декодирования.

Поэтому используется:

https://jsonplaceholder.typicode.com/posts

Важно:
- нет `/cupcakes`, используется `/posts`
- только для демонстрации
- ответ не декодируется обратно в `Order`

---

## 🎯 Итог

Проект демонстрирует ключевые навыки iOS-разработки:
- работа с пользовательским вводом
- отправка данных на сервер
- обработка ответа
- локальное хранение данных

---

## 👨‍💻 Автор

Amanzhol
