import 'package:flutter/material.dart';
import 'package:appwrite/appwrite.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Client client = Client();
  client = Client()
      .setEndpoint("https://cloud.appwrite.io/v1")
      .setProject("652ce70b6f485b07bd8a");
  ;
  Account account = Account(client);

  runApp(MyApp(
    account: account,
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, required this.account});
  final Account account;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   _client() {
//     Client client = Client();
//     client
//         .setEndpoint('https://cloud.appwrite.io/v1')
//         .setProject('652ce70b6f485b07bd8a')
//         .setSelfSigned(status: true);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(widget.title),
//       ),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text('hello'),
//           ],
//         ),
//       ),
//       // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
