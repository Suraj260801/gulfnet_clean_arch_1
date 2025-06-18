import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gulfnet_clean_arch_1/app.dart';

void main() {
  //Ensure Flutter widgets are initialized.
  WidgetsFlutterBinding.ensureInitialized();

  //Wrap the entire application in ProviderScope to enable River pod.
  runApp(ProviderScope(child: const MyApp()));
}
