import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:somni_ai/main.dart';

void main() {
  testWidgets('App loads and shows the main navigation', (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: SomniAIApp(),
      ),
    );
    await tester.pump(const Duration(seconds: 2));

    expect(find.text('Somni AI'), findsOneWidget);
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Log'), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
  });
}
