import 'package:flutter/material.dart';
import 'package:login_signup/Providers/swagger_providers.dart';
import 'package:login_signup/Screens/signin.dart';
import 'package:login_signup/Widgets/custom_widget.dart';
import 'package:provider/provider.dart';

class Signup extends StatelessWidget {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  Signup({super.key});

  @override
  Widget build(BuildContext context) {
    var obj = Provider.of<SwaggerProviders>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomWidget(
                text: nameController,
                labelText: "Name",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "please full data";
                  }
                  return null;
                },
            ),
            CustomWidget(
                text: emailController,
                labelText: "Email",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                   return "please full data";
                 }
                 return null;
                },
            ),
            MaterialButton(
              onPressed: () {
                if (formKey.currentState!.validate()) {
                    obj.signUp(nameController.text, emailController.text);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Signin(obj: obj),
                      ),
                    );
                }
              },
              child: const Text("Sign Up"),
            )
          ],
        ),
      ),
    );
  }
}
