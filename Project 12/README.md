# 📱 Project 12 — SwiftData

This repository contains my full implementation of **Project 12 (SwiftData)** from my SwiftUI learning journey.

The goal of this project was not just to follow tutorials, but to deeply understand:
- how data persistence works
- how SwiftData replaces older approaches like UserDefaults
- how to build scalable data-driven apps

---

## 🚀 Technologies

- SwiftUI
- SwiftData
- iOS 17+
- MV-style architecture

---

## 📦 Project Structure

Project 12/
├── SwiftDataProject(part_one)
├── SwiftDataProject(part_two)
└── iExpense

---

# 🧩 Part One — SwiftData Basics

In this part I learned:

- how to create models using `@Model`
- how SwiftData automatically persists data
- how to edit and update stored objects
- how UI reacts automatically to data changes

## 📸 Screenshots

<p align="center">
  <img src="SwiftDataProject(part_one)/Images/Screenshot%202026-03-28%20at%2014.37.19.png" width="22%">
  <img src="SwiftDataProject(part_one)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2014.49.51.png" width="22%">
  <img src="SwiftDataProject(part_one)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2014.50.19.png" width="22%">
  <img src="SwiftDataProject(part_one)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2015.14.07.png" width="22%">
</p>

---

# 🧩 Part Two — Advanced SwiftData

Here I worked with more complex concepts:

- relationships between models
- multiple models working together
- data consistency
- structuring real-world data

Models used:
- `User`
- `Job`

## 📸 Screenshots (ALL INCLUDED)

<p align="center">
  <img src="SwiftDataProject(part_two)/Images/Screenshot%202026-03-28%20at%2016.10.14.png" width="16%">
  <img src="SwiftDataProject(part_two)/Images/Screenshot%202026-03-28%20at%2017.43.57.png" width="16%">
  <img src="SwiftDataProject(part_two)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2016.10.28.png" width="16%">
  <img src="SwiftDataProject(part_two)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2016.10.35.png" width="16%">
  <img src="SwiftDataProject(part_two)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2016.20.39.png" width="16%">
</p>

<p align="center">
  <img src="SwiftDataProject(part_two)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2016.20.51.png" width="16%">
  <img src="SwiftDataProject(part_two)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2016.21.10.png" width="16%">
  <img src="SwiftDataProject(part_two)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2016.24.01.png" width="16%">
  <img src="SwiftDataProject(part_two)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2016.24.09.png" width="16%">
  <img src="SwiftDataProject(part_two)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2017.43.00.png" width="16%">
</p>

---

# 💰 iExpense — SwiftData Version

This is the most important part of the project.

Originally, this app used:
- UserDefaults
- Codable
- manual data storage

I fully refactored it to use SwiftData.

---

## 🔁 Migration Explanation

### Before:
- `UserDefaults`
- manual encoding/decoding
- separate data manager class

### After:
- `@Model` for data
- `@Query` for fetching
- `modelContext` for insert/delete
- automatic persistence

👉 This significantly simplifies the architecture.

---

## ✨ Features

- Add expenses
- Delete expenses
- Persistent storage
- Dynamic filtering
- Dynamic sorting
- Clean UI

---

## 📸 Screenshots (ALL RESTORED)

<p align="center">
  <img src="iExpense/Images/Screenshot%202026-03-29%20at%2002.51.08.png" width="16%">
  <img src="iExpense/Images/Screenshot%202026-03-29%20at%2002.51.22.png" width="16%">
  <img src="iExpense/Images/Screenshot%202026-03-29%20at%2002.51.37.png" width="16%">
  <img src="iExpense/Images/Screenshot%202026-03-29%20at%2002.52.02.png" width="16%">
  <img src="iExpense/Images/Screenshot%202026-03-29%20at%2002.52.21.png" width="16%">
  <img src="iExpense/Images/Screenshot%202026-03-29%20at%2002.57.11.png" width="16%">
</p>

---

## ✅ Completed Challenges

### 1. SwiftData Migration
- Replaced UserDefaults completely
- Implemented `@Model`
- Used `@Query` for reactive UI
- Used `modelContext` for data operations

---

### 2. Sorting

Implemented dynamic sorting:

