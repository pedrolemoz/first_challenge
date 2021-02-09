import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final Function onPressed;
  final String label;

  const CustomButton({Key key, this.onPressed, this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: Colors.white,
      splashColor: Theme.of(context).accentColor.withOpacity(0.2),
      highlightColor: Colors.grey[100],
      child: Text(
        label.toUpperCase(),
        style: Theme.of(context)
            .textTheme
            .button
            .copyWith(color: Theme.of(context).accentColor),
      ),
    );
  }
}
