import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app_ankara_flutter/view/login_vew.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: Column(mainAxisAlignment: MainAxisAlignment.center, children: const [
      ImageHolder(),
      Padding(
        padding: EdgeInsets.all(8.0),
        child: MyStepper(),
      ),
    ])));
  }
}

class ImageHolder extends StatelessWidget {
  const ImageHolder({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: SizedBox(height: 90, width: 90, child: Image.asset('assets/images/logo.jpg')),
    );
  }
}

class MyStepper extends StatefulWidget {
  const MyStepper({super.key});

  @override
  State<MyStepper> createState() => _MyStepperState();
}

class _MyStepperState extends State<MyStepper> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Stepper(
        currentStep: _index,
        onStepCancel: () {
          if (_index > 0) {
            setState(() {
              _index--;
            });
          }
        },
        onStepContinue: () {
          if (_index <= 0) {
            setState(() {
              _index += 1;
            });
          } else {
            Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => const LoginView()));
          }
        },
        onStepTapped: (int index) {
          setState(() {
            _index = index;
          });
        },
        steps: <Step>[
          Step(
              title: const Text('Let\'s Start'),
              content: Container(
                alignment: Alignment.center,
                child: Column(
                  children: [
                    SizedBox(
                      height: 200,
                      width: 200,
                      child: Lottie.asset('assets/animations/animation.json'),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Column(
                          // c1
                          children: const [
                            Text(
                              'Welcome to Travel App',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              'Let\'s start your journey',
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )),
          Step(
              title: const Text("Have you an acount?"),
              content: Column(
                children: [
                  SizedBox(
                    height: 200,
                    width: 200,
                    child: Lottie.asset('assets/animations/login.json'),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Column(
                        // c1
                        children: const [
                          Text(
                            'Already have an account?',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Login to your account',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'Press continue to login',
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ))
        ]);
  }
}
