import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Providers/swagger_providers.dart';
import '../Widgets/custom_widget.dart';
import 'homepage.dart';

class Signin extends StatelessWidget {
  final obj;
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  Signin({super.key, required this.obj});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SignIn"),
        centerTitle: true,
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CustomWidget(
              text: nameController,
              labelText: "Name",
            ),
            CustomWidget(
              text: emailController,
              labelText: "Email",
            ),
            MaterialButton(
              onPressed: () async {
                bool signInSuccess = await obj.signIn(nameController.text, emailController.text);
                if (signInSuccess) {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage(),));
                } else {
                  print("failed");
                }
              },
              child: const Text("login"),
            ),
          ],
        ),
      ),
    );
  }
}
