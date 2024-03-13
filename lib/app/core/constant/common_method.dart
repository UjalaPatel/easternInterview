import 'package:flutter/material.dart';

import 'size_constant.dart';

RichText buildRichText(String dynamicString) {
  List<String> parts = dynamicString.split(" ");
  List<TextSpan> spans = [];

  for (int i = 0; i < parts.length; i++) {
    if (i == 0) {
      spans.add(
        TextSpan(
          text: "${parts[i]} ",
          style: TextStyle(
            fontSize: textSize14Px,
          ),
        ),
      );
    } else {
      spans.add(
        TextSpan(
          text: "${parts[i]} ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: textSize14Px,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      );
    }
  }

  return RichText(
    text: TextSpan(
      style: const TextStyle(
        color: Colors.black,
        overflow: TextOverflow.ellipsis,
      ),
      children: spans,
    ),
  );
}
