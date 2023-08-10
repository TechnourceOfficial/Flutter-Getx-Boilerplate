# Welcome to New Flutter GetX Boilerplate

This repository provides a boilerplate codebase for developing flutter applications using dart. It aims to provide a starting point with preconfigured project structure, common libraries, and best practices to kickstart your flutter development process.

- Softwares and Version Install Flutter (3.7.3) :
    - [https://docs.flutter.dev/get-started/install](https://docs.flutter.dev/get-started/install)
- Install Android Studio : Android Studio Flamingo | 2022.2.1 Patch 2
    - https://developer.android.com/studio/install
- Xcode (14.2) Install :
    - https://apps.apple.com/us/app/xcode/id497799835?mt=12

# Features

- Registration and Login
    - Normal authorization flow UI (signup, login, forget-password, otp-verification,
      reset-password)
- Dashboard UI with Bottom TabNavigation
- Edit Profile UI (upload Photo from Camera & Gallery)
- CMS page WebView (AboutUs, Terms-Conditions, Privacy-Policy)
- Logout Functionality

# Clone Project :

    git clone https://github.com/TechnourceOfficial/New-Flutter-Getx-Boilerplate.git

**Steps after project clone successfully.**

	1.  Enable dart support to the current project.
	2.  If configuration not set then in android studio go to add configuration and add path of main.dart
	3.  Go to pubspec.yaml file or into terminal of project path run command: flutter pub get
	4.  After these steps run project.

# About Project files:

- #### State Management Pattern used:
    - Getx Pattern (get: ^4.6.5) [https://pub.dev/packages/get](https://pub.dev/packages/get)
- #### Folder Structure
       - FlutterSetup/  
              |- android  
              |- assets  
              |- build  
              |- ios  
              |- lib  
              |- test  
       - lib/  
              |- app/  
              |- global/  
                     |- app_localization 
                     |- component   
                     |- constant
                     |- dialogue
                     |- extention
                     |- preference
                     |- theme  
                     |- utils
                     |- widgets  
              |- src  
                      |- routes  
                      |- views
              |- flutter_boilerplate.dart  
              |- main.dart

- #### Libraries & Tools Used:
       - 1.  get: 4.6.5
               -> Used for Getx Pattern
      - 2.  loading_indicator: ^3.0.2
               -> Used for create custom loader
      - 3.  google_fonts: 4.0.3
               -> Used fonts from `https://fonts.google.com/`
      - 4.  pin_code_fields: ^7.4.0
               -> Used generate pin code fields
      - 5.  flutter_svg: ^2.0.5
               -> Used for painting and displaying Scalable Vector Graphics
      - 6.  get_storage: ^2.0.3
               -> Used for create store data in app session	
      - 7.  overlay_support: ^2.0.1
               -> easy to build toast and internal notification	
      - 8.  flutter_localization: ^0.1.10
               -> Used for in-app localization with map data
      - 9.  image_picker: ^0.8.5+3
               -> Used for pick images from camera & gallery
      - 10.  file_picker: 
               -> Used for pick documents	
      - 11.  image_cropper: ^3.0.0
               -> Used for crop images
      - 12.  permission_handler: ^10.0.0
               -> Used for handle permission
      - 13.  webview_flutter: ^3.0.4
               -> Used for WebView widget on Android and iOS.
      - 14.  url_launcher:
             -> Used for Launch the Url.
      - 15.  connectivity_plus:
            -> Used for Internet connection to check whether it is connected or not.
      - 16.  lottie:
            -> Used for Annimated assets.

- ## Application Language
      - English
      - French
      - Russian

- Demo Video

https://github.com/TechnourceOfficial/New-Flutter-Getx-Boilerplate/assets/70566076/9aacb463-0a81-47fc-a434-632015052cea



