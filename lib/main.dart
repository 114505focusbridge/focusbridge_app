import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  Future<void> fetchData() async {
    final response = await http.get(Uri.parse('http://127.0.0.1:8000/'));
    print('Response status: ${response.statusCode}');
    print('Response body: ${response.body}');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('FocusBridge')),
        body: Center(
          child: ElevatedButton(
            onPressed: fetchData,
            child: const Text('Fetch API'),
          ),
        ),
      ),
    );
  }
}

