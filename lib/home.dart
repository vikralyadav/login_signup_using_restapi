
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loginsignup/controllers.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  LoginController controller = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          
          TextFormField(
            controller: controller.emailController.value,
            decoration: InputDecoration(
              hintText: 'Email',
            ),
          ),
           TextFormField(
            controller: controller.passwordController.value,
            decoration: InputDecoration(
              hintText: 'password',
            ),
          ),
          SizedBox(height: 50,),
         Obx(() {
          return  InkWell(
            onTap: () {
              controller.loginApi();
            },
            
            child: controller.loading.value ? CircularProgressIndicator() :Container(
              height: 45,
              decoration: BoxDecoration(
                color: Colors.grey,
              ),
              child: Center(
                child: Text("Login"),
              ),
            ),
          );
         }
         )

         
        ],
      ),
    );
  }
}