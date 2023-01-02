import 'package:ecommerce/Screens/HomeScreen.dart';
import 'package:ecommerce/Screens/Login/SignUpScreen.dart';
import 'package:ecommerce/Widgets/Button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
    static String id = 'login';

  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController, _pwController;

  // Initially password is obscure
  bool _obscureText = true;

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _pwController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            const SizedBox(height: 80.0),
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                'Login',
                style: TextStyle(fontSize: 32.0, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 80.0),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                child: TextField(
                  controller: _emailController,
                  obscureText: false,
                  keyboardType:
                      TextInputType.emailAddress, //show email keyboard
                  textInputAction: TextInputAction.next,

                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: 'Enter your email',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                child: TextField(
                  controller: _pwController,
                  obscureText: _obscureText,
                  textInputAction: TextInputAction.done,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: 'Enter your password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility : Icons.visibility_off,
                        color: Theme.of(context).primaryColorDark,
                      ),
                      onPressed: _toggle,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 30.0, right: 30),
              child: RoundedButtonWidget(
                  onpressed: () {
                    FirebaseAuth.instance
                        .signInWithEmailAndPassword(
                            email: _emailController.text,
                            password: _pwController.text)
                        .then((value) => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) => HomeScreen()))));
                  },
                  width: 400,
                  buttonText: 'Log in'),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Don\'t have an account ?'),
                TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: ((context) => SignUpScreen())));
                    },
                    child: Text('Sign Up'))
              ],
            ),
            const SizedBox(height: 40.0),
          ],
        ),
      ),
    );
  }
}
