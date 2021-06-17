import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kopo/kopo.dart';

void main() {
  Widget createWidgetForTesting({Widget? child}) {
    return MaterialApp(
      home: child,
    );
  }

  testWidgets('Create Kopo', (WidgetTester tester) async {
    await tester
        .pumpWidget(createWidgetForTesting(child: Kopo(title: 'title')));

    final titleFinder = find.text('title');
    expect(titleFinder, findsOneWidget);
  });

//  testWidgets('Load daum post url', (WidgetTester tester) async {
//    final key = new GlobalKey<KopoState>();
//    await tester.pumpWidget(createWidgetForTesting(child: Kopo(key: key)));
//
//    WebViewController controller = await key.currentState.controller;
//
//    expect(controller, isNotNull);
//    expect(
//      await controller.currentUrl(),
//      'https://salondecode.github.io/kopo/assets/daum.html',
//    );
//  });
//
//  testWidgets('evaluate Javascript', (WidgetTester tester) async {
//    final key = new GlobalKey<KopoState>();
//    await tester.pumpWidget(createWidgetForTesting(child: Kopo(key: key)));
//
//    WebViewController controller = await key.currentState.controller;
//
//    expect(
//      await controller.evaluateJavascript("fake js string"),
//      "fake js string",
//      reason: 'should get the argument',
//    );
//    expect(
//      () => controller.evaluateJavascript(null),
//      throwsA(anything),
//    );
//  });
}
