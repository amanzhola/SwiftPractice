# 🚀 SwiftUI Navigation & Related Projects

## 🇷🇺 Русская версия

### 📌 О репозитории

Этот репозиторий содержит несколько учебных проектов на **SwiftUI**, посвящённых навигации, передаче данных между экранами, работе с `NavigationStack`, `NavigationLink`, а также построению более сложных интерфейсов на практике.

Материалы вдохновлены серией **Hacking with Swift** от **Paul Hudson**, а текущая часть завершает тему **Navigation** и подводит итог по основным подходам к навигации в SwiftUI.

---

### 📚 Что входит в репозиторий

В репозитории находятся следующие проекты:

* `Navigation(part_one)`
* `Navigation(part_two)`
* `Navigation(part_three)`
* `iExpense(updated)`
* `iExpense(updated_2)`
* `Moonshot(updated)`

Структура проекта:

```text
Project 9
├── Moonshot(updated)
├── Navigation(part_one)
├── Navigation(part_two)
├── Navigation(part_three)
├── iExpense(updated)
└── iExpense(updated_2)
```

---

### 🧠 Чему посвящён этот этап

Этот этап сфокусирован на теме **навигации в SwiftUI**.

В процессе работы были изучены и закреплены такие вещи, как:

* использование `NavigationStack`
* переходы между экранами через `NavigationLink`
* передача значений в destination view
* навигация на основе value
* работа с типами, которые должны соответствовать `Hashable`
* понимание того, как строить приложение с несколькими экранами
* подготовка к более сложной навигации на больших устройствах

---

### ✨ Wrap Up

Этот учебный этап помогает лучше почувствовать, как работает навигация в SwiftUI, потому что именно она лежит в основе практически любого приложения.

Некоторые концепции, например `Hashable`, могут быть не до конца очевидны с первого раза. Но на практике важно понимать главное:
если SwiftUI требует, чтобы тип соответствовал `Hashable`, чаще всего Swift сам может сгенерировать большую часть реализации, особенно если используются `struct`.

Во многих случаях достаточно просто добавить соответствие следующим протоколам:

* `Hashable`
* `Codable`
* `Equatable`

Это особенно удобно в проектах, где нужно:

* передавать данные между экранами
* хранить модели
* декодировать JSON
* использовать value-based navigation

Также важно понимать, что навигация в SwiftUI бывает разной, и позже можно переходить к другим стилям, которые лучше подходят для более крупных экранов и более сложных интерфейсов.

---

### ✅ Что было изучено на практике

#### Navigation (Part One)

Базовое знакомство с навигацией в SwiftUI:

* создание `NavigationStack`
* настройка заголовков
* базовые переходы между экранами

#### Navigation (Part Two)

Развитие темы навигации:

* работа с переходами внутри списка
* углубление в `NavigationLink`
* построение более реалистичного пользовательского сценария

#### Navigation (Part Three)

Подведение итогов по теме Navigation:

* более уверенное использование value-based navigation
* понимание требований к моделям данных
* подготовка к использованию `Hashable`

#### iExpense

Практика на реальном небольшом приложении:

* работа с экраном добавления данных
* навигация вместо модальных sheet-переходов
* организация структуры SwiftUI-приложения

#### iExpense (Updated 2)

Улучшенная версия проекта:

* дополнительная кастомизация интерфейса
* выделение вспомогательных view и modifiers
* более аккуратная структура кода

#### Moonshot

Более содержательный проект с реальными моделями данных:

* чтение JSON
* работа с `Codable`
* показ списков и сеток
* экран миссии и экран астронавта
* улучшение навигации между сущностями
* подготовка к `NavigationLink(value:)`

---

### 🔍 Review — что важно запомнить

Пройти туториал недостаточно — важно закрепить материал. После выполнения этих проектов полезно ещё раз проверить, насколько хорошо усвоены ключевые темы:

* как работает `NavigationStack`
* когда использовать `NavigationLink`
* в чём разница между обычной и value-based navigation
* почему `Hashable` важен для навигации
* как модели данных взаимодействуют с навигацией
* как строить структуру из нескольких экранов без путаницы

---

### 🧩 Challenge

Ниже собраны идеи для дальнейшего улучшения проектов, чтобы лучше закрепить тему навигации:

#### 1. Обновить проект iExpense

Изменить **project 7 (iExpense)** так, чтобы добавление новой траты происходило через `NavigationLink`, а не через `sheet`.

Подсказка:

* `dismiss()` здесь тоже хорошо работает
* можно использовать `navigationBarBackButtonHidden()`, чтобы пользователь явно выбирал `Cancel`

#### 2. Изменить редактирование названия

