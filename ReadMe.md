# Ebury

## Description
**Ebury** is an iOS app designed to allow users check a list of wallets and their details. 

The app is designed using **MVVM** architecture, written in **Swift**, and employs **SwiftUI** for the user interface. 

It supports the **iPhone SE 3rd gen**, ensuring compatibility with the smallest screen size currently supported.

## Features

- **Home View**:
  - Displays a list of user's wallets.
  - Features a 'View All' button to navigate to a screen where a more detailed list of user's wallets would be displayed.
  - Wallet cell can be tapped to navigate to a screen where more detailed info for that wallet would be displayed.

- **Products View**:
  - As per designs, this screen shows a 'Coming soon' message.

## Technical Aspects

- **Development Environment**:
  - Developed using Xcode version 15.1.
- **Frameworks**:
  - Views built with `SwiftUI`.
  - Asynchronous operations handled with `async/await`.
- **Architecture**:
  - Implemented using **MVVM** for a clean and maintainable codebase.
- **Data Retrieval**:
  - Utilizes a local API to simulate network calls, receive, and parse data.
  - Refer to the server project for more info on how to start it. It can be found in the ZIP for this project and in [GitHub]().
- **Image Loading**:
  - Integrated `SwiftUI`'s built-in `AsyncImage` for efficient image loading.
- **Code Quality**:
  - Adhered to **SOLID** principles.
- **Unit Testing**:
  - Implemented unit tests for the data layer.

## Installation
1. Start local server. Project can be found [here]() and attached to the ZIP for this project.
2. Clone the repository.
3. Open the project in Xcode.
4. Build and run the app on your preferred simulator or device.

## Contact

For any inquiries, please contact Rodrigo Limpias at [rodrigolimpiascossio@icloud.com](rodrigolimpiascossio@icloud.com).

