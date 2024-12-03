import 'package:flutter/material.dart';

class CalculatorPage extends StatefulWidget {
  const CalculatorPage({super.key});

  @override
  State<CalculatorPage> createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String input = '';
  String result = '0';
  String operator = '';
  double num1 = 0;
  double num2 = 0;

  void buttonPressed(String value) {
    setState(() {
      if (value == 'C') {
        input = '';
        result = '0';
        num1 = 0;
        num2 = 0;
        operator = '';
      } else if (value == '=' && operator.isNotEmpty) {
        num2 = double.parse(input);
        if (operator == '+') result = (num1 + num2).toString();
        if (operator == '-') result = (num1 - num2).toString();
        if (operator == '×') result = (num1 * num2).toString();
        if (operator == '÷' && num2 != 0) result = (num1 / num2).toString();
        input = '';
        operator = '';
      } else if ('+−×÷'.contains(value)) {
        num1 = double.parse(input);
        operator = value;
        input = '';
      } else {
        input += value;
        result = input;
      }
    });
  }

  Widget calculatorButton(String label,
      {Color bgColor = Colors.white, Color textColor = Colors.black}) {
    return GestureDetector(
      onTap: () => buttonPressed(label),
      child: Container(
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 4,
              offset: Offset(2, 2),
            ),
          ],
        ),
        alignment: Alignment.center,
        child: Text(
          label,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: textColor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: const Text(
            'Kalkulator',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          // Display
          Expanded(
            flex: 2,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              alignment: Alignment.bottomRight,
              color: Colors.white,
              child: Text(
                result,
                style: const TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          // Buttons
          Expanded(
            flex: 5,
            child: Container(
              padding: const EdgeInsets.all(10),
              child: GridView.count(
                crossAxisCount: 4,
                children: [
                  calculatorButton('C',
                      bgColor: Colors.red, textColor: Colors.white),
                  calculatorButton('÷',
                      bgColor: Colors.blue, textColor: Colors.white),
                  calculatorButton('×',
                      bgColor: Colors.blue, textColor: Colors.white),
                  calculatorButton('−',
                      bgColor: Colors.blue, textColor: Colors.white),
                  calculatorButton('7'),
                  calculatorButton('8'),
                  calculatorButton('9'),
                  calculatorButton('+',
                      bgColor: Colors.blue, textColor: Colors.white),
                  calculatorButton('4'),
                  calculatorButton('5'),
                  calculatorButton('6'),
                  calculatorButton('=',
                      bgColor: Colors.green, textColor: Colors.white),
                  calculatorButton('1'),
                  calculatorButton('2'),
                  calculatorButton('3'),
                  calculatorButton('0', bgColor: Colors.grey[300]!),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
