import 'package:flutter/material.dart';

class ListItemWidgetOfFloatingActionButton extends StatelessWidget {
  final String title;
  final String subTitle;
  final IconData icon;
  final Color iconColor;

  const ListItemWidgetOfFloatingActionButton({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.icon,
    required this.iconColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      fontSize: 20, color: Colors.black,),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  width: 5,
                ),
                Icon(
                  icon,
                  color: iconColor,
                ),
              ],
            ),
            Text(
              subTitle,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
