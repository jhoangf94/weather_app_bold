import 'package:flutter/material.dart';

class ItemDescription extends StatelessWidget {
  const ItemDescription({
    Key? key,
    required this.title,
    required this.desc,
    required this.icon,
  }) : super(key: key);

  final String title;
  final String desc;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$title'.toUpperCase(),
            style: TextStyle(color: Color(0xff708feb)),
          ),
          Row(
            children: [
              Icon(icon),
              SizedBox(width: 10),
              Text('$desc'),
            ],
          ),
        ],
      ),
    );
  }
}
