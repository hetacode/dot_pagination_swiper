import 'package:flutter/material.dart';

import 'color_dot.dart';

@immutable
class DotPagination extends StatelessWidget {
  final Color inactiveDotColor;
  final Color activeDotColor;

  const DotPagination(
      {Key key, @required this.itemCount, @required this.activeIndex, this.activeDotColor, this.inactiveDotColor})
      : assert(itemCount != null),
        assert(activeIndex != null),
        assert(activeIndex >= 0),
        assert(activeIndex < itemCount),
        super(key: key);

  final int itemCount;
  final int activeIndex;

  @override
  Widget build(BuildContext context) {
    final inactiveDot = ColorDot(color: inactiveDotColor,);
    final activeDot = ColorDot(
      color: activeDotColor ?? Theme.of(context).primaryColor,
    );

    final list = List<ColorDot>.generate(
      itemCount,
      (index) => (index == activeIndex) ? activeDot : inactiveDot,
    );

    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: list,
      ),
    );
  }
}
