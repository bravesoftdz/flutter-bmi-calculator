import 'package:flutter/material.dart';
import 'package:flutter_bmi_calculator/bmi_model.dart';
import 'package:flutter_bmi_calculator/home_page.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ResultPage extends StatelessWidget {
  late BMIModel _bmiModel;

  ResultPage(BMIModel _bmiModel) {
    this._bmiModel = _bmiModel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              height: 60,
            ),
            SvgPicture.asset(
              _bmiModel.isNormal
                  ? 'assets/icons/happy.svg'
                  : 'assets/icons/sad.svg',
              height: 150,
              width: 150,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              'Your BMI is',
              style: TextStyle(fontSize: 22, color: Colors.red.shade600),
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${_bmiModel.bmi.round()}',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.red.shade600,
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            Text(
              '${_bmiModel.comments}',
              style: TextStyle(fontSize: 15, color: Colors.black),
            ),
            const SizedBox(
              height: 8,
            ),
            InkWell(
              onTap: () {
                ///ON-PRESSED

                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomePage(),
                  ),
                );
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
                    'Go Back',
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
