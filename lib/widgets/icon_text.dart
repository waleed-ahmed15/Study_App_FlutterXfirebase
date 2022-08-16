import 'package:flutter/cupertino.dart';

import '../configs/themes/custom_text_styles.dart';

class IconText extends StatelessWidget {
  final Icon icon;
  final String text;
  const IconText({Key? key, required this.icon, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        icon,
        SizedBox(
          width: 5,
        ),
        Text(
          text,
          style: detailsTextStyle(),
        ),
      ],
    );
  }
}
