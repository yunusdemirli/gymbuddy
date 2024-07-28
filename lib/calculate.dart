import 'package:flutter/material.dart';

class CalculatorBottomSheet extends StatefulWidget {
  const CalculatorBottomSheet({
    super.key,
  });

  @override
  _CalculatorBottomSheetState createState() => _CalculatorBottomSheetState();
}

class _CalculatorBottomSheetState extends State<CalculatorBottomSheet> {
  TextEditingController weightController = TextEditingController();
  TextEditingController repsController = TextEditingController();
  bool isEditingWeight = false; // To track which field is being edited

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isEditingWeight = false;
                    });
                  },
                  child: AbsorbPointer(
                    absorbing: isEditingWeight,
                    child: TextField(
                      controller: repsController,
                      enabled: false,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Répétitions',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    isEditingWeight = !isEditingWeight;
                  });
                },
                child: const Icon(Icons.swap_horiz),
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    setState(() {
                      isEditingWeight = true;
                    });
                  },
                  child: AbsorbPointer(
                    absorbing: !isEditingWeight,
                    child: TextField(
                      controller: weightController,
                      enabled: false,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Poids (kg)',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: '1',
                onPressed: () {
                  _appendToActiveField('1');
                },
              ),
              NumberButton(
                number: '2',
                onPressed: () {
                  _appendToActiveField('2');
                },
              ),
              NumberButton(
                number: '3',
                onPressed: () {
                  _appendToActiveField('3');
                },
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: '4',
                onPressed: () {
                  _appendToActiveField('4');
                },
              ),
              NumberButton(
                number: '5',
                onPressed: () {
                  _appendToActiveField('5');
                },
              ),
              NumberButton(
                number: '6',
                onPressed: () {
                  _appendToActiveField('6');
                },
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: '7',
                onPressed: () {
                  _appendToActiveField('7');
                },
              ),
              NumberButton(
                number: '8',
                onPressed: () {
                  _appendToActiveField('8');
                },
              ),
              NumberButton(
                number: '9',
                onPressed: () {
                  _appendToActiveField('9');
                },
              ),
            ],
          ),
          const SizedBox(height: 10.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              NumberButton(
                number: 'C',
                onPressed: () {
                  _clearActiveField();
                },
              ),
              NumberButton(
                number: '0',
                onPressed: () {
                  _appendToActiveField('0');
                },
              ),
              NumberButton(
                number: '.',
                onPressed: () {
                  _appendToActiveField('.');
                },
              ),
            ],
          ),
          ElevatedButton(
            onPressed: () {
              // Extract the content of the text fields
              String weight = weightController.text;
              String reps = repsController.text;

              // Return the content of the text fields
              Navigator.of(context).pop({'weight': weight, 'reps': reps});
            },
            child: const Text('Ajouter'),
          ),
        ],
      ),
    );
  }

  void _appendToActiveField(String number) {
    if (isEditingWeight) {
      weightController.text += number;
    } else {
      repsController.text += number;
    }
  }

  void _clearActiveField() {
    if (isEditingWeight) {
      weightController.clear();
    } else {
      repsController.clear();
    }
  }
}

class NumberButton extends StatelessWidget {
  final String number;
  final VoidCallback onPressed;

  const NumberButton({
    required this.number,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.all(20),
        shape: const CircleBorder(),
      ),
      child: Text(number),
    );
  }
}
