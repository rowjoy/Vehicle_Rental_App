
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:vehicle_rental_app/core/router/app_router.dart';
import 'package:vehicle_rental_app/core/utils/colors.dart';
import 'package:vehicle_rental_app/core/utils/text_style.dart';
import 'package:vehicle_rental_app/widget/app_button.dart';

import '../../../services/login_services/login_provider.dart';
import '../../../widget/app_textfield.dart';

class LoginForm extends StatelessWidget {
final AuthProvider authProvider;
LoginForm({super.key, required this.authProvider});
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          CustomTextField(
            hintTextValue:  "Email Address",
            controller: authProvider.emailController,
            onSaved: (value){},
            keyboardType: TextInputType.emailAddress,
            iconsuffixIcon: const Icon(Icons.email, color: Color(0xFF868686)),
          ),
          const SizedBox(height: 16),
          // Password Field
           CustomTextField(
            hintTextValue:"Password",
            obscureText: true,
            controller: authProvider.passwordController,
            onSaved: (value){},
            keyboardType: TextInputType.visiblePassword,
            iconsuffixIcon: const Icon(Icons.lock, color: Color(0xFF868686)),
          ),
          const SizedBox(height: 16),
          // Forget Password
          GestureDetector(
            onTap: () {},
            child: Text(
              "Forget Password?",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(fontWeight: FontWeight.w500),
            ),
          ),
          const SizedBox(height: 16),

          AppButton(
            // buttonLevel: "Sign in",
            btnwidget: authProvider.isLoading ? CircularProgressIndicator(
              color: Colors.white,
            ) : Text("Sign in",
                style: AppTextStyle.appButtonTextStyle(),
            ),
            color: AppColor.themeColor,
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                _formKey.currentState!.save();
                authProvider.login(
                  authProvider.emailController.text,
                  authProvider.passwordController.text,
                ).then((user) {
                  // Handle successful login
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Welcome ${user.name}')),
                  );
                  context.pushReplacement(RoutePath.vehiclesListView);

                });
                // Handle sign in logic here
              }
            },
          ),
        ],
      ),
    );
  }
}







