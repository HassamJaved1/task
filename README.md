# task

An app that does basic conversions of height and weight


## Folder Structure
This app has been made with Flutter Framework. There are different folders which are made for the separation of concerns. The Data folder contains all the logic and operations that is to be performed on data. The constant folder contains all the reuseable values that our app uses. The components folder have been made for reuseable widgets. The view has a folder screen that contains the homepage where all the main work is happening

## Code Explanation

The provided Flutter code represents a unit converter application with a focus on weight and height. The application utilizes the shared_preferences package for persistent data storage, allowing users to save and retrieve input values even when the app is closed. The home page is structured with input fields for weight and height in both imperial (pounds, feet, inches) and metric (kilograms, meters). The user can toggle between imperial and metric units using a custom button. The conversion logic is handled by the MainLogic class, and when the user switches units, the corresponding values are calculated and displayed on the screen. Additionally, the application features a "Save to Device" button, which triggers the storage of the entered values using SharedPreferences. The initState method ensures that previously saved data is loaded when the widget is first created. Overall, the code demonstrates the use of stateful widgets, controllers, and shared preferences to create a functional unit converter app with a straightforward user interface.





















A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.
