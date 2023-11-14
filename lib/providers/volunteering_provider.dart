import 'package:equipo_estrella/controllers/volunteering_controller.dart';
import 'package:equipo_estrella/models/volunteering_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final volunteeringProvider = Provider<VolunteeringController>((ref) {
  return VolunteeringController();
});

final volunteeringListProvider = FutureProvider<List<VolunteeringModel>>(
  (ref) => ref.read(volunteeringProvider).getVolunteeringList(),
);
