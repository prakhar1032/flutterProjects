import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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

Future<void> getrequest() async {
  final queryParams = {'agentId': 'AGE000001'};
  final url = 'https://backend.gofloww.co/api/v1/agent-app/get-profile-details';
  final uri = Uri.parse(url).replace(queryParameters: queryParams);
  final response = await http.get(uri);
  print(response.body);
  print(response.statusCode);
  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    print(json);
  } else {
    print('error');
  }
  // print('response ${response.statusCode}');
  // print('response ${response.body}');
}

Future<void> postrequest() async {
  final title = 'title2';
  final description = 'des2';
  final agentId = 'AGE000001';
  final body = {
    'agentId': agentId,
    'agentName': 'agent_name',
    'emailId': 'email_id',
    'address': 'address',
    'driversLicenseNo': 'driving_no',
    'aadhaarNo': 'aadhar_no',
    'panCardNo': 'pan_no'
  };
  final url =
      'https://backend.gofloww.co/api/v1/agent-app/update-profile-details/';
  final uri = Uri.parse(url);
  final response = await http.post(
    uri,
    body: jsonEncode(body),
    headers: {'Content-Type': 'application/json'},
  );
  print(response.statusCode);
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text('API Call'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
                onPressed: postrequest, child: Text('      press      '))
          ],
        ),
      ),
    );
  }
}
