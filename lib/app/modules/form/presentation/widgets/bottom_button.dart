import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final String label;
  final Function onTap;

  const BottomButton({Key key, this.label, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Material(
        elevation: 2.0,
        child: Ink(
          height: 70.0,
          color:
              onTap != null ? Theme.of(context).accentColor : Colors.grey[400],
          child: InkWell(
            onTap: onTap,
            splashColor: Theme.of(context).accentColor.withOpacity(0.2),
            highlightColor: Theme.of(context).primaryColorDark,
            child: Center(
              child: Text(
                label,
                style: Theme.of(context)
                    .textTheme
                    .headline6
                    .copyWith(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
