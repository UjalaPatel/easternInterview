import 'package:flutter/material.dart';
import '../core/them/const_color.dart';

class CommonAppBar extends StatefulWidget implements PreferredSizeWidget {
  final Widget title;
  final Widget? leading;
  final bool? isCenter;
  final List<Widget>? action;

  const CommonAppBar({
    super.key,
    required this.title,
    this.action,
    this.leading,
    this.isCenter,
  });

  @override
  State<CommonAppBar> createState() => _CommonAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(56.0);
}

class _CommonAppBarState extends State<CommonAppBar> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AppBar(
          backgroundColor: ConstColor.whiteColor,
          foregroundColor: ConstColor.whiteColor,
          title: widget.title,
          centerTitle: widget.isCenter ?? true,
          elevation: 0,
          actions: widget.action,
          leading: widget.leading,
        ),
      ],
    );
  }
}