Попробовать переделать **project 7**, чтобы пользователь редактировал название элемента прямо в `navigation title`, а не через отдельный `TextField`.

Это хороший способ сравнить UX-подходы и понять, какой вариант выглядит удобнее.

#### 3. Улучшить Moonshot

Вернуться к **project 8 (Moonshot)** и перевести его на `NavigationLink(value:)`.

Для этого потребуется:

* добавить `Hashable`
* продумать структуру моделей
* аккуратно использовать `navigationDestination()`

Это особенно полезно для понимания современной навигации в SwiftUI.

---

## 📸 Скриншоты

### Navigation — Part Two

<p align="center">
  <img src="Navigation(part_two)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-25%20at%2014.12.30.png" width="220"/>
</p>
---

### Navigation — Part Three

<p align="center">
  <img src="Navigation(part_three)/Images/Screenshot%202026-03-25%20at%2015.53.12.png" width="200"/>
  <img src="Navigation(part_three)/Images/Screenshot%202026-03-25%20at%2015.53.28.png" width="200"/>
  <img src="Navigation(part_three)/Images/Screenshot%202026-03-25%20at%2015.55.24.png" width="200"/>
</p>
---

### iExpense

<p align="center">
  <img src="iExpense(updated)/Images/Screenshot%202026-03-25%20at%2018.31.40.png" width="200"/>
  <img src="iExpense(updated)/Images/Screenshot%202026-03-25%20at%2018.32.37.png" width="200"/>
  <img src="iExpense(updated)/Images/Screenshot%202026-03-25%20at%2018.34.33.png" width="200"/>
</p>
---

### iExpense — Updated 2

<p align="center">
  <img src="iExpense(updated_2)/Images/Screenshot%202026-03-25%20at%2019.03.23.png" width="220"/>
</p>

---

### Moonshot (updated)

<p align="center">
  <img src="Moonshot(updated)/Images/Screenshot%202026-03-25%20at%2020.54.12.png" width="200"/>
  <img src="Moonshot(updated)/Images/Screenshot%202026-03-25%20at%2020.55.06.png" width="200"/>
  <img src="Moonshot(updated)/Images/Screenshot%202026-03-25%20at%2020.55.27.png" width="200"/>
  <img src="Moonshot(updated)/Images/Screenshot%202026-03-25%20at%2020.55.40.png" width="200"/>
</p>

---

### 🛠 Технологии

* Swift 5
* SwiftUI
* Xcode
* JSON / Codable
* NavigationStack
* NavigationLink
* Grid / List layouts

---

### 🎯 Цель проекта

Главная цель этого репозитория — закрепить основы и продвинутые элементы навигации в SwiftUI на нескольких учебных приложениях и научиться переносить эти знания в реальные проекты.

---

### 👨‍🏫 Источник вдохновения

* Paul Hudson
* Hacking with Swift

---

## 🇺🇸 English Version

### 📌 About the Repository

This repository contains several **SwiftUI** learning projects focused on navigation, passing data between screens, working with `NavigationStack`, `NavigationLink`, and building more advanced interfaces in practice.

The materials are inspired by **Hacking with Swift** by **Paul Hudson**, and this stage acts as a wrap-up for the **Navigation** topic.

---

### 📚 Projects Included

This repository contains the following projects:

* `Navigation(part_one)`
* `Navigation(part_two)`
* `Navigation(part_three)`
* `iExpense(updated)`
* `iExpense(updated_2)`
* `Moonshot(updated)`

Project structure:

```text
Project 9
├── Moonshot(updated)
├── Navigation(part_one)
├── Navigation(part_two)
├── Navigation(part_three)
├── iExpense(updated)
└── iExpense(updated_2)
```

---

### 🧠 What This Stage Is About

This stage is focused on **navigation in SwiftUI**.

During this work, the following topics were studied and practiced:

* using `NavigationStack`
* navigating between screens with `NavigationLink`
* passing values into destination views
* value-based navigation
* working with types that conform to `Hashable`
* structuring multi-screen SwiftUI applications
* preparing for more advanced navigation patterns on larger devices

---

### ✨ Wrap Up

This project helps build a stronger understanding of navigation in SwiftUI, because navigation sits at the core of almost every app.

Some concepts, such as `Hashable`, may not feel fully intuitive at first. However, the key idea is simple:
when SwiftUI requires a type to conform to `Hashable`, Swift can often synthesize most of the implementation automatically, especially when working with `struct`s.

In many cases, it is enough to declare conformance to protocols such as:

* `Hashable`
* `Codable`
* `Equatable`

This is especially useful when you need to:

* pass data between screens
* store models
* decode JSON
* use value-based navigation

