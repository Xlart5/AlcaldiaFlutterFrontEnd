import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Este provider manejará el estado del tipo de transporte seleccionado
final transportTypeProvider = StateProvider<String?>((ref) => null);

final mapcontroller = StateProvider((ref) => MapController(),);