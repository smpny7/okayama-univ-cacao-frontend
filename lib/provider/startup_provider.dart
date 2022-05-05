import 'package:cacao/state/startup_state.dart';
import 'package:cacao/ui/pages/startup_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final startupProvider = StateNotifierProvider<StartupViewModel, StartupState>(
    (ref) => StartupViewModel());
