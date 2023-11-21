import 'package:flutter_riverpod/flutter_riverpod.dart';

final selectedIndexProvider = StateProvider<int>((ref){
  return -1;
});

final completedProvider = StateProvider<bool?>((ref) {
  return false;
});