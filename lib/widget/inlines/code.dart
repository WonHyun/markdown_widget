import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../config/configs.dart';
import '../span_node.dart';

///Tag:  [MarkdownTag.code]
///the code textSpan
class CodeNode extends ElementNode {
  final CodeConfig codeConfig;
  final String text;

  CodeNode(this.text, this.codeConfig);

  @override
  InlineSpan build() {
    return WidgetSpan(
      alignment: PlaceholderAlignment.baseline,
      baseline: TextBaseline.alphabetic,
      child: Container(
        padding: codeConfig.padding,
        decoration: codeConfig.decoration,
        child: Text(
          text,
          style: codeConfig.style,
        ),
      ),
    );
  }

  // @override
  // TextStyle get style => codeConfig.style.merge(parentStyle);
}

///config class for code, tag: code
class CodeConfig implements InlineConfig {
  final TextStyle style;

  final BoxDecoration decoration;
  final EdgeInsets padding;

  const CodeConfig({
    this.style = const TextStyle(fontWeight: FontWeight.w500),
    this.decoration = const BoxDecoration(
      color: Color(0xCCeff1f3),
      borderRadius: BorderRadius.all(Radius.circular(3)),
    ),
    this.padding = const EdgeInsets.symmetric(horizontal: 5, vertical: 1),
  });

  static CodeConfig get darkConfig => CodeConfig(
        decoration: BoxDecoration(
          color: Color(0xCC555555),
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
      );

  @nonVirtual
  @override
  String get tag => MarkdownTag.code.name;
}
