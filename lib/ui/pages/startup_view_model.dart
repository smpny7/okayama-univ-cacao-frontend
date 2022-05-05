import 'package:cacao/get_it.dart';
import 'package:cacao/state/startup_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:permission_handler/permission_handler.dart';

class StartupViewModel extends StateNotifier<StartupState> {
  StartupViewModel() : super(const StartupState());

  final NavigationService _navigationService = locator<NavigationService>();

  Future<void> scanAuthenticationCode() async {
    if (await Permission.camera.request().isGranted)
      _navigateToAuthenticationView();
    else
      _showPermissionDialog();
  }

  void _navigateToAuthenticationView() =>
      _navigationService.pushNamed('/AuthenticationView');

  void _showPermissionDialog() => _navigationService.showPermissionDialog();
}
