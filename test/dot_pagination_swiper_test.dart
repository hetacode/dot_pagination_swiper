import 'package:dot_pagination_swiper/dot_pagination_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

const List<String> kStates = <String>[
  'Alabama',
  'Alaska',
  'Arizona',
  'Arkansas',
  'California',
  'Colorado',
  'Connecticut',
];

void main() {

  testWidgets("One child element of DotPaginationSwiper should have one dot - active - with proper setup color", (tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: DotPaginationSwiper(
          activeDotColor: Colors.green,
          inactiveDotColor: Colors.red,
          children: <Widget>[
            Container(),
          ],
        ),
      ),
    );

    var pagination = find.byType(DotPagination);
    var foundDots = find.descendant(of: pagination, matching: find.byType(ColorDot));
    var dots = (foundDots.evaluate().map((m) => m.widget as ColorDot).toList());
    expect(dots.length, equals(1));
    expect(dots[0].color, isSameColorAs(Colors.green));
  });
  testWidgets("Two children elements of DotPaginationSwiper should have two dots - active and inactive - with proper setup colors", (tester) async {
    await tester.pumpWidget(
      Directionality(
        textDirection: TextDirection.ltr,
        child: DotPaginationSwiper(
          activeDotColor: Colors.green,
          inactiveDotColor: Colors.red,
          children: <Widget>[
            Container(),
            Container(),
          ],
        ),
      ),
    );

    var pagination = find.byType(DotPagination);
    var foundDots = find.descendant(of: pagination, matching: find.byType(ColorDot));
    var dots = (foundDots.evaluate().map((m) => m.widget as ColorDot).toList());
    expect(dots.length, equals(2));
    expect(dots[0].color, isSameColorAs(Colors.green));
    expect(dots[1].color, isSameColorAs(Colors.red));
  });

  testWidgets('MyWidget has a title and message', (WidgetTester tester) async {
    final List<String> log = <String>[];

    await tester.pumpWidget(Directionality(
      textDirection: TextDirection.ltr,
      child: DotPaginationSwiper(
        children: kStates.map<Widget>((String state) {
          return GestureDetector(
            onTap: () {
              log.add(state);
            },
            child: Container(
              height: 200.0,
              color: const Color(0xFF0000FF),
              child: Text(state),
            ),
          );
        }).toList(),
      ),
    ));
    await tester.tap(find.text('Alabama'));
    expect(log, equals(<String>['Alabama']));
    log.clear();

    expect(find.text('Alaska'), findsNothing);
  });
}
