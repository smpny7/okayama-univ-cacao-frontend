import 'package:cacao/state/temperature_state.dart';
import 'package:cacao/ui/pages/temperature_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final temperatureProvider =
    StateNotifierProvider<TemperatureViewModel, TemperatureState>(
        (ref) => TemperatureViewModel());
