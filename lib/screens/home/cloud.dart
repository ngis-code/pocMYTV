import 'package:vector_math/vector_math_64.dart' as v;

class Cloud {
  final String imageUrl;
  final v.Vector2 position;
  final v.Vector2 velocity;

  Cloud({
    required this.imageUrl,
    required this.position,
    required this.velocity,
  });
}
