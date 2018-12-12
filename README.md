# gradient_toolbar

A Flutter package to add a gradient toolbar with a lot of customization.

## Usage
To use this plugin, add `gradient_toolbar` as a dependency in your [pubspec.yaml](https://github.com/rohitgupta1694/FlutterGithubUserSearch/blob/master/pubspec.yaml) file.

```yaml
  dependencies:
    flutter:
      sdk: flutter
    gradient_toolbar: ^0.0.4
```


### Example

Please find the [example](https://github.com/rohitgupta1694/GradientToolBar/blob/master/example/lib/main.dart):

``` dart

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
            title: "Gradient Toolbar", // Toolbar Title Text
            textColor: Colors.white, // Toolbar Title Text Color
            fontSize: 22.0, // Toolbar Title Text Font Size
            fontStyle: FontStyle.normal, // Toolbar Title Text Font Style
            fontWeight: FontWeight.w600, // Toolbar Title Text Font Weight
            needLeadingButton: true, // Toolbar Back Button Visibility Flag
            needTrailingButton: true, // Toolbar Trailing Button Visibility Flag
            trailingIcon: Icons.search, // Toolbar Trailing Button Icon
            leadingIconColor: Colors.white, // Toolbar Leading Button Color
            trailingIconColor: Colors.white, // Toolbar Trailing Button Color
            onLeadingIconClick: _handleLeadingButtonClick, // Toolbar Leading Button Callback
            onTrailingIconClick: _handleTrailingButtonClick, // Toolbar Trailing Button Callback
            toolbarStartColor: Color(0xFF414345), // Toolbar Gradient Start Color
            toolbarEndColor: Color(0xFF232526), // Toolbar Gradient End Color
            gradientTileMode: TileMode.clamp, // Toolbar Gradient Tile Mode
          ),
          // Use Expanded widget to use rest of the screen.
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[Text("Gradient Toolbar")],
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


```

### Created & Maintained By

[Rohit Gupta](https://github.com/rohitgupta1694)

* ([Twitter@rohitgupta1694](https://www.twitter.com/rohitgupta1694))
* ([Medium@rohitgupta1694](https://medium.com/@rohitgupta1694))

## Getting Started

This project is a starting point for a Dart
[package](https://flutter.io/developing-packages/),
a library module containing code that can be shared easily across
multiple Flutter or Dart projects.

For help getting started with Flutter, view our 
[online documentation](https://flutter.io/docs), which offers tutorials, 
samples, guidance on mobile development, and a full API reference.
