import 'package:flutter/material.dart';
import 'package:gradient_toolbar/gradient_toolbar.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: ExampleApp(),
    );
  }
}

class ExampleApp extends StatefulWidget {
  @override
  _ExampleAppState createState() => _ExampleAppState();
}

class _ExampleAppState extends State<ExampleApp> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      backgroundColor: Colors.white,

      /// Define Column in body and then add GradientToolBar widget as a child
      body: Column(
        children: <Widget>[

          ///This is the Gradient tool bar widget
          GradientToolBar(
            title: "Gradient ToolBar",
            needLeadingButton: false,
            needTrailingButton: false,
          ),

          /// Use Expanded widget to use rest of the screen.
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[Text("Gradient Toolbar sample")],
          ))
        ],
      ),
    );
  }

  void _handleLeadingButtonClick(bool clickStatus) {
    //TODO: Do something
  }

  void _handleTrailingButtonClick(bool clickStatus) {
    //TODO: Do something
  }
}
