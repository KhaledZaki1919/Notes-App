import 'package:flutter/material.dart';
import 'package:notes/utils/constants/custom_MaterialButtom.dart';
import 'package:notes/utils/constants/custom_text.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          children: [
            Center(
              heightFactor: 1,
              child: Image(
                height: mediaQuery.size.height * 0.3,
                width: mediaQuery.size.width * 0.3,
                image: const AssetImage('assets/images/bald-man.png'),
                fit: BoxFit.cover,
              ),
            ),
            CustomTextTitle(
                text: 'Welcome!', fontsize: 35.0, fontWeight: FontWeight.bold),
            const SizedBox(
              height: 20.0,
            ),
            CustomTextP(
                text:
                    'Capture your ideas quickly,access them offline from anywhere .',
                fontsize: 19,
                fontWeight: FontWeight.bold),
            SizedBox(
              height: mediaQuery.size.height * 0.1,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.black,
                ),
                width: double.infinity,
                height: 60.0,
                //color: Colors.black,
                child: CustomButtom(text: 'Start', function: () {})),
          ],
        ),
      ),
    );
  }
}
