
# react-native-the-coffee-time

## Getting started

`$ npm install react-native-the-coffee-time --save`

### Mostly automatic installation

`$ react-native link react-native-the-coffee-time`

### Manual installation


#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-the-coffee-time` and add `RNTheCoffeeTime.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNTheCoffeeTime.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNTheCoffeeTimePackage;` to the imports at the top of the file
  - Add `new RNTheCoffeeTimePackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-the-coffee-time'
  	project(':react-native-the-coffee-time').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-the-coffee-time/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-the-coffee-time')
  	```

#### Windows
[Read it! :D](https://github.com/ReactWindows/react-native)

1. In Visual Studio add the `RNTheCoffeeTime.sln` in `node_modules/react-native-the-coffee-time/windows/RNTheCoffeeTime.sln` folder to their solution, reference from their app.
2. Open up your `MainPage.cs` app
  - Add `using The.Coffee.Time.RNTheCoffeeTime;` to the usings at the top of the file
  - Add `new RNTheCoffeeTimePackage()` to the `List<IReactPackage>` returned by the `Packages` method


## Usage
```javascript
import RNTheCoffeeTime from 'react-native-the-coffee-time';

// TODO: What to do with the module?
RNTheCoffeeTime;
```
  