import 'package:flutter_riverpod/legacy.dart' show StateProvider;
import 'package:flutter_riverpod/legacy.dart';

final nombreProvider = StateProvider<String>((ref) => 'Mateo');
final countProvider = StateProvider<int>((ref) => 0);
final changeProvider = StateProvider<bool>((ref) => false);
