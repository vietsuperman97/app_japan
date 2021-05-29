# Washing Machine App

## Prerequisite

##### Install yaml

```
$ flutter pub get
```

##### Install xcode

Install from appstore

##### Cocoapod

```
$ sudo gem install cocoapods
```

## Add file build_runner .g.dart build general

```
 cd utils_libs && flutter pub run build_runner build && cd ..
```
## Add Main.dart

```
  --no-sound-null-safety => flutter build apk --split-per-abi --no-sound-null-safety
```

## Set-up

#### create .env

```
$ mkdir assets/.env
```

Update environment variable on .env
NOTE: on CI/CD piple, if a value is present on environment variable it overrides the value that is on the .env files

### install pod

```
$ cd ios && pod install && cd ..
```

## Run on iphone simulator

#### By Terminal

```
$ flutter run ios
```

#### By Xcode

```
$ open ios/techsauce.xcworkspace
```

## Run on Android

By Terminal: open android simulator or connect to real device

```
$ flutter run android
```

## Fastlane (Deprecated)

### Install:

```
$ brew cask install fastlane
```

### Deploy iOS

Fastlane using [match](https://docs.fastlane.tools/actions/match/#match) to access certificate and code signing.
Certificates will be stored on private [github](https://github.com/iconiclive/certificates). The files will be encrypted using OpenSSL.
To make sure match run correctly on your local machine, run:

```
$ fastlane ios certificates
```

##### Ship to Testflight:

```
$ fastlane ios beta
```

Use match on CircleCI:
https://docs.fastlane.tools/actions/match/#continuous-integration
Auto deploy on CircleCI:
https://circleci.com/docs/2.0/testing-ios/#using-fastlane

### Deploy Android

##### Prerequisite

1. Keystore: locate on android/app/keystore.jks
2. GoogleAPIServiceAccountUser.json: locate on android/key.json
3. Release key and password:

- Fill the follow variable on .env
  - ANDROID_RELEASE_STORE_FILE=keystore.jks
  - ANDROID_RELEASE_KEY_ALIAS=\<keystore alias>
  - ANDROID_RELEASE_STORE_PASSWORD=\<keystore store password>
  - ANDROID_RELEASE_KEY_PASSWORD=\<keystore key password>
- Export them to environment variable
  ```
  $ export $(cat .env | xargs)
  ```

##### Ship to android beta test

```
$ fastlane android beta
```

##### Circle CI

- keystore.jks, GoogleAPIServiceAccountUser.json and google-services.json is encoded to base64 and store as environment variable on CI:
  - ANDROID_RELEASE_SERVICE_ACCOUNT
  - ANDROID_RELEASE_KEYSTORE
  - ANDROID_GOOGLE_SERVICE_JSON
- To generate those keys and copy to clipboard:
  ```
  $ openssl base64 -A -in android/key.json | pbcopy
  $ openssl base64 -A -in android/app/keystore.jks | pbcopy
  $ openssl base64 -A -in android/app/google-services.json | pbcopy
  ```

## Rollbar: upload source map

1. Generate .sourcemap

```
$ yarn run bundle:ios
$ yarn run bundle:android
```

2. Upload source map

```
curl https://api.rollbar.com/api/1/sourcemap \
-F access_token=ACCESS_TOKEN_HERE \
-F version=insert_code_version_here.ios \
-F minified_url=http://reactnativehost/main.jsbundle \
-F source_map=@sourcemap.ios.js.map \
-F index.ios.js=@index.js
```

## Release for Multiple Tenents

1. Add new circleCI context:

- CircleCI settings > Org Settings > Contexts
- Add new environment variable

| Key                             | Description                                                                                                                                                                 | Example                                                                                  |
| ------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------------------------- |
| IOS_APP_IDENTIFIER              | iOS app bundler                                                                                                                                                             | com.futureassembly.techsauce                                                             |
| IOS_APP_DISPLAY_NAME            | iOS app display name                                                                                                                                                        | Techsauce                                                                                |
| TENANTS_URL                     | api endpoint to get tenant info                                                                                                                                             | https://staging.delegateconnect.co/api/v1/tenant/1                                       |
| PUSHER_BEAM_INSTANCE_ID         | Pusher Beam 's instance id                                                                                                                                                  |                                                                                          |
| ROLLBAR_POST_CLIENT_ITEM        | Rollbar 's post client                                                                                                                                                      |                                                                                          |
| DOMAIN_URL                      | Domain url                                                                                                                                                                  | https://staging.delegateconnect.co/                                                      |
| API_URL                         | BaseURl                                                                                                                                                                     | https://staging.delegateconnect.co/api/v1/                                               |
| MAPBOX_PUBLIC_KEY               | Mapbox public key (can be re-use for all app)                                                                                                                               | pk.eyJ1IjoidHJ1b25nIiwiYSI6ImNpd29kMnpsMjAwMG0yem1xYXU0cmpyaGUifQ.45xw9mg2P9uONRPeMP0viA |
| MAPBOX_STYLE                    | Mapbox style(can be re-use for all app)                                                                                                                                     | mapbox://styles/truong/ck4wj20lp1o4h1co9upom3ikx                                         |
| MAPWIZE_API_KEY                 | Mapwize api key                                                                                                                                                             | 24ed2f0eeedbc1316409b1e31dfd5050                                                         |
| ANDROID_GOOGLE_SERVICE_JSON     | google-services.json encoded to base64 </br> Use to push notification android https://support.google.com/firebase/answer/7015592#)                                          | `\$ openssl base64 -A -in google-services.json                                           | pbcopy` </br> Need 1 each app |
| ANDROID_RELEASE_SERVICE_ACCOUNT | GoogleAPIServiceAccountUser.json encoded to base64 </br> Support release android https://docs.fastlane.tools/getting-started/android/setup/#collect-your-google-credentials | `\$ openssl base64 -A -in GoogleAPIServiceAccountUser.json                               | pbcopy` |
| ANDROID_PACKAGE_NAME            | Android package name for app                                                                                                                                                | com.iconiclive.dc_racs_asc                                                               |
| ANDROID_APP_NAME                | Name of android app                                                                                                                                                         | Techsauce                                                                                |

2. Add new jobs to release new app on circleCI/config.yml using new context

3. Create a new application on appstore connect and google play console.
   Note: (Android) You have to create the application, upload keystore on app signing tab and upload app.aab once through the Play Console before using Fastlane. app.aab can be found on circleCI artifact
# app_japan
