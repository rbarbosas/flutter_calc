import 'package:flutter/material.dart';

class CalcButtonWidget extends StatelessWidget {
  final Widget icon;
  final VoidCallback onPressed;
  final dynamic color;
  const CalcButtonWidget(
      {Key? key,
      required this.icon,
      required this.onPressed,
      this.color = Colors.grey})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(4),
        child: DecoratedBox(
          decoration: BoxDecoration(
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(25),
            gradient: LinearGradient(
              colors: [
                color,
                color.shade700,
              ],
            ),
          ),
          child: ElevatedButton(
            style: ButtonStyle(
              //backgroundColor: MaterialStateProperty.all(color),
              backgroundColor: MaterialStateProperty.all(Colors.transparent),
              shadowColor: MaterialStateProperty.all(Colors.transparent),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  //side: BorderSide(color: Colors.red),
                ),
              ),
            ),
            onPressed: onPressed,
            child: icon,
          ),
        ),
      ),
    );
  }
}
