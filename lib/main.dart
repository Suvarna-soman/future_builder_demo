import 'package:flutter/material.dart';

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
      home: SimpleFutureBuilder(),
    );
  }
}




class SimpleFutureBuilder  extends StatelessWidget {
  const SimpleFutureBuilder({super.key});

  Future<String> fetchData() {
    return Future.delayed(Duration(seconds: 2), () => "Hello, FutureBuilder!");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Simple FutureBuilder'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: fetchData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              // While the future is not yet complete, show a loading indicator
              return CircularProgressIndicator();
            }
            else if (snapshot.hasError) {
              // If an error occurred during the Future execution
              return Text('Error: ${snapshot.error}');
            } else {
              // When the Future is complete, display the result
              return Text('Result: ${snapshot.data}');
            }
          },
        ),
      ),
    );
  }
}








