# 📚 Bookworm (SwiftUI + SwiftData)

A step-by-step SwiftUI project that grows from a simple book app into a polished SwiftData-powered tracker with ratings, reviews, dates, validation, and custom styling.

---

# 🇷🇺 Русская версия

## 📖 О проекте

**Bookworm** — это приложение на **SwiftUI**, в котором можно:

- ➕ добавлять книги
- ✍️ писать отзывы
- ⭐ ставить рейтинг
- 💾 сохранять данные через **SwiftData**
- 🗑 удалять книги
- 📅 хранить дату добавления
- 🎨 использовать красивый кастомный интерфейс

Этот проект развивался по этапам: от более простой версии к полной финальной версии с улучшенным UI, валидацией формы, выделением слабых книг и сохранением данных.

---

# 🧩 Bookworm (base)

## Что было на старте
- базовая структура проекта
- первые экраны
- подготовка к дальнейшему переходу на полноценную версию с данными

> В доступной структуре проекта для этой базовой папки отдельной папки `Images` со скриншотами нет.

---

# 🧩 Bookworm (part_two)

## 📸 Скриншоты

<p align="center">
  <img src="Bookworm(part_two)/Images/Screenshot%202026-03-27%20at%2019.07.16.png" width="190"/>
  <img src="Bookworm(part_two)/Images/Screenshot%202026-03-27%20at%2019.08.20.png" width="190"/>
  <img src="Bookworm(part_two)/Images/Screenshot%202026-03-27%20at%2019.14.37.png" width="190"/>
</p>

<p align="center">
  <img src="Bookworm(part_two)/Images/Screenshot%202026-03-27%20at%2023.20.27.png" width="190"/>
  <img src="Bookworm(part_two)/Images/Screenshot%202026-03-27%20at%2023.20.44.png" width="190"/>
</p>

## Что сделано
- 🧱 построена основа приложения
- 📝 форма добавления книги
- 🎭 работа с жанрами
- ⭐ первые рейтинги
- 🧭 навигация между экранами
- 📚 подготовка структуры данных для дальнейшей работы

---

# 🧩 Bookworm (part_four)

## 📸 Скриншоты

<p align="center">
  <img src="Bookworm(part_four)/Images/Screenshot%202026-03-28%20at%2003.25.55.png" width="190"/>
  <img src="Bookworm(part_four)/Images/Screenshot%202026-03-28%20at%2003.27.40.png" width="190"/>
  <img src="Bookworm(part_four)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2003.28.58.png" width="190"/>
</p>

<p align="center">
  <img src="Bookworm(part_four)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2003.29.50.png" width="190"/>
  <img src="Bookworm(part_four)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2003.30.27.png" width="190"/>
</p>

## Что сделано
- 🗃 подключение **SwiftData**
- 🏷 создание модели `Book`
- 🔎 использование `@Query`
- 💾 сохранение книг через `modelContext`
- 🗑 удаление книг
- 📄 DetailView для просмотра информации о книге
- 😊 `EmojiRatingView`
- ⭐ `RatingView` с `@Binding`

---

# 🚀 Bookworm (final)

## 📸 Скриншоты

<p align="center">
  <img src="Bookworm(final)/Images/Screenshot%202026-03-28%20at%2003.31.53.png" width="170"/>
  <img src="Bookworm(final)/Images/Screenshot%202026-03-28%20at%2003.32.15.png" width="170"/>
  <img src="Bookworm(final)/Images/Screenshot%202026-03-28%20at%2003.32.33.png" width="170"/>
  <img src="Bookworm(final)/Images/Screenshot%202026-03-28%20at%2003.32.56.png" width="170"/>
</p>

<p align="center">
  <img src="Bookworm(final)/Images/Screenshot%202026-03-28%20at%2003.33.18.png" width="170"/>
  <img src="Bookworm(final)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2003.34.03.png" width="170"/>
  <img src="Bookworm(final)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2003.34.37.png" width="170"/>
  <img src="Bookworm(final)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-28%20at%2003.34.49.png" width="170"/>
</p>

## ✅ Что улучшено в финальной версии
- 🎨 красивый градиентный фон
- 🪪 карточный стиль интерфейса
- 🧩 отдельный `BookRowView`
- 🧷 свои `ViewModifier` в `BookwormStyles`
- ⭐ равномерный кастомный `RatingView`
- 📌 бейдж жанра
- ❗ книги с рейтингом **1 звезда** выделяются
- 🗂 сохранение, чтение и удаление через **SwiftData**
- 📅 дата добавления книги
- 🛡 защита от пустых полей
- 🖼 fallback-картинка для неизвестного жанра
- 🗑 удаление:
  - из списка
  - через `EditButton`
  - через экран деталей

