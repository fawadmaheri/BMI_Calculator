import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var wtController = TextEditingController();
  var ftController = TextEditingController();
  var inController = TextEditingController();

  var result = "";
  var bgColor = Colors.indigo.shade200; // Initialize with the default color

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Center(child: Text('BMI')),
      ),
      body: Container(
        color: bgColor,
        child: Center(
          child: Container(
            width: 300,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'BMI',
                  style: TextStyle(
                    fontSize: 34,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 21,
                ),
                TextField(
                  controller: wtController,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Weight (in KG)',
                    prefixIcon: Icon(Icons.line_weight),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: ftController,
                  decoration: InputDecoration(
                    labelText: 'Enter Your Height ( in Feet)',
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 11,
                ),
                TextField(
                  controller: inController,
                  decoration: InputDecoration(
                    labelText: 'Enter your Height (in Inches)',
                    prefixIcon: Icon(Icons.height),
                  ),
                  keyboardType: TextInputType.number,
                ),
                SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {
                    var wt = wtController.text.toString();
                    var ft = ftController.text.toString();
                    var inch = inController.text.toString();

                    if (wt != "" && ft != "" && inch != "") {
                      //BMI Calculation
                      var iWt = int.parse(wt);
                      var iFt = int.parse(ft);
                      var iInch = int.parse(inch);

                      var tInch = (iFt * 12) * iInch;
                      var tCm = tInch * 2.54;
                      var tM = tCm / 100;

                      var bmi = iWt / (tM * tM);
                      var msg = "";

                      if (bmi > 25) {
                        msg = "You're OverWeight";
                        setState(() {
                          bgColor = Colors.orange.shade200;
                        });
                      } else if (bmi >= 18.5) {
                        msg = "You're Healthy!!";
                        setState(() {
                          bgColor = Colors.green.shade200;
                        });
                      } else {
                        msg = "You're UnderWeight";
                        setState(() {
                          bgColor = Colors.red.shade200;
                        });
                      }

                      setState(() {
                        result =
                            "$msg \n Your Bmi is: ${bmi.toStringAsFixed(4)}";
                      });
                    } else {
                      setState(() {
                        result = "Please fill all the required blanks!!";
                      });
                    }
                  },
                  child: Text(
                    'Calculate',
                    style: TextStyle(fontSize: 21, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(
                  height: 11,
                ),
                Text(
                  result,
                  style: TextStyle(fontSize: 19),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(
                          child: Text('BMI',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold))),
                      Expanded(
                          child: Text('Weight Status',
                              style: TextStyle(
                                  fontSize: 21, fontWeight: FontWeight.bold))),
                    ],
                  ),
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Text('Below 18.5')),
                      Expanded(child: Text('Underweight')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Text('18.5 – 24.9')),
                      Expanded(child: Text('Normal/Healthy Weight')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Text('25.0 – 29.9')),
                      Expanded(child: Text('Overweight')),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Expanded(child: Text('30.0 and above')),
                      Expanded(child: Text('Obese')),
                    ],
                  )
                ])
              ],
            ),
          ),
        ),
      ),
    );
  }
}
