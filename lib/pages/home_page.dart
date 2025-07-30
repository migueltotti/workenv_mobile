import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Stack(
          children: [
            Container(
              width: 58,
              height: 58,
              decoration: BoxDecoration(
                color: Color.fromRGBO(74, 166, 240, 0.5),
                borderRadius: BorderRadius.circular(50),
              ),
            ),
            Icon(Icons.person_outline),
          ],
        ),
      ),
      body: ListView(),
    );
  }
}