It is also important to understand that SwiftUI offers multiple navigation styles, and later approaches may work better for larger devices and more complex layouts.

---

### ✅ What Was Practiced

#### Navigation (Part One)

Introduction to basic navigation in SwiftUI:

* creating a `NavigationStack`
* setting navigation titles
* making basic transitions between screens

#### Navigation (Part Two)

A deeper look into navigation:

* handling transitions inside lists
* exploring `NavigationLink` in more detail
* building more realistic navigation flows

#### Navigation (Part Three)

Wrapping up the Navigation topic:

* more confident use of value-based navigation
* understanding model requirements
* preparing data types for `Hashable`

#### iExpense

Practice through a small real-world style app:

* building an add-item screen
* using navigation instead of modal sheets
* organizing a SwiftUI app structure

#### iExpense (Updated 2)

An improved version of the project:

* additional UI customization
* extracting helper views and modifiers
* cleaner code organization

#### Moonshot

A richer data-driven project:

* decoding JSON
* working with `Codable`
* displaying content in lists and grids
* mission and astronaut detail screens
* improving navigation between related entities
* preparing the project for `NavigationLink(value:)`

---

### 🔍 Review — Key Things to Remember

Anyone can go through a tutorial, but real learning comes from remembering and applying the concepts afterward.

After finishing these projects, it is useful to review:

* how `NavigationStack` works
* when to use `NavigationLink`
* the difference between regular and value-based navigation
* why `Hashable` matters for navigation
* how data models interact with the navigation system
* how to structure a multi-screen SwiftUI app cleanly

---

### 🧩 Challenge

Here are several ideas for extending the projects and strengthening your understanding of SwiftUI navigation:

#### 1. Upgrade iExpense

Change **project 7 (iExpense)** so that adding a new expense uses `NavigationLink` instead of a `sheet`.

Tip:

* `dismiss()` still works well here
* you may want to use `navigationBarBackButtonHidden()` so the user must explicitly tap `Cancel`

#### 2. Edit the issue name differently

Try changing **project 7** so users can edit the issue name directly in the navigation title instead of using a separate `TextField`.

This is a useful comparison of different UX approaches.

#### 3. Upgrade Moonshot

Return to **project 8 (Moonshot)** and upgrade it to use `NavigationLink(value:)`.

This requires:

* adding `Hashable` conformance
* thinking carefully about model structure
* using `navigationDestination()` correctly

This is especially useful for understanding modern SwiftUI navigation.

---

## 📸 Screenshots

### Navigation — Part Two

<p align="center">
  <img src="Navigation(part_two)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-25%20at%2014.12.30.png" width="220"/>
</p>

---

### Navigation — Part Three

<p align="center">
  <img src="Navigation(part_three)/Images/Screenshot%202026-03-25%20at%2015.53.12.png" width="200"/>
  <img src="Navigation(part_three)/Images/Screenshot%202026-03-25%20at%2015.53.28.png" width="200"/>
  <img src="Navigation(part_three)/Images/Screenshot%202026-03-25%20at%2015.55.24.png" width="200"/>
</p>
---

### iExpense

<p align="center">
  <img src="iExpense(updated)/Images/Screenshot%202026-03-25%20at%2018.31.40.png" width="200"/>
  <img src="iExpense(updated)/Images/Screenshot%202026-03-25%20at%2018.32.37.png" width="200"/>
  <img src="iExpense(updated)/Images/Screenshot%202026-03-25%20at%2018.34.33.png" width="200"/>
</p>

---

### iExpense — Updated 2

<p align="center">
  <img src="iExpense(updated_2)/Images/Screenshot%202026-03-25%20at%2019.03.23.png" width="220"/>
</p>

---

### Moonshot

<p align="center">
  <img src="Moonshot(updated)/Images/Screenshot%202026-03-25%20at%2020.54.12.png" width="200"/>
  <img src="Moonshot(updated)/Images/Screenshot%202026-03-25%20at%2020.55.06.png" width="200"/>
  <img src="Moonshot(updated)/Images/Screenshot%202026-03-25%20at%2020.55.27.png" width="200"/>
  <img src="Moonshot(updated)/Images/Screenshot%202026-03-25%20at%2020.55.40.png" width="200"/>
</p>

---

### 🛠 Tech Stack

* Swift 5
* SwiftUI
* Xcode
* JSON / Codable
* NavigationStack
* NavigationLink
* Grid / List layouts

---

### 🎯 Project Goal

The main goal of this repository is to practice both foundational and more advanced SwiftUI navigation patterns across multiple learning projects and transfer that knowledge into real applications.

---

### 👨‍🏫 Credits

* Paul Hudson
* Hacking with Swift
