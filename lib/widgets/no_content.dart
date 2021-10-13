import 'package:flutter/material.dart';

class NoContent extends StatelessWidget {
  final String? title;
  final String? desc;
  final String? imgUrl;
  final Widget? btn;
  final EdgeInsetsGeometry? innerPadding;
  const NoContent(
      {Key? key,
      this.title,
      this.desc,
      this.imgUrl,
      this.btn,
      this.innerPadding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: innerPadding == null
          ? const EdgeInsets.only(
              right: 16,
              top: 80,
            )
          : innerPadding,
      child: Center(
        child: Column(
          children: [
            Text(
              title ?? "Nothing to see here yet",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14),
            ),
            SizedBox(height: 10),
            Text(
              desc ?? "Something seems wrong",
              textAlign: TextAlign.center,
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12),
            ),
            btn != null ? btn! : SizedBox(),
          ],
        ),
      ),
    );
  }
}
