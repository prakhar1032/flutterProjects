import 'package:alt_sms_autofill/alt_sms_autofill.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sms_autofill/sms_autofill.dart';

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
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  void initState() {
    super.initState();
  }

  bool check1 = false;

  // @override
  // void dispose() {
  //   AltSmsAutofill().unregisterListener();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: const Text('Filter Chip Widget Flutter'),
          ),
          body: Center(
            child: FilterChip(
              label: Text('Example', style: TextStyle(fontSize: 15)),
              selected: check1,
              backgroundColor: Colors.grey[300],
              onSelected: (bool value) {
                setState(() {
                  check1 = value;
                });
              },
              selectedColor: Color.fromRGBO(34, 187, 156, 1),
            ),
          )),
    );
  }
}
