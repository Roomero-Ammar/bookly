import 'package:flutter/material.dart';

import 'Features/Splash/presentation/views/widgets/splash_view_body.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //  backgroundColor: Color(0xff100B20),
      body: SplashViewBody(),
    );
  }
}
