import 'package:flutter/material.dart';

class TodoTextField extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  const TodoTextField(
      {super.key, required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '$label: ',
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
        Container(
          height: 50,
          margin: const EdgeInsets.only(
            bottom: 10,
          ),
          child: TextFormField(
            keyboardType:
                label == 'ID' ? TextInputType.number : TextInputType.text,
            controller: controller,
          ),
        )
      ],
    );
  }
}
