import 'package:flutter/material.dart';
import 'package:login_signup/Providers/swagger_providers.dart';
import 'package:provider/provider.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
        centerTitle: true,
      ),
      body: Consumer<SwaggerProviders>(builder: (context, value, child) {
        if (value.model == null) {
          value.fetchApi();
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: value.model?.model.length,
          itemBuilder: (context, index) {
          return Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20)
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(value.model?.model[index]["name"]),
                Text(value.model?.model[index]["email"])
              ],
            ),
          );
        },);
      },),
    );
  }
}
