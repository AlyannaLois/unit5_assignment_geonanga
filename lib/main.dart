import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit 5 Calculator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const CalculatorScreen(),
    );
  }
}

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({super.key});

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  // Controllers for inputs in each row
  TextEditingController firstaddNumController = TextEditingController();
  TextEditingController secondaddNumController = TextEditingController();
  TextEditingController firstsubNumController = TextEditingController();
  TextEditingController secondsubNumController = TextEditingController();
  TextEditingController firstmulNumController = TextEditingController();
  TextEditingController secondmulNumController = TextEditingController();
  TextEditingController firstdivNumController = TextEditingController();
  TextEditingController seconddivNumController = TextEditingController();

  // Results for each operation
  double sum = 0;
  double difference = 0;
  double product = 0;
  double quotient = 0;

  void performOperation(String operation) {
    double num1, num2, result = 0;

    switch (operation) {
      case "+":
        num1 = double.tryParse(firstaddNumController.text) ?? 0;
        num2 = double.tryParse(secondaddNumController.text) ?? 0;
        result = num1 + num2;
        setState(() {
          sum = result;
        });
        break;
      case "-":
        num1 = double.tryParse(firstsubNumController.text) ?? 0;
        num2 = double.tryParse(secondsubNumController.text) ?? 0;
        result = num1 - num2;
        setState(() {
          difference = result;
        });
        break;
      case "*":
        num1 = double.tryParse(firstmulNumController.text) ?? 0;
        num2 = double.tryParse(secondmulNumController.text) ?? 0;
        result = num1 * num2;
        setState(() {
          product = result;
        });
        break;
      case "/":
        num1 = double.tryParse(firstdivNumController.text) ?? 0;
        num2 = double.tryParse(seconddivNumController.text) ?? 0;
        result = num2 != 0 ? num1 / num2 : 0; 
        setState(() {
          quotient = result;
        });
        break;
    }
  }

  // Clear inputs and result for each operation
  void clearInputs() {
    setState(() {
      firstaddNumController.clear();
      secondaddNumController.clear();
      firstsubNumController.clear();
      secondsubNumController.clear();
      firstmulNumController.clear();
      secondmulNumController.clear();
      firstdivNumController.clear();
      seconddivNumController.clear();
      sum = 0;
      difference = 0;
      product = 0;
      quotient = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Addition Row
            buildOperationRow("+", firstaddNumController, secondaddNumController, sum),
            // Subtraction Row
            buildOperationRow("-", firstsubNumController, secondsubNumController, difference),
            // Multiplication Row
            buildOperationRow("*", firstmulNumController, secondmulNumController, product),
            // Division Row
            buildOperationRow("/", firstdivNumController, seconddivNumController, quotient),

            // Clear Button
            ElevatedButton(
              onPressed: clearInputs,
              child: const Text("Clear All"),
            ),
          ],
        ),
      ),
    );
  }

  // Widget for each operation row
  Widget buildOperationRow(String operation, TextEditingController firstNumController,
      TextEditingController secondNumController, double result) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Expanded(
          child: TextField(
            controller: firstNumController,
            decoration: const InputDecoration(labelText: "First Number"),
            keyboardType: TextInputType.number,
          ),
        ),
        Text(" $operation "),
        Expanded(
          child: TextField(
            controller: secondNumController,
            decoration: const InputDecoration(labelText: "Second Number"),
            keyboardType: TextInputType.number,
          ),
        ),
        Text(" = $result"),
        IconButton(
          onPressed: () => performOperation(operation),
          icon: const Icon(Icons.calculate),
        ),
      ],
    );
  }
}