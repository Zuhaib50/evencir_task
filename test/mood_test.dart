import 'dart:math' as math;

import 'package:flutter_test/flutter_test.dart';

import 'package:evencir_task/features/mood/model/mood.dart';

void main() {
  group('Mood.nearest', () {
    test('snaps to each anchor', () {
      expect(Mood.nearest(math.pi / 4).label, 'Calm');
      expect(Mood.nearest(3 * math.pi / 4).label, 'Content');
      expect(Mood.nearest(5 * math.pi / 4).label, 'Peaceful');
      expect(Mood.nearest(7 * math.pi / 4).label, 'Happy');
    });

    test('picks the nearer mood inside a colour area', () {
      // Just past the bottom-right anchor leans to Content.
      expect(Mood.nearest(3 * math.pi / 4 + 0.2).label, 'Content');
      // Wrapping near the top resolves to an adjacent mood, not a crash.
      expect(Mood.all, contains(Mood.nearest(0)));
    });
  });
}
