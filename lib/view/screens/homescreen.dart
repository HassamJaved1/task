import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:task/components/custom_button.dart';
import 'package:task/components/input_field.dart';
import 'package:task/components/save_button.dart';
import 'package:task/constants/values.dart';
import 'package:task/data/logic.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //Creating change view to change the full layout and display the necessary values required
  bool changeView = false;

  MainLogic solution = MainLogic();

  //Creating the text controller for the input field
  TextEditingController kg = TextEditingController();
  TextEditingController lbs = TextEditingController();
  TextEditingController meter = TextEditingController();
  TextEditingController ft = TextEditingController();
  TextEditingController inches = TextEditingController();

  // Creating values to show them on screen

  double heightInMeter = 0.0;
  double weightInKg = 0.0;

  // Add a key for each value you want to save
  static const String kgKey = 'kgKey';
  static const String lbsKey = 'lbsKey';
  static const String meterKey = 'meterKey';
  static const String ftKey = 'ftKey';
  static const String inchesKey = 'inchesKey';

  @override
  void initState() {
    super.initState();
    // Load data when the widget is first created
    loadSavedData();
  }

  void loadSavedData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Load data for each input field
    setState(() {
      kg.text = prefs.getString(kgKey) ?? '';
      lbs.text = prefs.getString(lbsKey) ?? '';
      meter.text = prefs.getString(meterKey) ?? '';
      ft.text = prefs.getString(ftKey) ?? '';
      inches.text = prefs.getString(inchesKey) ?? '';
    });
  }

  Future<void> saveData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // Save data for each input field
    prefs.setString(kgKey, kg.text);
    prefs.setString(lbsKey, lbs.text);
    prefs.setString(meterKey, meter.text);
    prefs.setString(ftKey, ft.text);
    prefs.setString(inchesKey, inches.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            "Unit Converter with setState()",
            style: TextStyle(color: white),
          ),
          changeView
              ? Column(
                  children: [
                    ReusableInputField(
                      hintText: "kg",
                      controller: kg,
                    ),
                    ReusableInputField(
                      hintText: "meter",
                      controller: meter,
                    )
                  ],
                )
              : Column(
                  children: [
                    ReusableInputField(
                      hintText: "lbs",
                      controller: lbs,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: ReusableInputField(
                          hintText: "ft '",
                          controller: ft,
                        )),
                        Expanded(
                            child: ReusableInputField(
                          hintText: "in \"",
                          controller: inches,
                        )),
                      ],
                    ),
                  ],
                ),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: CustomButton(
              leftText: 'Imperial',
              rightText: 'Metric',
              onLeftButtonTap: () {
                if (changeView != false) {
                  setState(() {
                    changeView = !changeView;
                  });
                }
              },
              onRightButtonTap: () {
                if (changeView != true) {
                  setState(() {
                    if (changeView != true) {
                      changeView = !changeView;
                    }
                  });
                }

                solution.convertHeightToMeters(
                    feet: double.parse(ft.text),
                    inches: double.parse(inches.text));

                solution.convertWeightToKg(lbs: double.parse(lbs.text));

                heightInMeter = solution.heightInMeter;
                weightInKg = solution.weightInKg;

                meter.text = heightInMeter.toString();
                kg.text = weightInKg.toString();
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: SaveButton(
                text: "Save To Device",
                onTap: () {
                  saveData();
                }),
          )
        ],
      ),
    );
  }
}


// //////////////////

// import 'package:flutter/material.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:task/components/custom_button.dart';
// import 'package:task/components/input_field.dart';
// import 'package:task/components/save_button.dart';
// import 'package:task/constants/values.dart';
// import 'package:task/data/logic.dart';

// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);

//   @override
//   State<HomePage> createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   bool changeView = false;
//   MainLogic solution = MainLogic();

//   TextEditingController kg = TextEditingController();
//   TextEditingController lbs = TextEditingController();
//   TextEditingController meter = TextEditingController();
//   TextEditingController ft = TextEditingController();
//   TextEditingController inches = TextEditingController();

//   double heightInMeter = 0.0;
//   double weightInKg = 0.0;

//   // Add a key for each value you want to save
//   static const String kgKey = 'kgKey';
//   static const String lbsKey = 'lbsKey';
//   static const String meterKey = 'meterKey';
//   static const String ftKey = 'ftKey';
//   static const String inchesKey = 'inchesKey';

//   @override
//   void initState() {
//     super.initState();
//     // Load data when the widget is first created
//     loadSavedData();
//   }

//   void loadSavedData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     // Load data for each input field
//     setState(() {
//       kg.text = prefs.getString(kgKey) ?? '';
//       lbs.text = prefs.getString(lbsKey) ?? '';
//       meter.text = prefs.getString(meterKey) ?? '';
//       ft.text = prefs.getString(ftKey) ?? '';
//       inches.text = prefs.getString(inchesKey) ?? '';
//     });
//   }

//   Future<void> saveData() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();

//     // Save data for each input field
//     prefs.setString(kgKey, kg.text);
//     prefs.setString(lbsKey, lbs.text);
//     prefs.setString(meterKey, meter.text);
//     prefs.setString(ftKey, ft.text);
//     prefs.setString(inchesKey, inches.text);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: backgroundColor,
//       body: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           const Text(
//             "Unit Converter with setState()",
//             style: TextStyle(color: white),
//           ),
//           changeView
//               ? Column(
//                   children: [
//                     ReusableInputField(
//                       hintText: weightInKg.toString(),
//                       controller: kg,
//                     ),
//                     ReusableInputField(
//                       hintText: heightInMeter.toString(),
//                       controller: meter,
//                     )
//                   ],
//                 )
//               : Column(
//                   children: [
//                     ReusableInputField(
//                       hintText: "lbs",
//                       controller: lbs,
//                     ),
//                     Row(
//                       children: [
//                         Expanded(
//                           child: ReusableInputField(
//                             hintText: "ft '",
//                             controller: ft,
//                           ),
//                         ),
//                         Expanded(
//                           child: ReusableInputField(
//                             hintText: "in \"",
//                             controller: inches,
//                           ),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//           Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: CustomButton(
//               leftText: 'Imperial',
//               rightText: 'Metric',
//               onLeftButtonTap: () {
//                 if (changeView != false) {
//                   setState(() {
//                     changeView = !changeView;
//                   });
//                 }
//               },
//               onRightButtonTap: () {
//                 setState(() {
//                   if (changeView != true) {
//                     changeView = !changeView;
//                   }

//                   solution.convertHeightToMeters(
//                       feet: double.parse(ft.text),
//                       inches: double.parse(inches.text));
//                 });
//                 solution.convertWeightToKg(lbs: double.parse(lbs.text));

//                 heightInMeter = solution.heightInMeter;
//                 weightInKg = solution.weightInKg;

//                 meter.text = heightInMeter.toString();
//                 kg.text = weightInKg.toString();
//               },
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: SaveButton(
//               text: "Save To Device",
//               onTap: () {
//                 // Save data when the Save button is pressed
//                 saveData();
//               },
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }
