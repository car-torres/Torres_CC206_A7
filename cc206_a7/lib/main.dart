import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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
  // manage the sum section
  int sum = 0;
  int sub = 0;
  int mul = 0;
  double div = 0;

  // Text controllers for the input fields
  TextEditingController firstNumController = TextEditingController();
  TextEditingController secondNumController = TextEditingController();

  // Clear the inputs and reset calculations
  void clearInputs() {
    firstNumController.clear();
    secondNumController.clear();
    setState(() {
      sum = 0;
      sub = 0;
      mul = 0;
      div = 0;
    });
  }

  // Method to get the values from the text fields
  int _getFirstNumber() {
    return int.tryParse(firstNumController.text) ?? 0;
  }

  int _getSecondNumber() {
    return int.tryParse(secondNumController.text) ?? 0;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Unit 5 Calculator"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          // Add Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstNumController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" + "),
              Expanded(
                child: TextField(
                  controller: secondNumController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(' = $sum'),
              IconButton(
                icon: const Icon(Icons.add),
                onPressed: () {
                  setState(() {
                    sum = _getFirstNumber() + _getSecondNumber();
                  });
                },
              ),
            ],
          ),
          // Subtraction Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstNumController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" - "),
              Expanded(
                child: TextField(
                  controller: secondNumController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(' = $sub'),
              IconButton(
                icon: const Icon(Icons.remove),
                onPressed: () {
                  setState(() {
                    sub = _getFirstNumber() - _getSecondNumber();
                  });
                },
              ),
            ],
          ),
          // Multiplication Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstNumController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" x "),
              Expanded(
                child: TextField(
                  controller: secondNumController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(' = $mul'),
              IconButton(
                icon: const Icon(Icons.close),
                onPressed: () {
                  setState(() {
                    mul = _getFirstNumber() * _getSecondNumber();
                  });
                },
              ),
            ],
          ),
          // Division Row
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                child: TextField(
                  controller: firstNumController,
                  decoration: const InputDecoration(labelText: "First Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              const Text(" ÷ "),
              Expanded(
                child: TextField(
                  controller: secondNumController,
                  decoration: const InputDecoration(labelText: "Second Number"),
                  keyboardType: TextInputType.number,
                ),
              ),
              Text(' = ${div.toStringAsFixed(2)}'),
              IconButton(
                icon: const Icon(Icons.horizontal_split), // Replace 'Icons.division'
                onPressed: () {
                  setState(() {
                    int secondNum = _getSecondNumber();
                    if (secondNum != 0) {
                      div = _getFirstNumber() / secondNum;
                    } else {
                      div = 0; // Avoid division by zero
                    }
                  });
                },
              ),
            ],
          ),
          // Clear Button
          TextButton(
            onPressed: clearInputs,
            child: const Text("Clear"),
          ),
        ],
      ),
    );
  }
}
