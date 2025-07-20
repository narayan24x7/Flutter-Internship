import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

void main() {
  runApp(CalculatorApp());
}

class CalculatorApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Calculator',
      debugShowCheckedModeBanner: false,
      home: CalculatorPage(),
    );
  }
}

class CalculatorPage extends StatefulWidget {
  @override
  _CalculatorPageState createState() => _CalculatorPageState();
}

class _CalculatorPageState extends State<CalculatorPage> {
  String userInput = '';
  String answer = '0';

  final List<String> buttons = [
    'C', '+/-', '%', 'DEL',
    '7', '8', '9', '/',
    '4', '5', '6', 'x',
    '1', '2', '3', '-',
    '0', '.', '=', '+',
  ];

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),
                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      // Display section
                      Container(
                        padding: const EdgeInsets.all(20),
                        color: Colors.black,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              reverse: true,
                              child: Text(
                                userInput,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.08,
                                  color: Colors.white70,
                                ),
                              ),
                            ),
                            SizedBox(height: 10),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              reverse: true,
                              child: Text(
                                answer,
                                style: TextStyle(
                                  fontSize: screenWidth * 0.1,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      // Buttons section
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.grey[900],
                            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
                          ),
                          child: GridView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: buttons.length,
                            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 4,
                              mainAxisSpacing: 12,
                              crossAxisSpacing: 12,
                              childAspectRatio: 1.1,
                            ),
                            itemBuilder: (context, index) {
                              final btn = buttons[index];

                              return ElevatedButton(
                                onPressed: () => handleTap(btn),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: getButtonColor(btn),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),
                                  padding: EdgeInsets.zero,
                                ),
                                child: Text(
                                  btn,
                                  style: TextStyle(
                                    fontSize: screenWidth * 0.06,
                                    color: getTextColor(btn),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Color getButtonColor(String label) {
    if (label == 'C' || label == 'DEL') return Colors.redAccent;
    if (label == '=' || label == '+' || label == '-' || label == 'x' || label == '/') {
      return Colors.orange;
    }
    if (label == '%' || label == '+/-') return Colors.grey[700]!;
    return Colors.grey[850]!;
  }

  Color getTextColor(String label) {
    return Colors.white;
  }

  void handleTap(String label) {
    setState(() {
      switch (label) {
        case 'C':
          userInput = '';
          answer = '0';
          break;

        case 'DEL':
          if (userInput.isNotEmpty) {
            userInput = userInput.substring(0, userInput.length - 1);
          }
          break;

        case '=':
          calculate();
          break;

        case '+/-':
          if (userInput.isNotEmpty) {
            if (userInput.startsWith('-')) {
              userInput = userInput.substring(1);
            } else {
              userInput = '-' + userInput;
            }
          }
          break;

        case '%':
          userInput += '/100';
          break;

        default:
          userInput += label;
      }
    });
  }

  void calculate() {
    try {
      String finalInput = userInput.replaceAll('x', '*');

      Parser p = Parser();
      Expression exp = p.parse(finalInput);
      ContextModel cm = ContextModel();
      double eval = exp.evaluate(EvaluationType.REAL, cm);

      answer = eval.toStringAsFixed(4).replaceAll(RegExp(r'\.?0+$'), '');
    } catch (e) {
      answer = 'Error';
    }
  }
}
