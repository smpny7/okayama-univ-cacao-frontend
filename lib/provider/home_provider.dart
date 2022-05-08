import 'package:cacao/state/home_state.dart';
import 'package:cacao/ui/pages/home_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final homeProvider =
    StateNotifierProvider<HomeViewModel, HomeState>((ref) => HomeViewModel());
