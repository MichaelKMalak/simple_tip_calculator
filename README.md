# Tip Calculator
## Step 0: Empty Project

## Next Steps
- [Step 1: Empty Layout](https://github.com/MichaelKMalak/simple_tip_calculator/tree/step-1)
- [Step 2: Editable fields](https://github.com/MichaelKMalak/simple_tip_calculator/tree/step-2)
- [Step 3: Persist the state](https://github.com/MichaelKMalak/simple_tip_calculator/tree/step-3)
- [Step 4: non-editable fields](https://github.com/MichaelKMalak/simple_tip_calculator/tree/step-4)

## How to run 
  - Run `flutter packages get` to download pubspec dependencies.
  - Run `flutter clean` for most of first run errors you may face.
  - Run `flutter run` to try it live on running emulator or usb connected device.
  - You can target a specific device to run by run `flutter devices` and getting the id and running `flutter run -d <device_id>`.
  - Run `flutter build apk` to generate APK file.
  - Run `flutter build ios` to package iOS app.

# Tutorial
What’s the best way to learn flutter as a beginner? Create a simple application that does one minimum functionality of course!
In this tutorial, you’ll be building a single-page tip calculator. You will learn more about Flutter’s basic widgets and state management, by learning more about:
- Stateful and stateless widgets
- Basic Flutter widgets 
- The build method

## Getting started

Start Android Studio 3.5 or later with the Flutter plugin installed, then choose Get from Version Control.

Enter https://github.com/MichaelKMalak/simple_tip_calculator.git as the URL and choose a directory and click on clone. After cloning is finished, click Get dependencies on the Packages get message near the top of Android Studio to pull down the project dependencies.
You might face an issue with Android studio not recognizing dart support. You can go to File → Settings → Language & Framework → Flutter, and make sure the flutter SDK path is set right. 

You can easily move between different steps in the code by clicking on step-0 in android studio’s bottom bar.

## Understanding a Stateful widget
Almost every element of your Flutter app is a widget. Since you are creating a page **TipCalculator**, you are creating a widget. Thus you need to think if it would be a stateful or a stateless widget.
- A Stateless widget depends only upon its configuration info.
- A Stateful widget needs to maintain dynamic information by interacting with a basic State object in which you can alter the configuration to manage the state of the widget.

Our widget will need to keep the state of whatever values entered by the user. For every user input, the state of the values stored will be replaced. Thus you’ll consider using a stateful widget.

## Creating an Empty Page
To create the Tip Calculator page, first, you’ll create a new file in the lib directory.

Our main -and only- page will be a simple flutter widget called TipCalculator, which is a class that extends StatefulWidget.

```dart
class TipCalculator extends StatefulWidget {
  TipCalculator({Key key}) : super(key: key);

  @override
  _TipCalculatorState createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
 
@override
 Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(
       	 title: Text('Tip Calculator'),
   	       centerTitle: true,
  	     ),
	body: Container();
    );
 }
}
```
Here we:
1. Created a class TipCalculator and made it a stateful widget by extending StatefulWidget.
2. Overridden its createState function to initialize another class _TipCalculatorState.
3. Overridden the build function to build our widget TipCalculator.
4. Used Scaffold widget which ensures having basic material design visual layout structure.
5. Used  AppBar widget and provided it with a title: Text which is a widget that takes a String to display it.
6. Put in the body an empty plain Container just as a placeholder for now.

The build function can potentially be called in every frame, so it is not only called when the widget is initialized, but it is called in various other states like when the dependencies are changed or when setState is called. You can read more about the build function here. 

After creating the widget, you’ll need to make sure it opens once the app is opened. You can replace the **Container** widget in MyApp Widget’s Scaffold body in main.dart to our **TipCalcuator**.

## Adding an empty layout
Before creating the empty layout, you need to envision how the body will be structured. You want four fields listed vertically. The four fields should be
1. Bill field: an editable field in which the user puts the total amount of the bill.
2. Tip percentage field: an editable field in which the user puts the percentage to tip.
3. Tip Amount field: a non-editable field that displays the calculated amount to tip.
4. Total Amount field: a non-editable field that displays the calculated total bill.

You’ve more than an option to list these widgets. You can have them in a Column Widget that takes a list of widgets. However,  it won’t be scrollable, so you’ll use a ListView instead. 
- ListView is the most commonly used scrolling widget in Flutter. It displays its children one after another in the scroll direction which is default to vertical.

```dart
body: ListView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          Text('Bill amount - (editable widget)'),
          SizedBox(height: 25),
          Text('Tip Percentage - (editable widget)'),
          SizedBox(height: 25),
          Divider(),
          SizedBox(height: 25),
          Text('Tip Amount - (not editable widget)'),
          SizedBox(height: 25),
          Text('Total Amount - (not editable widget)')
        ],
      ),
```

Here we:
1. Used ListView widget in the body
2. Added padding to it: EdgeInsets.all(15), which is equivalent to 15 pixels horizontally and vertically.
3. Used Text as a placeholder.
4. Used Divider and SizedBox widgets to adjust the spacing and style between the widgets.
Currently, the layout looks like this:

<img src="https://github.com/MichaelKMalak/simple_tip_calculator/blob/step-1/screenshots/screenshot_1.png" width="350" />

## Creating the editable widgets
You want to allow the user to enter text on this page. Flutter provides us with the TextFormField widget for that purpose.

```dart
TextFormField(
                initialValue: '0',
                keyboardType: TextInputType.numberWithOptions(decimal: true),
                onChanged: (String value){},
                decoration: InputDecoration(
                  hintText: 'Enter the Bill Amount',
                  labelText: 'Bill Amount',
                ),
              ),
```

Here you implemented the first widget in which you ask the user to enter the bill amount. Tip Percentage widget is identical to this widget but with a different hint and label texts. A few notes to take notice of
initialValue takes a string, not a num.
1. You can change various styles for the text field by adding configurations to decoration.
2. You can adjust the type of the keyboard that shows to the user but accessing different types from TextInputType.
3. You pass to onChanged configuration an empty function that takes a string as input. It is empty now since you don’t do anything when the text is changed by the user.
Above the overridden build method, you add:
```dart
static const double initialBillAmount = 0;
static const double initialTipPercentage = 15;
```

Since the initial values are constants.  
- **const** means that the object's entire state can be determined entirely at compile-time and that the object will be completely immutable.
- **static** means the values are part of the class instead of the instance. In dart, they are not initialized until they're used.

The initialValue in TextFormField takes only Strings, thus you convert the double to strings.

```dart
initialValue: initialBillAmount.toString(),
```
And similarly to initialTipPercentage.

The page now looks like the following:

<img src="https://github.com/MichaelKMalak/simple_tip_calculator/blob/step-2/screenshots/screenshot_2.gif" width="350" />

## Updating the state when the editable widget is changed
When the bill amount and tip percentage is changed, you need to get and update the non-editable fields; tip amount and total bill amount.
TextFormField widget gives us two options to do that.
1. You can pass the function to the onChanged for each of the TextFormField, and save the state of the retrieved String in the level of the TipCalculator Widget.
2. You can pass a TextEditingController for each of the TextFormFields, and access the text from the controllers.
Although the second option gives us more options, you’ll go with the first option since it is less complicated.
Above the overridden build function, you add two variables that you’ll preserve the state of the widget at.

```dart
double _billAmount = initialBillAmount;
double _tipPercentage = initialTipPercentage;
```

Since the returned values from TextFormField onChanged function is String and not double, you can’t save them directly and it should be parsed. You add private functions _onBillAmountChanged and _onTipAmountChanged above the build function.

```dart
_onBillAmountChanged(String value) {
    setState(() {
      _billAmount = double.tryParse(value) ?? 0.0;
    });
  }
```

**\_onTipAmountChanged** will have the same function body.
The ?? operator is used to check if the value is null, if that was the case it will assign 0.0 to the equivalent variable. 

Now the app looks like this:

<img src="https://github.com/MichaelKMalak/simple_tip_calculator/blob/step-3/screenshots/screenshot_3.gif" width="350" />

## Adding getters for the required values
The non-editable widget should show the total amount and tip amount, and those are not calculated yet. You can create getters for that.

**What are getter methods?** Getters are special methods that provide read access to an object's properties. You can use the get keyword that dart provides.

Above the build function you add:
```dart
double get _getTipAmount => _billAmount * _tipPercentage / 100;
double get _getTotalAmount => _billAmount + _getTipAmount;
String get _tipAmountString => _tipAmount.toStringAsFixed(2);
String get _totalAmountString => _totalAmount.toStringAsFixed(2);
```
The toStringAsFixed method converts the double to a string with a specific number of decimal places, in our case, to only 1 decimal place.

## Creating the non-editable widgets
You now have the Strings, and the remaining is creating the widgets to display those non-editable fields. You have more than an option
1. Use Row widget with two Text fields
2. Use ListTile widget with title and trailing
3. Create our unique widget
In our case, you’ll go for the second option to make it less complex.

```dart
ListTile(
         title: Text('Tip Amount'),
         trailing: Text('\$$_tipAmountString'),
         contentPadding: EdgeInsets.zero,
         ),
```

And similarly with \_totalAmountString to display the total amount. Here we
1. Displayed the Text \_tipAmountString as a trailing widget in the ListTile
2. Added a '\$' before the String to show a dollar sign above the value.
3. Set content padding to zero since ListTile has a default horizontal padding.
Now the Tip Calculator page is complete!

<img src="https://github.com/MichaelKMalak/simple_tip_calculator/blob/step-4/screenshots/screenshot_4.gif" width="350" />
