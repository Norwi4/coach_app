import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_auth/controllers/auth_service.dart';
import 'package:flutter_auth/features/auth/login_screen.dart';

@RoutePage()
class User extends StatelessWidget {
  const User({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Homepage"),
        automaticallyImplyLeading: false,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Great you are now logged in."),
              SizedBox(
                height: 20,
              ),
              OutlinedButton(
                  onPressed: () {
                    AuthService.logout();
                    Future.delayed(const Duration(milliseconds: 500), () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => LoginPage()));
                    });
                  },
                  child: Text("Logout"))
            ],
          )),
    );
  }
}