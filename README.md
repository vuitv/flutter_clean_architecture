# Flutter Clean Architecture
```
    - Flutter v2.5.0
    - Clean Architecture
    - Presentation use Bloc
```
    
# Technical architecture components
- Clean Architecture 
- Dart rule analyze: pedantic
- State management: flutter_bloc
- Dependency injection: get_it 
- Network: dio 
- Unit test: Mockito 

## Run
```
    flutter clean
    flutter pub get
    flutter packages pub run build_runner watch
    
    flutter run --flavor development -t lib/main.dev.dart
    flutter run --flavor staging -t lib/main.staging.dart
    flutter run --flavor product -t lib/main.product.dart
```
## Build Release

- Android:
```
    flutter build apk --flavor development -t lib/main.dev.dart
    flutter build apk --flavor staging -t lib/main.staging.dart
    flutter build apk --flavor product -t lib/main.product.dart
```
- iOS:
```
    flutter build ios --flavor development -t lib/main.dev.dart
    flutter build ios --flavor staging -t lib/main.staging.dart
    flutter build ios --flavor product -t lib/main.product.dart
```

## Refer
 - https://github.com/ResoCoder/flutter-tdd-clean-architecture-course
 - https://geekysingh.medium.com/clean-architecture-for-enterprise-flutter-application-dc254a71059
 - https://github.com/trunghieuvn/flutter-clean-architecture
 - https://github.com/vantrung8794/flutter_code_base

<img src="./architecture-proposal.png" style="display: block; margin-left: auto; margin-right: auto; width: 75%;"/>

