import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

var wtController = TextEditingController();
var ftController = TextEditingController();
var inchController = TextEditingController();

var Result = "";
var BgColor = Color.fromARGB(255, 171, 173, 185);

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("yourBMI"),
      ),
      body: Container(
        color: BgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 34),
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: wtController,
                  decoration: InputDecoration(
                      label: Text("Enter your weight in KGs "),
                      prefixIcon: Icon(Icons.line_weight)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: ftController,
                  decoration: InputDecoration(
                      label: Text("Enter your Height in Feets "),
                      prefixIcon: Icon(Icons.height)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  textAlign: TextAlign.center,
                  controller: inchController,
                  decoration: InputDecoration(
                      label: Text("Enter your Height in inches"),
                      prefixIcon: Icon(Icons.height_outlined)),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                    onPressed: () {
                      var Weight = wtController.text.toString();
                      var Height = wtController.text.toString();
                      var Inch = inchController.text.toString();

                      if (Weight != "" && Height != "" && Inch != "") {
                        var iwt = int.parse(Weight);
                        var iht = int.parse(Height);
                        var iInch = int.parse(Inch);

                        var TotalInch = iht * 12 + iInch;

                        var TotalCm = TotalInch * 2.54;

                        var TotalM = TotalCm / 100;

                        var bmi = iwt / (TotalM * TotalM);
                        var msg = "";
                        if (bmi > 0.25) {
                          BgColor = const Color.fromARGB(255, 246, 189, 115);
                          msg = "You Are Over Weight";
                        } else if (bmi < 0.18) {
                          BgColor = Color.fromARGB(255, 230, 123, 123);
                          msg = "You Are Under Weight";
                        } else {
                          msg = "You re OK!!";
                          BgColor = Color.fromARGB(255, 127, 228, 179);
                        }

                        setState(() {
                          Result =
                              "$msg \n BMI Score is: ${bmi.toStringAsFixed(2)}";
                        });
                        //bmi calculation
                      } else {
                        setState(() {
                          Result = "Please Fill All The Required Blanks";
                        });
                      }
                    },
                    child: Text("Calculate")),
                SizedBox(
                  height: 10,
                ),
                Text(
                  Result,
                  style: TextStyle(fontSize: 11),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