---

# 🧪 Challenge — выполненные задания

## 1️⃣ Исправление проблемы с пустыми данными
Было важно не допустить, чтобы книга сохранялась без нужных данных.

Сделано:
- валидация `title`
- валидация `author`
- дефолтный жанр
- безопасная картинка для неизвестного жанра

Пример:
```swift
var formIsValid: Bool {
    !trimmedTitle.isEmpty && !trimmedAuthor.isEmpty
}
````

---

## 2️⃣ Выделение книг с рейтингом 1⭐

Книги с самым низким рейтингом подсвечиваются визуально.

Пример:

```swift
.foregroundStyle(book.rating == 1 ? .red : .primary)
```

---

## 3️⃣ Добавление даты

В модель книги добавлен новый атрибут даты, который сохраняет текущее время создания записи.

Пример:

```swift
var date: Date
```

Инициализация:

```swift
date: Date = .now
```

Отображение:

```swift
Text(book.date, format: .dateTime.day().month().year().hour().minute())
```

---

# 🧠 Что изучено в проекте

## SwiftUI

* `NavigationStack`
* `Form`
* `TextField`
* `TextEditor`
* `Picker`
* `Button`
* `Toolbar`
* `Alert`
* `ScrollView`
* `List`
* `ViewModifier`
* `@State`
* `@Binding`
* кастомные компоненты интерфейса

## SwiftData

* `@Model`
* `@Query`
* `modelContext.insert`
* `modelContext.delete`
* `.modelContainer(for:)`
* работа с сохранением данных

## Архитектура и UI

* вынос повторяющегося UI в отдельные `View`
* применение собственных модификаторов
* улучшение внешнего вида без потери логики
* поддержка detail screen и list screen
* сочетание красивого интерфейса и системного поведения

---

# 📂 Структура

* `Bookworm/`
* `Bookworm(part_two)/`
* `Bookworm(part_four)/`
* `Bookworm(final)/`

---

# 🇺🇸 English Version

## 📖 About the Project

**Bookworm** is a **SwiftUI + SwiftData** app built step by step, evolving from a simple book form into a polished book-tracking app with ratings, reviews, saved dates, validation, and custom UI styling.

Users can:

* ➕ add books
* ✍️ write reviews
* ⭐ rate books
* 💾 persist data with SwiftData
* 🗑 delete books
* 📅 store creation dates
* 🎨 use a polished custom interface

---

# 🧩 Bookworm (base)

## What this stage represents

* initial project setup
* early screens
* preparation for the full data-driven version

> No dedicated `Images` folder for this base folder was present in the available project structure.

---

# 🧩 Bookworm (part_two)

## What was done

* basic app structure
* add-book form
* genre handling
* early rating flow
* screen navigation
* foundation for the full book-tracking app

---

# 🧩 Bookworm (part_four)

## What was done

* SwiftData integration
* `Book` model
* `@Query`
* saving with `modelContext`
* deleting books
* detail screen
* `EmojiRatingView`
* custom `RatingView` using `@Binding`

---

# 🚀 Bookworm (final)

## Final Improvements

* 🎨 gradient background
* 🪪 card-based interface
* 🧩 reusable `BookRowView`
* 🧷 custom modifiers in `BookwormStyles`
* ⭐ custom evenly spaced `RatingView`
* 📌 genre badge
* ❗ highlighting 1-star books
* 🗂 save, fetch, and delete using SwiftData
* 📅 book creation date
* 🛡 form validation
* 🖼 fallback image for unknown genre
* 🗑 deletion from:

  * list
  * edit mode
  * detail screen

---

# 🧪 Challenges Completed

## 1️⃣ Data validation

* no empty title
* no empty author
* default genre
* fallback image for unknown genres

## 2️⃣ Highlighting low-rated books

```swift
.foregroundStyle(book.rating == 1 ? .red : .primary)
```

## 3️⃣ Date support

```swift
var date: Date
```

```swift
date: Date = .now
```

```swift
Text(book.date, format: .dateTime.day().month().year().hour().minute())
```

---

# 🧠 What I Learned

## SwiftUI

* `NavigationStack`
* `Form`
* `TextField`
* `TextEditor`
* `Picker`
* `Button`
* `Toolbar`
* `Alert`
* `ScrollView`
* `List`
* `ViewModifier`
* `@State`
* `@Binding`
* custom UI components

## SwiftData

* `@Model`
* `@Query`
* `modelContext.insert`
* `modelContext.delete`
* `.modelContainer(for:)`
* persistence workflow

## Architecture & UI

* extracting reusable views
* creating custom modifiers
* improving UI without breaking logic
* combining polished design with system behavior

