import 'package:afyacare/presentation/routes/router.dart' as AfyaRouter;
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return AfyaRouter.Router();
  }
}
