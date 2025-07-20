# Flutter Internship: Responsive Calculator App

[![Flutter Version](https://img.shields.io/badge/flutter-3.10%2B-blue.svg)](https://flutter.dev)
[![Dart SDK](https://img.shields.io/badge/dart-3.5%2B-blue.svg)](https://dart.dev)

A minimal, responsive calculator application built with Flutter.  
This project was created as part of a Flutter internship to demonstrate core Flutter concepts: layouts, state management, theming, and package integration.

## 🚀 Table of Contents

- [Demo](#-demo)  
- [Features](#-features)  
- [Prerequisites](#-prerequisites)  
- [Getting Started](#-getting-started)  
- [Project Structure](#-project-structure)  
- [Usage](#-usage)  
- [Dependencies](#-dependencies)  
- [Contributing](#-contributing)  
- [License](#-license)  
- [Contact](#-contact)  

## 🎥 Demo

## ⭐ Features

- **Responsive Design**  
  Scales to any screen size (mobile, web, desktop) using MediaQuery and LayoutBuilder.
- **Basic Arithmetic**  
  Addition, subtraction, multiplication, division, percentage, sign toggle.
- **Clear & Delete**  
  Full clear (`C`) or single-character delete (`DEL`).
- **Expression Parsing**  
  Uses the `math_expressions` package for safe evaluation.
- **Custom Theming**  
  Dark theme with color‑coded buttons for operations, numbers, and actions.
- **Cross‑Platform**  
  Runs on Android, iOS, Web, macOS, Windows, Linux.

## 📋 Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (v3.10 or above)
- [Dart SDK](https://dart.dev/get-dart) (v3.5 or above)
- A simulator/emulator or a real device

## 🛠 Getting Started

1. **Clone the repo**  
   ```bash
   git clone https://github.com/narayan24x7/Flutter-Internship.git
   cd Flutter-Internship
````

2. Install dependencies

   ```bash
   flutter pub get
   ```

3. Run the app

   Android / iOS
     ```bash
     flutter run
     ```

   Web
     ```bash
     flutter run -d chrome
     ```

  Desktop
     ```bash
     flutter run -d windows   # or macos / linux
     ```

## 🗂 Project Structure
```
Flutter-Internship/
├── android/
├── ios/
├── linux/
├── macos/
├── web/
├── windows/
├── lib/
│   └── main.dart          # Entry point & UI
├── test/                  # Unit & widget tests
├── pubspec.yaml           # Project metadata & dependencies
├── analysis_options.yaml  # Lint rules
└── README.md              # This file
```

## ▶️ Usage

* **Tap** any numeric button to build your expression.
* Press **`=`** to evaluate.
* Press **`C`** to clear the entire input.
* Press **`DEL`** to delete the last character.
* Use **`%`** to calculate percentage, and **`+/-`** to toggle sign.


## 📦 Dependencies

| Package            | Version | Purpose                          |
| ------------------ | ------- | -------------------------------- |
| `flutter`          | SDK     | UI framework                     |
| `cupertino_icons`  | ^1.0.8  | iOS style icons                  |
| `math_expressions` | ^2.0.0  | Parsing & evaluating expressions |
| `flutter_test`     | SDK     | Testing framework                |
| `flutter_lints`    | ^4.0.0  | Lint rules                       |


## 🤝 Contributing
1. Fork the repo
2. Create your feature branch (`git checkout -b feature/YourFeature`)
3. Commit your changes (`git commit -m 'Add YourFeature'`)
4. Push to the branch (`git push origin feature/YourFeature`)
5. Open a Pull Request

Please follow the existing code style and add tests for new functionality.

## 📄 License
This project is licensed under the [MIT License](LICENSE).

## 📬 Contact

Narayan Kachhi – narayankachhi43@gmail.com
