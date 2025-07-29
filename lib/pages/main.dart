import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:work_env_mobile/pages/create_account.dart';
import 'package:work_env_mobile/pages/home.dart';
import 'package:work_env_mobile/pages/login.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(textTheme: GoogleFonts.spaceGroteskTextTheme()),
      home: const Login(),
      routes: {
        '/my-home-page':
            (context) => MyHomePage(title: 'Flutter Demo Home Page'),
        '/home-page': (context) => HomePage(),
        '/login': (context) => Login(),
        '/create-account': (context) => CreateAccount(),
      },
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
  int _counter = 0;
  bool _isMenuOpen = false;
  Icon _menuState = Icon(Icons.menu);

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/login');
              },
              style: TextButton.styleFrom(
                textStyle: TextStyle(fontStyle: FontStyle.italic),
              ),
              child: Text('Login Page'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () => log('TextButton Clicado'),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.red,
                foregroundColor: Colors.white,
                textStyle: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                elevation: 10,
              ),
              child: Text('ElevatedButton'),
            ),
            SizedBox(height: 20),
            OutlinedButton(
              onPressed: () => log('TextButton Clicado'),
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.lightBlue,
                foregroundColor: Colors.black,
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              child: Text('OutlinedButton'),
            ),
            SizedBox(height: 20),
            BackButton(),
            SizedBox(height: 20),
            IconButton(onPressed: () {}, icon: Icon(Icons.access_alarm)),
            SizedBox(height: 20),
            MenuItemButton(
              onPressed: () {
                setState(() {
                  _isMenuOpen = !_isMenuOpen;
                  _menuState =
                      !_isMenuOpen ? Icon(Icons.menu) : Icon(Icons.menu_open);
                });
              },
              child: _menuState,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).pushNamed('/homePage');
              },
              child: Icon(Icons.navigate_next),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
