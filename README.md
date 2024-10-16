## Project: "Realtime Websocket Flutter"

This repository contains a Flutter project that demonstrates how to use Websocket in Flutter to create a realtime data socket application from EODHD website.


## My Flutter Environment

- **Flutter Version:** 3.24.0
- **Dart Version:** 2.18.0
- **Kotlin Version:** 1.9.2
- **Android SDK:** 34
- **iOS SDK:** 16.0

## Project Setup

1. **Clone the Repository:**

   ```bash
   git clone https://github.com/your-username/realtime-websocket-flutter.git
   cd realtime-websocket-flutter
    ```
2. **Install the Dependencies:**

   ```bash
   flutter pub get
   ```
3. **Test the Application:**

   ```bash
   flutter test
   ```

4. **Run the Application:**

   ```bash
    flutter run
    ```

## Tech
1. **Domain Driven Design (DDD):** This project is structured using the Domain Driven Design (DDD) architecture.
2. **Websocket:** The project uses the Websocket package to create a realtime chat application.
3. **Provider:** The project uses the Provider package for state management.
4. **BLoC:** The project uses the BLoC pattern for managing the business logic.
5. **Test Driven Development (TDD):** The project uses the Test Driven Development (TDD) approach to write tests before writing the actual code.

## Websocket
1. **Name:** OEDHD
2. **URL:** wss://ws.eodhistoricaldata.com/ws/crypto?api_token=demo
3. **Request:** {"action": "subscribe", "symbols": "ETH-USD,BTC-USD"}

## Screenshots
<img src="https://github.com/user-attachments/assets/9d4e5ad7-da0f-415d-b14d-a5efa15fc47a" width="200"/>
<img src="https://github.com/user-attachments/assets/b9d74513-f1c0-445a-914f-233807fa1e77" width="200"/>
<img src="https://github.com/user-attachments/assets/9fb2ff07-97af-451c-83d0-400985c0b869" width="200"/>

### Credits
This template is created by Jabalnur.
