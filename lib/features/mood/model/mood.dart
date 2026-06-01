import 'dart:math' as math;

enum MoodFace { calm, content, peaceful, happy }

class Mood {
  const Mood({
    required this.label,
    required this.anchorAngle,
    required this.face,
  });

  final String label;

  final double anchorAngle;
  final MoodFace face;

  String get asset => 'assets/moods/${face.name}.png';

  static const List<Mood> all = [
    Mood(label: 'Calm', anchorAngle: math.pi / 4, face: MoodFace.calm),
    Mood(label: 'Content', anchorAngle: 3 * math.pi / 4, face: MoodFace.content),
    Mood(label: 'Peaceful', anchorAngle: 5 * math.pi / 4, face: MoodFace.peaceful),
    Mood(label: 'Happy', anchorAngle: 7 * math.pi / 4, face: MoodFace.happy),
  ];

  static Mood nearest(double angle) {
    final twoPi = 2 * math.pi;
    double distance(double a, double b) {
      final d = (a - b).abs() % twoPi;
      return math.min(d, twoPi - d);
    }

    return all.reduce(
      (a, b) => distance(angle, a.anchorAngle) <= distance(angle, b.anchorAngle)
          ? a
          : b,
    );
  }
}
