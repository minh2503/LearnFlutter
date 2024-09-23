import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  int data = 0;
  bool isLoading = false;
  String email = '';
  String password = '';
  String result = '';
  String errorMail = '';
  TextEditingController emailController = TextEditingController(text: '');
  TextEditingController passwordController = TextEditingController(text: '');

  void increaseData() {
    setState(() {
      data++;
    });
    print('Giá trị: $data');
  }

  void decreaseData() {
    setState(() {
      --data;
    });
    print('Giá trị: $data');
  }

  void login() {
    setState(() {
      isLoading = true;
      email = emailController.text;
      password = passwordController.text;
    });
    //API Fetching ---- 3s
    Future.delayed(const Duration(seconds: 3)).then((value) {
      if (email.trim().isEmpty) {
        errorMail = 'Email không được để trống';
        result = 'Login không thành công';
      } else {
        errorMail = '';
        result = 'Login  thành công';
      }
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$result'),
            Text(
              'Email',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                errorText: errorMail != '' ? errorMail : null,
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 10)),
              ),
            ),
            Visibility(
                visible: errorMail.isNotEmpty,
                child: Text(errorMail, style: TextStyle(color: Colors.red))),
            // errorMail.isEmpty? SizedBox.shrink() :Text(errorMail, style: TextStyle(color: Colors.red),),
            SizedBox(
              height: 10,
            ),
            Text(
              'Password',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(width: 10)),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: OutlinedButton(
                  onPressed: () {
                    login();
                  },
                  child: isLoading
                      ? const CupertinoActivityIndicator()
                      : const Text('Login')),
            )
          ],
        ),
      ),
    );
  }
}
