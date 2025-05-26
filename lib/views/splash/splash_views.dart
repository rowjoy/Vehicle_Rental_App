// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:vehicle_rental_app/core/router/app_router.dart';
import 'package:vehicle_rental_app/core/svg_string/splash_images.dart' show splashViewsImages;
import 'package:vehicle_rental_app/core/utils/colors.dart';
import 'package:vehicle_rental_app/views/splash/component/splash_info.dart';


class SplashViews extends StatefulWidget {
  const SplashViews({super.key});

  @override
  State<SplashViews> createState() => _SplashViewsState();
}
class _SplashViewsState extends State<SplashViews> {
  @override
  void initState() {
    Future.delayed(Duration(seconds: 1),()=> context.pushReplacement(RoutePath.login));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              const Spacer(flex: 2),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.8,
                child: AspectRatio(
                  aspectRatio: 1,
                  child: SvgPicture.string(
                    splashViewsImages,
                    fit: BoxFit.scaleDown,
                  ),
                ),
              ),
              const Spacer(flex: 2),
              SplashInfo(
                title: "Welcome to RideNow!",
                description:
                    "Find and book your perfect ride anytime, anywhere. Whether it's a city cruise or a weekend getaway, we've got the vehicle for you.",
                button: Transform.scale(
                  scale: 1.2,
                  child: const CircularProgressIndicator.adaptive(
                    backgroundColor: AppColor.themeColor,
                    valueColor: AlwaysStoppedAnimation<Color>(AppColor.themeWhiteColor),
                  ),
                ),
                press: () {
                  // ignore: avoid_print
                  print("Retry button pressed");
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}