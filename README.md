# Psico-app

## Psico app.

Version: 0.9.0

## Steps to setup
* Setup a new project in Firebase.
* Create a new Android app in Firebase.
* Download the google-services.json file and insert into android/app folder.
* Create and setup the key.properties file inside android folder.

## Steps to deploy

### Android
1. Set the environment `PRODUCTION` constant in `/lib/utils/configuration.dart`
2. Run `flutter clean`
3. Run `flutter build apk --obfuscate --split-debug-info=build/app/outputs/symbols/prod`

Docs: [Build and release Android](https://flutter.dev/docs/deployment/android).

### IOS
1. Set the environment `PRODUCTION` constant in `/lib/utils/configuration.dart`
2. Run `flutter clean`
3. Run `flutter build ipa --obfuscate --split-debug-info=build/ios/debug/symbols/prod`
4. Open `build/ios/archive/Runner.xcarchive` in Xcode
5. Click in "Distribute App" button and generate files

Docs: [Build and release IOS](https://flutter.dev/docs/deployment/ios).