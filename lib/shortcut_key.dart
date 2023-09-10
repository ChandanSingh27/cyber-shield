import 'package:cyber_shield/pages_provider/app_drawer_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

class ToggleDrawer extends Intent {
  const ToggleDrawer();
}

class SystemPage extends Intent {
  const SystemPage();
}
class ScanningPage extends Intent {
  const ScanningPage();
}
class LogFilesPage extends Intent {
  const LogFilesPage();
}
class PortsPage extends Intent {
  const PortsPage();
}
class AddedRulePage extends Intent {
  const AddedRulePage();
}
class AlertPage extends Intent {
  const AlertPage();
}
class HelpPage extends Intent {
  const HelpPage();
}

Map<ShortcutActivator, Intent> shortcutsKey  = <ShortcutActivator, Intent>{
  const SingleActivator(LogicalKeyboardKey.space): const ToggleDrawer(),
  LogicalKeySet(LogicalKeyboardKey.control,LogicalKeyboardKey.keyQ): const SystemPage(),
  LogicalKeySet(LogicalKeyboardKey.control,LogicalKeyboardKey.keyW): const ScanningPage(),
  LogicalKeySet(LogicalKeyboardKey.control,LogicalKeyboardKey.keyE): const PortsPage(),
  LogicalKeySet(LogicalKeyboardKey.control,LogicalKeyboardKey.keyR): const LogFilesPage(),
  LogicalKeySet(LogicalKeyboardKey.control,LogicalKeyboardKey.keyT): const AddedRulePage(),
  LogicalKeySet(LogicalKeyboardKey.control,LogicalKeyboardKey.keyY): const AlertPage(),
  LogicalKeySet(LogicalKeyboardKey.control,LogicalKeyboardKey.keyU): const HelpPage(),
};

Map<Type, Action<Intent>> shortKeyActions (BuildContext context) {
  return {
    ToggleDrawer: CallbackAction<ToggleDrawer>(
      onInvoke: (intent) =>
          Provider.of<AppDrawerProvider>(context, listen: false)
              .openCloseDrawer(),
    ),
    SystemPage: CallbackAction<SystemPage>(
      onInvoke: (intent) =>
          Provider.of<AppDrawerProvider>(context, listen: false)
              .changeSelectedNavItem(0),
    ),
    ScanningPage: CallbackAction<ScanningPage>(
      onInvoke: (intent) =>
          Provider.of<AppDrawerProvider>(context, listen: false)
              .changeSelectedNavItem(1),
    ),
    PortsPage: CallbackAction<PortsPage>(
      onInvoke: (intent) =>
          Provider.of<AppDrawerProvider>(context, listen: false)
              .changeSelectedNavItem(2),
    ),
    LogFilesPage: CallbackAction<LogFilesPage>(
      onInvoke: (intent) =>
          Provider.of<AppDrawerProvider>(context, listen: false)
              .changeSelectedNavItem(3),
    ),
    AddedRulePage: CallbackAction<AddedRulePage>(
      onInvoke: (intent) =>
          Provider.of<AppDrawerProvider>(context, listen: false)
              .changeSelectedNavItem(4),
    ),
    AlertPage: CallbackAction<AlertPage>(
      onInvoke: (intent) =>
          Provider.of<AppDrawerProvider>(context, listen: false)
              .changeSelectedNavItem(5),
    ),
    HelpPage: CallbackAction<HelpPage>(
      onInvoke: (intent) =>
          Provider.of<AppDrawerProvider>(context, listen: false)
              .changeSelectedNavItem(6),
    ),
  };
}