- By name (alphabetical)
- By amount (descending)

Logic:

```swift
switch sortOrder {
case .name:
    sorted by name
case .amount:
    sorted by amount
}
````

---

### 3. Filtering

Implemented runtime filtering:

* All expenses
* Personal only
* Business only

Logic:

```swift
switch filter {
case .all:
case .personal:
case .business:
}
```

---

## ⚠️ CloudKit Limitation (Important)

CloudKit was NOT implemented.

Reason:

* iCloud capability did NOT appear in Xcode
* Project uses Personal Team

👉 CloudKit requires paid Apple Developer account

This is expected Apple limitation.

---

## 🧠 Key Learnings

* SwiftData simplifies persistence dramatically
* UI becomes reactive automatically
* Less boilerplate than CoreData/UserDefaults
* Better scalability for real apps

---

## 🎯 Final Result

This project demonstrates:

* Real-world SwiftData usage
* Clean SwiftUI architecture
* Dynamic UI logic
* Proper data flow

---

## 👨‍💻 Author

Amanzhol 🚀

# 📱 Project 12 — SwiftData

Этот репозиторий содержит полный **Project 12 (SwiftData)** из моего обучения SwiftUI.

Цель проекта — не просто повторить урок, а глубоко понять:
- как работает сохранение данных
- как SwiftData заменяет UserDefaults и Codable
- как строить масштабируемые data-driven приложения

---

## 🚀 Технологии

- SwiftUI
- SwiftData
- iOS 17+
- MV-подход

---

## 📦 Структура проекта

Project 12/
├── SwiftDataProject(part_one)
├── SwiftDataProject(part_two)
└── iExpense

---

# 🧩 Часть 1 — Основы SwiftData

В этой части я изучил:

- создание моделей через `@Model`
- автоматическое сохранение данных
- редактирование объектов
- реактивное обновление UI

## 📸 Скриншоты 👉👉👉 скриншоты выше 👆

---

# 🧩 Часть 2 — Продвинутый SwiftData

Здесь я работал с более сложными концепциями:

- связи между моделями (relationships)
- несколько моделей одновременно
- целостность данных
- структура реальных приложений

Используемые модели:
- `User`
- `Job`

## 📸 Скриншоты (👉👉👉 скриншоты выше 👆)

---

# 💰 iExpense — версия на SwiftData

Это ключевая часть проекта.

Изначально приложение использовало:
- UserDefaults
- Codable
- ручное управление данными

Я полностью переписал его на SwiftData.

---

## 🔁 Миграция (важно)

### Было:
- UserDefaults
- JSONEncoder / Decoder
- отдельный класс для хранения

### Стало:
- `@Model`
- `@Query`
- `modelContext`
- автоматическое сохранение

👉 Архитектура стала намного проще и чище.

---

## ✨ Возможности

- добавление расходов
- удаление расходов
- автоматическое сохранение
- динамическая фильтрация
- динамическая сортировка
- современный UI

---

## 📸 Скриншоты (👉👉👉 скриншоты выше 👆)

---

## ✅ Выполненные задания

### 1. Переход на SwiftData

- полностью убран UserDefaults
- реализован `@Model`
- данные получаются через `@Query`
- добавление/удаление через `modelContext`

---

### 2. Сортировка

Реализована динамическая сортировка:

- по имени
- по сумме

---

### 3. Фильтрация

Реализована фильтрация:

- все расходы
- только Personal
- только Business

---

## ⚠️ Ограничение (CloudKit)

> ❗ iCloud capability НЕ появился в Xcode

### Причина:
используется **Personal Team (бесплатный Apple ID)**

### Ограничение:
- CloudKit требует платный аккаунт ($99/год)
- синхронизация не реализована

👉 это нормальное поведение, а не ошибка

---

## 🧠 Что я понял

- SwiftData сильно упрощает хранение данных
- UI автоматически обновляется
- меньше кода, чем с UserDefaults/CoreData
- лучше подходит для реальных приложений

---

## 🎯 Итог

Проект демонстрирует:

- реальную работу со SwiftData
- чистую архитектуру SwiftUI
- динамическое управление данными
- масштабируемость

---

## 👨‍💻 Автор

Amanzhol 🚀
