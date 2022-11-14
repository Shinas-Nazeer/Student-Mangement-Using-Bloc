


import 'package:flutter/material.dart';

class TextField1 extends StatelessWidget {
  const TextField1({
    Key? key,
    
    required this.label,
    required this.onPressed,
  }) : super(key: key);


  final String label;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
       
        onChanged: (value) => onPressed(value),
        decoration: InputDecoration(
            border: const OutlineInputBorder(), label: Text(label)),
      ),
    );
  }
}