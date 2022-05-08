import 'package:cacao/state/authentication_state.dart';
import 'package:cacao/ui/pages/authentication_view_model.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final authenticationProvider =
    StateNotifierProvider<AuthenticationViewModel, AuthenticationState>(
        (ref) => AuthenticationViewModel());
