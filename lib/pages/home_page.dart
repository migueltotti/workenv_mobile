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
        title: Text('Home Page'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              verticalDirection: VerticalDirection.up,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Logo do Flutterusando Images.network() com tamanho 100x100',
                  ),
                ),
                SizedBox(
                  width: 100,
                  height: 100,
                  child: Image.network(
                    'https://cdn-images-1.medium.com/v2/resize:fit:1200/1*5-aoK8IBmXve5whBQM90GA.png',
                  ),
                ),
              ],
            ),
            Column(
              verticalDirection: VerticalDirection.up,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    'Logo do Flutter usando Images.assets() com tamanho 200x200',
                  ),
                ),
                Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Container(
                      width: 300,
                      height: 150,
                      color: Colors.blueGrey,
                      alignment: Alignment.center,
                      child: Text(
                        'Container sobrepondo a logo do Flutter,\nusando o widget Stack',
                        textAlign: TextAlign.center,
                      ),
                    ),
                    SizedBox(
                      width: 200,
                      height: 200,
                      child: Image.asset('assets/images/flutter_logo.png'),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
