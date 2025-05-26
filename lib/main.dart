import 'package:flutter/material.dart';
import 'package:vehicle_rental_app/core/router/app_router.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_rental_app/services/app_providers.dart';




void main() {
  WidgetsFlutterBinding.ensureInitialized();
    runApp(
      MultiProvider(
        providers: appproviders,
        child: const MyApp(),
      ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: AppRouter().appRouter(),
      title: 'Vehicle Rental App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
