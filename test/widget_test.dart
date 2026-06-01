import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:evencir_task/features/home/view/widgets/home_app_bar.dart';
import 'package:evencir_task/main.dart';

void main() {
  Future<void> pumpApp(WidgetTester tester) async {
    tester.view.physicalSize = const Size(375, 812);
    tester.view.devicePixelRatio = 1.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    await tester.pumpWidget(const EvencirApp());
    await tester.pumpAndSettle();
  }

  testWidgets('Home tab and bottom navigation render', (tester) async {
    await pumpApp(tester);

    expect(find.text('Workouts'), findsOneWidget);
    expect(find.text('Upper Body'), findsOneWidget);
    expect(find.text('My Insights'), findsOneWidget);

    expect(find.text('Nutrition'), findsOneWidget);
    expect(find.text('Plan'), findsOneWidget);
    expect(find.text('Mood'), findsOneWidget);
    expect(find.text('Profile'), findsOneWidget);
  });

  testWidgets('Tapping Plan tab shows the training calendar', (tester) async {
    await pumpApp(tester);

    // Plan content is offstage in the IndexedStack until selected.
    expect(find.text('Training Calendar'), findsNothing);

    await tester.tap(find.text('Plan'));
    await tester.pumpAndSettle();

    expect(find.text('Training Calendar'), findsOneWidget);
    expect(find.text('Arm Blaster'), findsOneWidget);
    expect(find.text('Leg Day Blitz'), findsOneWidget);
    expect(find.text('Week 2/8'), findsOneWidget);
  });

  testWidgets('Tapping Mood tab shows the mood wheel', (tester) async {
    await pumpApp(tester);

    expect(find.text('Calm'), findsNothing);

    await tester.tap(find.text('Mood'));
    await tester.pumpAndSettle();

    expect(find.text('How are you feeling at the Moment?'), findsOneWidget);
    expect(find.text('Calm'), findsOneWidget);
    expect(find.text('Continue'), findsOneWidget);
  });

  testWidgets('Tapping the week label opens the calendar sheet',
      (tester) async {
    await pumpApp(tester);

    await tester.tap(
      find.descendant(
        of: find.byType(HomeAppBar),
        matching: find.byType(GestureDetector),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byIcon(Icons.chevron_left), findsOneWidget);
    expect(find.byIcon(Icons.chevron_right), findsOneWidget);
  });
}
