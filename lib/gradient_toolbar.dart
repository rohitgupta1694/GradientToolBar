library gradient_toolbar;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class GradientToolBar extends StatelessWidget {
  final double barHeight = 50.0;

  GradientToolBar(
      {Key key,
      this.title,
      this.textColor,
      this.fontSize,
      this.fontStyle,
      this.fontWeight,
      this.toolbarStartColor,
      this.toolbarEndColor,
      this.gradientTileMode,
      this.needLeadingButton,
      this.needTrailingButton,
      this.trailingIcon,
      this.onLeadingIconClick,
      this.onTrailingIconClick,
      this.leadingIconColor,
      this.trailingIconColor})
      : assert(title != null),
        assert(needLeadingButton != null),
        assert(needTrailingButton != null),
        super(key: key);

  String title;
  double fontSize;
  TileMode gradientTileMode;
  FontStyle fontStyle;
  FontWeight fontWeight;
  IconData trailingIcon;
  bool needLeadingButton, needTrailingButton;
  Color textColor,
      toolbarStartColor,
      toolbarEndColor,
      leadingIconColor,
      trailingIconColor;
  final ValueChanged<bool> onLeadingIconClick, onTrailingIconClick;

  void _onTrailingIconClick() {
    if (onTrailingIconClick != null)
      onTrailingIconClick(true);
    else
      print(
          "Please pass a trailing icon callback when initializing GradientToolbar");
  }

  void _onLeadingButtonClick() {
    if (onLeadingIconClick != null)
      onLeadingIconClick(true);
    else
      print(
          "Please pass a leading icon callback when initializing GradientToolbar");
  }

  @override
  Widget build(BuildContext context) {
    getDefaultValues();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    final double statusBarHeight = MediaQuery.of(context).padding.top;
    return Container(
      padding: new EdgeInsets.only(top: statusBarHeight),
      height: statusBarHeight + barHeight,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          getCustomToolBarLeadingWidget(context),
          getCustomToolBarTextWidget(),
          getCustomToolBarTrailingWidget(),
        ],
      ),
      decoration: new BoxDecoration(
        boxShadow: [
          new BoxShadow(
            spreadRadius: 5.0,
            color: Colors.grey,
            offset: new Offset(0.0, 1.0),
            blurRadius: 8.0,
          )
        ],
        gradient: new LinearGradient(
            colors: [toolbarStartColor, toolbarEndColor],
            begin: const FractionalOffset(0.0, 0.0),
            end: const FractionalOffset(0.5, 0.0),
            stops: [0.0, 1.0],
            tileMode: gradientTileMode),
      ),
    );
  }

  getTextWidget(String title) => Text(title,
      style: TextStyle(
          fontSize: fontSize,
          color: textColor,
          fontWeight: fontWeight,
          fontStyle: fontStyle));

  getBackButton(BuildContext context) => IconButton(
        icon: Icon(defaultTargetPlatform != TargetPlatform.iOS
            ? Icons.arrow_back
            : Icons.arrow_back_ios),
        color: leadingIconColor,
        onPressed: _onLeadingButtonClick,
      );

  getCustomToolBarLeadingWidget(BuildContext context) =>
      needLeadingButton ? getBackButton(context) : Container(child: Text(""));

  Widget getCustomToolBarTextWidget() {
    if (!needLeadingButton && needTrailingButton) {
      return Padding(
        padding: const EdgeInsets.only(left: 48.0),
        child: getTextWidget(title),
      );
    } else if (needLeadingButton && !needTrailingButton) {
      return Padding(
        padding: const EdgeInsets.only(right: 48.0),
        child: getTextWidget(title),
      );
    } else {
      return getTextWidget(title);
    }
  }

  getCustomToolBarTrailingWidget() => needTrailingButton
      ? IconButton(
          icon: Icon(trailingIcon),
          color: trailingIconColor,
          onPressed: _onTrailingIconClick, // null disables the button
        )
      : Container(child: Text(""));

  void getDefaultValues() {
    if (title == null) title = "Gradient Tool Bar";
    if (needLeadingButton == null) needLeadingButton = false;
    if (needTrailingButton == null) needTrailingButton = false;
    if (trailingIcon == null) trailingIcon = Icons.search;
    if (fontSize == null) fontSize = 20.0;
    if (gradientTileMode == null) gradientTileMode = TileMode.clamp;
    if (fontStyle == null) fontStyle = FontStyle.normal;
    if (fontWeight == null) fontWeight = FontWeight.w600;
    if (trailingIcon == null) trailingIcon = Icons.search;
    if (textColor == null) textColor = Colors.white;
    if (toolbarStartColor == null) toolbarStartColor = Color(0xFF414345);
    if (toolbarEndColor == null) toolbarEndColor = Color(0xFF232526);
    if (leadingIconColor == null) leadingIconColor = Colors.white;
    if (trailingIconColor == null) trailingIconColor = Colors.white;
  }
}
