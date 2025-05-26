import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:vehicle_rental_app/views/auth/component/login_form.dart' show LoginForm, SignInForm;
import 'package:vehicle_rental_app/views/auth/component/welcome_text.dart' show WelcomeText;

import '../../core/svg_string/socal_button_icon.dart';
import '../../services/login_services/login_provider.dart';
import '../../widget/socal_button.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
     final authProvider = Provider.of<AuthProvider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const WelcomeText(
                title: "Welcome to",
                text:"Find and book your perfect ride anytime, anywhere. Whether it's a city cruise or a weekend getaway, we've got the vehicle for you.",
              ),
              LoginForm(authProvider: authProvider),
              if (authProvider.error != null)...[
                const SizedBox(height: 10),
                Text(authProvider.error!, style: TextStyle(color: Colors.red)),
              ],
              const SizedBox(height: 16),
              Center(child: Text("Or",style: TextStyle(color: Color(0xFF010F07).withOpacity(0.7)))),
              const SizedBox(height: 16 * 1.5),
              Center(
                child: Text.rich(
                  TextSpan(
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall!
                        .copyWith(fontWeight: FontWeight.w600),
                    text: "Don’t have account? ",
                    children: <TextSpan>[
                      TextSpan(
                        text: "Create new account.",
                        style: const TextStyle(color: Color(0xFF22A45D)),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            // Navigate to Sign Up Screen
                          },
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 16),
                
              // Facebook
              SocalButton(
                press: () {},
                text: "Connect with Facebook",
                color: const Color(0xFF395998),
                icon: SvgPicture.string(
                  facebookIcon,
                  colorFilter: const ColorFilter.mode(
                    Color(0xFF395998),
                    BlendMode.srcIn,
                  ),
                ),
              ),
              const SizedBox(height: 16),
                
              // Google
              SocalButton(
                press: () {},
                text: "Connect with Google",
                color: const Color(0xFF4285F4),
                icon: SvgPicture.string(
                  googleIcon,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}


