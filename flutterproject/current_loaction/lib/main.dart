import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:workmanager/workmanager.dart';

import 'notification.dart';

const fetchBackground = "fetchBackground";

void callbackDispatcher() {
  Workmanager().executeTask((taskName, inputData) {
    // your code that you want to run in background
    print('#' * 200);
    print('Executing task');
    Future.delayed(Duration(seconds: 4));
    print('Task executed: ' + taskName);
    return Future.value(true);
  });
}

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Workmanager().initialize(callbackDispatcher);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Background taks'),
      ),
      body: Container(),
    );
  }

  // @override
  // void initState() {
  //   super.initState();
  //   Workmanager().registerOneOffTask(
  //     'taskName',
  //     'backUpData',
  //     initialDelay: Duration(seconds: 5),
  //   );
  // }

  @override
  void initState() {
    Workmanager().registerPeriodicTask('uniqueName', 'taskName',
        frequency: Duration(hours: 1));
    super.initState();
  }
}
