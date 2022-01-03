import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_calc/view/widgets/calcButton.widget.dart';
import 'package:flutter_calc/viewmodel/calculator.viewmodel.dart';
import 'package:rx_notifier/rx_notifier.dart';

import '../app.controller.dart';
import 'widgets/themeSwitch.widget.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({Key? key}) : super(key: key);

  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  CalculatorViewmodel calcViewmodel = CalculatorViewmodel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [const ThemeSwitchButton()],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            const Spacer(),
            RxBuilder(builder: (context) {
              return AutoSizeText(
                calcViewmodel.expression,
                style: const TextStyle(fontSize: 35),
                maxLines: 1,
              );
            }),
            RxBuilder(builder: (context) {
              return AutoSizeText(
                calcViewmodel.isInput
                    ? calcViewmodel.input
                    : calcViewmodel.result != ""
                        ? calcViewmodel.result
                        : "0",
                style:
                    const TextStyle(fontSize: 100, fontWeight: FontWeight.bold),
                maxLines: 1,
              );
            }),
            Row(
              children: [
                CalcButtonWidget(
                  icon: const Text(
                    "AC",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.blueGrey,
                  onPressed: () {
                    calcViewmodel.clearExpression();
                  },
                ),
                CalcButtonWidget(
                  icon: const Text(
                    "C",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.blueGrey,
                  onPressed: () {
                    calcViewmodel.clearInput();
                  },
                ),
                CalcButtonWidget(
                  icon: const Text(
                    "%",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.blueGrey,
                  onPressed: () {
                    calcViewmodel.setPercentage();
                  },
                ),
                CalcButtonWidget(
                  icon: const Text(
                    "/",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {
                    calcViewmodel.setOperation("/");
                  },
                ),
              ],
            ),
            Row(
              children: [
                CalcButtonWidget(
                  icon: const Text(
                    "7",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    calcViewmodel.updateInput("7");
                  },
                ),
                CalcButtonWidget(
                  icon: const Text(
                    "8",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    calcViewmodel.updateInput("8");
                  },
                ),
                CalcButtonWidget(
                  icon: const Text(
                    "9",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    calcViewmodel.updateInput("9");
                  },
                ),
                CalcButtonWidget(
                  icon: const Text(
                    "X",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {
                    calcViewmodel.setOperation("*");
                  },
                ),
              ],
            ),
            Row(
              children: [
                CalcButtonWidget(
                  icon: const Text(
                    "4",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    calcViewmodel.updateInput("4");
                  },
                ),
                CalcButtonWidget(
                  icon: const Text(
                    "5",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    calcViewmodel.updateInput("5");
                  },
                ),
                CalcButtonWidget(
                  icon: const Text(
                    "6",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    calcViewmodel.updateInput("6");
                  },
                ),
                CalcButtonWidget(
                  icon: const Text(
                    "-",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {
                    calcViewmodel.setOperation("-");
                  },
                ),
              ],
            ),
            Row(
              children: [
                CalcButtonWidget(
                  icon: const Text(
                    "1",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    calcViewmodel.updateInput("1");
                  },
                ),
                CalcButtonWidget(
                  icon: const Text(
                    "2",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    calcViewmodel.updateInput("2");
                  },
                ),
                CalcButtonWidget(
                  icon: const Text(
                    "3",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    calcViewmodel.updateInput("3");
                  },
                ),
                CalcButtonWidget(
                  icon: const Text(
                    "+",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.blueAccent,
                  onPressed: () {
                    calcViewmodel.setOperation("+");
                  },
                ),
              ],
            ),
            Row(
              children: [
                CalcButtonWidget(
                  icon: const Text(
                    "0",
                    style: TextStyle(fontSize: 35, fontWeight: FontWeight.w400),
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    calcViewmodel.updateInput("0");
                  },
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CalcButtonWidget(
                            icon: const Text(
                              ".",
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.w400),
                            ),
                            color: Colors.grey,
                            onPressed: () {
                              calcViewmodel.updateInput(".");
                            },
                          ),
                          CalcButtonWidget(
                            icon: const Text(
                              "=",
                              style: TextStyle(
                                  fontSize: 35, fontWeight: FontWeight.w400),
                            ),
                            color: Colors.blueAccent,
                            onPressed: () {
                              calcViewmodel.setOperation("");
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
