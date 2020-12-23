import 'package:flutter/material.dart';

class Algo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Grafico'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Aqui va un grafico'),
          onPressed: () {
            // Navigate to second route when tapped.
          },
        ),
      ),
    );
  }
}
