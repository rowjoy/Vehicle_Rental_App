import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart' show SingleChildWidget;
import 'package:vehicle_rental_app/services/login_services/login_provider.dart' show AuthProvider;

List<SingleChildWidget> appproviders =  [
  ChangeNotifierProvider(create: (_) => AuthProvider()),
];