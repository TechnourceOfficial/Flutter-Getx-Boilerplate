# Welcome to New Flutter GetX Boilerplate

This repository provides a boilerplate codebase for developing flutter applications using dart. It aims to provide a starting point with preconfigured project structure, common libraries, and best practices to kickstart your flutter development process.


## Table of Contents
* [Getting Started](#getting-started)
* [Software and Version Install flutter](#software-and-version-install-flutter)
* [Features](#features)
* [Clone Project](#clone-project)
* [Folder Structure](#folder-structure)
* [Dependencies](#dependencies)
* [LICENSE](#license)

## Getting Started

This project is a starting point for a Android application.

A few resources to get you started if this is your first Android project:

- [Flutter Documentation](https://docs.flutter.dev/)
- [Dart Documentation](https://dart.dev/guides)

For help getting started with flutter development, refer to the [official flutter documentation](https://flutter.dev/learn), which provides tutorials, samples, guidance on mobile development, and a comprehensive API reference.



## Software and Version Install flutter:
    - [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)
- Install Android Studio : Android Studio Flamingo | 2022.2.1 Patch 2
    - https://developer.android.com/studio/install
- Xcode (14.2) Install :
    - https://apps.apple.com/us/app/xcode/id497799835?mt=12

- Android supported version:
  - compileSdk 33
  - minSdk 21
  - targetSdk 33
  - versionCode 1
  - versionName "1.0"

## Features
* [Authentication](#authentication)
* [Dashboard](#dashboard)

## Clone Project:

git clone https://github.com/TechnourceOfficial/New-Flutter-Getx-Boilerplate.git

After cloning the project, you can open it in Android Studio by following these steps:
1. Open Android Studio.
2. Select "Open an existing Android Studio project" from the welcome screen.
3. Navigate to the directory where you cloned the project and select the project folder.
4. Click "OK" to open the project in Android Studio.
5. Android Studio will take some time to index and set up the project.
6. Once the indexing is complete, you can start working on the Flutter project in Android Studio.
7. Enable dart support to the current project.
8. If configuration not set then in android studio go to add configuration and add path of main.dart
9. Go to pubspec.yaml file or into terminal of project path run command: flutter pub get
10. After these steps run project.


## State Management Pattern used:
- Getx Pattern (get: ^4.6.5) [https://pub.dev/packages/get](https://pub.dev/packages/get)

## Folder Structure:
```commandline
├── New-Flutter-Getx-Boilerplate                   
│   ├── android
│   ├── assests
│   ├── build
│   ├── ios
│   ├── lib       
│   	├── global
│   		├── app_localization   
│   		├── component         
│   		├── constant  
│   		├── dialogue
│   		├── extention 
│   		├── preference 
│   		├── theme                   
│   		├── utils  
│   		├── widgets            
│       ├── src
│   	    ├── routes
│   	    ├── view
│       ├── flutter_boilerplate
│       ├── main
├── analysis_options.yaml
├── pubspec.yaml
└── README.md        
```
## Dependencies:

1. get: 4.6.5
   -> Used for Getx Pattern
2. loading_indicator: ^3.0.2
   -> Used for create custom loader
3. google_fonts: 4.0.3
   -> Used fonts from `https://fonts.google.com/`
4. pin_code_fields: ^7.4.0
   -> Used generate pin code fields
5. flutter_svg: ^2.0.5
   -> Used for painting and displaying Scalable Vector Graphics
6. get_storage: ^2.0.3
   -> Used for create store data in app session	
7. overlay_support: ^2.0.1
   -> easy to build toast and internal notification	
8. flutter_localization: ^0.1.10
   -> Used for in-app localization with map data
9. image_picker: ^0.8.5+3
   -> Used for pick images from camera & gallery
10. file_picker: 
    -> Used for pick documents	
11. image_cropper: ^3.0.0
    -> Used for crop images
12. permission_handler: ^10.0.0
    -> Used for handle permission
13. webview_flutter: ^3.0.4
    -> Used for WebView widget on Android and iOS.
14. url_launcher:
    -> Used for Launch the Url.
15. connectivity_plus:
    -> Used for Internet connection to check whether it is connected or not.
16. lottie:
    -> Used for Annimated assets.

## Authentication
- Registration Screen
- Login Screen
- Forgot-password Screen
- OTP Verification Screen
- Reset Password Screen
- Edit Profile Screen
- Upload Photo from Camera & Gallery

## Dashboard
- Dashboard UI with Bottom TabNavigation
- AboutUs Screen
- Terms-Conditions Screen
- Privacy-Policy Screen
- Change Language Screen
- Logout Screen

## Application Language
- English
- French
- Russian

## Application Preview

https://github.com/TechnourceOfficial/New-Flutter-Getx-Boilerplate/assets/70566076/9aacb463-0a81-47fc-a434-632015052cea

## License

- This project is licensed under the [MIT License](LICENSE)



