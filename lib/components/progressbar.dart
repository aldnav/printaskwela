import 'package:flutter/material.dart';

class ProgressBar extends StatelessWidget {
  final double height;
  final double width;
  final Color backgroundColor;
  final Color foregroundColor;
  final Color progressTextColor;
  final double progress;

  ProgressBar({
    @required this.progress,
    this.width = double.infinity,
    this.height = 8.0,
    this.backgroundColor = Colors.black12,
    this.foregroundColor = Colors.lightBlueAccent,
    this.progressTextColor,
  });

  @override
  Widget build(BuildContext context) {
    var _progressTextColor = progressTextColor != null ? progressTextColor : foregroundColor;

    return LayoutBuilder(
      builder: (context, constraints) {
        return Row(
          children: [
            Text(
              '${progress * 100}%',
              style: TextStyle(color: _progressTextColor),
            ),
            SizedBox(
              width: 4.0,
            ),
            Expanded(
              child: Stack(
                children: [
                  Container(
                    width: double.infinity,
                    height: height,
                    margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    decoration: BoxDecoration(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(height / 2),
                    ),
                  ),
                  Container(
                    width: constraints.maxWidth * progress,
                    height: height,
                    margin: EdgeInsets.only(top: 8.0, bottom: 8.0),
                    decoration: BoxDecoration(
                      color: foregroundColor,
                      borderRadius: BorderRadius.circular(height / 2),
                    ),
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
