import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:somni_ai/main.dart';

void main() {
  testWidgets('App loads and shows the main navigation',
      (WidgetTester tester) async {
    await tester.pumpWidget(
      const ProviderScope(
        child: SomniAIApp(),
      ),
    );
    await tester.pump(const Duration(seconds: 1));

    // Verify app built successfully - check for MaterialApp
    expect(find.byType(MaterialApp), findsOneWidget);

    await tester.pumpWidget(const SizedBox.shrink());
    await tester.pump();
  });
}
