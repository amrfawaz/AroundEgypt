# README #
Table of contents:
- [Getting Started](#getting-started)
- [Requirements](#requirements)
- [Architecture](#architecture)
- [Folders structure](#folders-structure)


## Getting Started
To get Around Egypt application up and running follow this simple step.
Install applications required in development process.

## Requirements ##

- Xcode 15.4
- iOS SDK 16+
- Swift 5.9+

## Features
- The home screen contains two main sections:
  1- Recommended Experiences: Displayed in a horizontal carousel.
  2- Recent Experiences: Displayed in a vertical list.
- All data on the home screen is cached in the Realm database once it is retrieved from online APIs, and this data should be available in offline mode.
- By clicking on any experience, you will be navigated to the experience details screen, which contains more information about the experience.
- The user can pull to refresh the list of experiences to get the latest updates.
- The user can like an experience.



## Architecture ##

The app is built using the MVVM (Model-View-ViewModel) architecture pattern for presentation layer, following Domain-Driven Design principles. The codebase is organized into domain, data, and presentation layers.

- **Domain Layer**:
  - Contains domain models representing Experiences entities.
  - Includes use cases for fetching Experiences data.

- **Data Layer**:
  - Manages network requests and data retrieval from the aroundegypt.34ml.com API.
  - Recent data is cached in Realm DB.

- **Presentation Layer**:
  - Uses SwiftUI for creating views.
  - Uses Combine for view model bindings and logic.

- **Tests**: XCTest for Unit testing in Domain and Data layers.

### Folders structure ##

* Sources:
- SupportingFiles (Info.plist)

* Package/:
- Inside Sources folder there is folder for each module 
- EnvironmentVariables: for App constants 
- CoreInterface: For UI related logic and constants
- Network Manager: Using URLSession for a robust network layer.
