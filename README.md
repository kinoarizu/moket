# Flutix

[![Fork](https://img.shields.io/github/forks/abuazis/Flutix?style=social)](https://github.com/abuazis/Flutix/fork)&nbsp; [![Star](https://img.shields.io/github/stars/abuazis/Flutix?style=social)](https://github.com/abuazis/Flutix/star)&nbsp; [![Watches](https://img.shields.io/github/watchers/abuazis/Flutix?style=social)](https://github.com/abuazis/Flutix/)&nbsp;

> Watch movie in theater much easier

## Description
Flutix is ​​a mobile application (iOS & Android) that helps people to buy tickets to watch online through their mobile phones. Flutix also uses the data collection method to display movies that match the user's profile.

## Demo
Get Flutix on PlayStore <a href="https://play.google.com/store/apps/details?id=com.abuazis.flutix">https://play.google.com/store/apps/details?id=com.abuazis.flutix</a>

<p><img  src="https://i.ibb.co/93JLD0X/poster-app.png"/></p>

## Features

- User Management (login/sign up)
- Now Playing Movies
- Select Cinema
- Select Showtimes
- Browse Movie by Category
- E-Wallet (for ticket transaction)
- Data Collection (genre dan preferred language)

## Techstack

- Dart
- Flutter SDK
- Firebase
- Public API (https://developers.themoviedb.org/3)
- Pub.dev

## Installing

- git clone https://github.com/abuazis/Flutix.git
- get themovie db api key in <a href="https://developers.themoviedb.org/3">The Movie DB Developer</a>
- put api key in  **lib/shared/shared_value.dart**
  ```dart
  part of 'shared.dart';
  
  String apiKey = "<YOUR_API_KEY_HERE>";
  ```
- flutter packages get
- flutter run

## Release History

- 1.0.0+1
  - CHANGE: APK release

## Credit

Abu Azis – [@abuzaio](https://instagram.com/abuzaio) – abuazis0204@gmail.ocm

Distributed under the MIT license. See `LICENSE` for more information.

[https://github.com/abuazis](https://github.com/abuazis/)
