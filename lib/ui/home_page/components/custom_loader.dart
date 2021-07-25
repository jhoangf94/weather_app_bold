import 'package:flutter/material.dart';

class CustomLoader extends StatelessWidget {
  const CustomLoader({
    Key? key,
    this.title = '',
    this.color = Colors.white,
    this.textColor = Colors.white,
  }) : super(key: key);

  final String title;
  final Color color;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          CircularProgressIndicator(color: color),
          SizedBox(height: 10),
          if (title.isNotEmpty)
            Text(
              '$title',
              style: Theme.of(context)
                  .textTheme
                  .overline
                  ?.copyWith(color: textColor),
            )
        ],
      ),
    );
  }
}
