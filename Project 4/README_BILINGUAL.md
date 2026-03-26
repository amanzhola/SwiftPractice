# BetterRest Project

---

# 🇷🇺 Русская версия

## BetterRest: Введение

Пол Хадсон `@twostraws`
31 января 2023

Этот проект SwiftUI — ещё одно приложение, основанное на формах, которое попросит пользователя ввести информацию и преобразует всё это в alert (всплывающее уведомление), что может показаться скучным — вы ведь уже делали такое, верно?

Что ж, да, но практика никогда не бывает лишней. Однако причина, по которой у нас довольно простой проект, заключается в том, что я хочу познакомить вас с одной из действительно мощных возможностей разработки под iOS: машинным обучением (ML).

Во все iPhone уже встроена технология под названием **Core ML**, которая позволяет нам писать код, делающий предсказания о новых данных на основе ранее увиденных данных. Мы начнём с сырых данных, передадим их нашему Mac как обучающие данные, а затем используем результат, чтобы создать приложение, способное делать точные оценки для новых данных — прямо на устройстве и с полной конфиденциальностью для пользователей.

Приложение, которое мы будем создавать, называется **BetterRest**, и оно предназначено для того, чтобы помочь любителям кофе хорошо высыпаться, задавая им три вопроса:

* Во сколько они хотят просыпаться?
* Примерно сколько часов сна они хотят?
* Сколько чашек кофе они выпивают в день?

Когда у нас будут эти три значения, мы передадим их в Core ML и получим результат, который скажет нам, во сколько им следует ложиться спать.

---

## Структура проекта

* BetterRest(part_one) — базовая версия
* BetterRest(part_two) — версия с ML моделью
* BetterRest(part_three) — финальная версия
* Images — дополнительные изображения

---

# 🇬🇧 English Version

## BetterRest: Introduction

Paul Hudson `@twostraws`
January 31st, 2023

This SwiftUI project is another forms-based application that asks users to input data and transforms it into an alert. At first glance, it may seem simple or even repetitive.

However, the purpose of this project is to introduce one of the most powerful features in iOS development: **Machine Learning (ML)**.

All iPhones include a technology called **Core ML**, which allows developers to make predictions based on previously seen data. We start with raw data, train a model on a Mac, and then use that model inside the app to make accurate predictions directly on the device while maintaining full user privacy.

The app we are building is called **BetterRest**, and it helps coffee drinkers get better sleep by asking three questions:

* When do they want to wake up?
* How many hours of sleep do they want?
* How many cups of coffee do they drink per day?

Using this data, the app calculates the ideal bedtime.

---

## Project Structure

* BetterRest(part_one) — basic version
* BetterRest(part_two) — version with ML integration
* BetterRest(part_three) — final version
* Images — additional assets

---

# 📸 Screenshots

## Part One

<p align="center">
  <img src="BetterRest(part_one)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-25%20at%2014.41.54.png" width="220"/>
</p>

---

## Part Two

<p align="center">
  <img src="BetterRest(part_two)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-25%20at%2014.42.52.png" width="200"/>
  <img src="BetterRest(part_two)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-25%20at%2014.43.08.png" width="200"/>
</p>

---

## Part Three

<p align="center">
  <img src="BetterRest(part_three)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-25%20at%2014.44.16.png" width="180"/>
  <img src="BetterRest(part_three)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-25%20at%2014.44.29.png" width="180"/>
  <img src="BetterRest(part_three)/Images/Simulator%20Screenshot%20-%20iPhone%2016%20Pro%20-%202026-03-25%20at%2014.44.43.png" width="180"/>
</p>

---

## Additional Screens

<p align="center">
  <img src="Images/Screenshot%202026-03-22%20at%2002.36.51.png" width="200"/>
  <img src="Images/Screenshot%202026-03-22%20at%2002.37.53.png" width="200"/>
</p>

