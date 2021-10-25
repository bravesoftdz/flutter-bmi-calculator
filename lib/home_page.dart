import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/bmi_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double _height = 40.0;
  double _weight = 10.0;
  double _bmi = 0.0;
  String comments = 'none';
  bool isNormal = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            SvgPicture.asset(
              'assets/icons/heart.svg',
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'BMI Calculator',
              style: TextStyle(fontSize: 22, color: Colors.red.shade600),
            ),
            const SizedBox(
              height: 8,
            ),
            const Text(
              'We care about your health',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Height (cm)',
              style: TextStyle(fontSize: 22, color: Colors.red.shade600),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Slider(
                min: 40,
                max: 300,
                divisions: 100,
                onChanged: (value) {
                  setState(() {
                    _height = value;
                  });
                },
                value: _height,
                label: '$_height',
                activeColor: Colors.red,
              ),
            ),
            Text(
              '$_height',
              style: TextStyle(fontSize: 22, color: Colors.red.shade600),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Weight (kg)',
              style: TextStyle(fontSize: 22, color: Colors.red.shade600),
            ),
            Container(
              padding: const EdgeInsets.all(8),
              child: Slider(
                min: 10,
                max: 150,
                divisions: 100,
                onChanged: (value) {
                  setState(() {
                    _weight = value;
                  });
                },
                value: _weight,
                label: '$_weight',
                activeColor: Colors.red,
              ),
            ),
            Text(
              '$_weight',
              style: TextStyle(fontSize: 22, color: Colors.red.shade600),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                ///ON-PRESSED
                setState(() {
                  BMIModel bmiModel;
                  _bmi = _weight / ((_height / 100) * (_height / 100));
                  if (_bmi >= 18.5 && _bmi <= 25) {
                    bmiModel = BMIModel(
                        bmi: _bmi,
                        isNormal: true,
                        comments: "You are Totaly Fit");
                  } else if (_bmi < 18.5) {
                    bmiModel = BMIModel(
                        bmi: _bmi,
                        isNormal: false,
                        comments: "You are Underweighted");
                  } else if (_bmi > 25 && _bmi <= 30) {
                    bmiModel = BMIModel(
                        bmi: _bmi,
                        isNormal: true,
                        comments: "You are Overweighted");
                  } else {
                    bmiModel = BMIModel(
                        bmi: _bmi, isNormal: false, comments: "You are Obesed");
                  }
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ResultPage(bmiModel),
                    ),
                  );
                });
              },
              child: Container(
                height: 60,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.red.shade600,
                  borderRadius: BorderRadius.circular(50.0),
                ),
                child: const Center(
                  child: Text(
                    'Calculate',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
