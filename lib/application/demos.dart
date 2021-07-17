import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('DEMO'),
      ),
      body: ListView(
        children: [_button('Some example', () => null)],
      ),
    );
  }

  _button(String label, Function()? onTap) {
    return ElevatedButton(
      onPressed: onTap,
      child: Text(label),
    );
  }
}
