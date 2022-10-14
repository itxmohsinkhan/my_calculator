import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

import 'components/custom_button.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var userInput = '';
  var answer = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff252525),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 2, vertical: 5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Align(
                        alignment: Alignment.bottomRight,
                        child: Text(
                          userInput.toString(),
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ),
                      const SizedBox(height: 70),
                      Text(
                        answer.toString(),
                        style:
                            const TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(
                      children: [
                        CustomButton(
                          title: 'AC',
                          color: const Color(0xff1357a6),
                          onPress: () {
                            userInput = '';
                            answer = '';
                            setState(() {});
                          },
                        ),
                        CustomButton(
                          title: '+/-',
                          onPress: () {
                            userInput += '+/-';
                            setState(() {});
                          },
                        ),
                        CustomButton(
                          title: '%',
                          onPress: () {
                            userInput += '%';
                            setState(() {});
                          },
                        ),
                        CustomButton(
                          title: '/',
                          color: const Color(0xff1357a6),
                          onPress: () {
                            userInput += '/';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomButton(
                          title: '7',
                          onPress: () {
                            userInput += '7';
                            setState(() {});
                          },
                        ),
                        CustomButton(
                          title: '8',
                          onPress: () {
                            userInput += '8';
                            setState(() {});
                          },
                        ),
                        CustomButton(
                          title: '9',
                          onPress: () {
                            userInput += '9';
                            setState(() {});
                          },
                        ),
                        CustomButton(
                          title: 'x',
                          color: const Color(0xff1357a6),
                          onPress: () {
                            userInput += 'x';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomButton(
                          title: '4',
                          onPress: () {
                            userInput += '4';
                            setState(() {});
                          },
                        ),
                        CustomButton(
                          title: '5',
                          onPress: () {
                            userInput += '5';
                            setState(() {});
                          },
                        ),
                        CustomButton(
                          title: '6',
                          onPress: () {
                            userInput += '6';
                            setState(() {});
                          },
                        ),
                        CustomButton(
                          title: '-',
                          color: const Color(0xff1357a6),
                          onPress: () {
                            userInput += '-';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomButton(
                          title: '1',
                          onPress: () {
                            userInput += '1';
                            setState(() {});
                          },
                        ),
                        CustomButton(
                          title: '2',
                          onPress: () {
                            userInput += '2';
                            setState(() {});
                          },
                        ),
                        CustomButton(
                          title: '3',
                          onPress: () {
                            userInput += '3';
                            setState(() {});
                          },
                        ),
                        CustomButton(
                          title: '+',
                          color: const Color(0xff1357a6),
                          onPress: () {
                            userInput += '+';
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        CustomButton(
                          title: '0',
                          onPress: () {
                            userInput += '0';
                            setState(() {});
                          },
                        ),
                        CustomButton(
                          title: '.',
                          onPress: () {
                            userInput += '.';
                            setState(() {});
                          },
                        ),
                        CustomButton(
                          title: 'DEL',
                          onPress: () {
                            userInput =
                                userInput.substring(0, userInput.length - 1);
                            setState(() {});
                          },
                        ),
                        CustomButton(
                          title: '=',
                          color: const Color(0xff1357a6),
                          onPress: () {
                            equalPres();
                            setState(() {});
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void equalPres() {
    String finalUserInput = userInput;
    finalUserInput = userInput.replaceAll('x', '*');
    Parser p = Parser();
    Expression expression = p.parse(finalUserInput);
    ContextModel contextModel = ContextModel();

    double eval = expression.evaluate(EvaluationType.REAL, contextModel);
    answer = eval.toString();
  }
}
