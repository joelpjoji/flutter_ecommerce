import 'package:ecommerce/Screens/HomeScreen.dart';
import 'package:ecommerce/Widgets/Button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _emailController, _pwController;

  late FocusNode _emailFocus, _pwFocus;

  // Initially password is obscure
  bool _obscureText = true;

  String _password = '';

  String _email = '';

  bool isValidEmail() {
    if ((_email == null) || (_email.length == 0)) {
      return true;
    }
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(_email);
  }

  bool isValidPassword() {
    if ((_password == null) || (_password.length == 0)) {
      return true;
    }
    return (_password.length > 6);
  }

  void _toggle() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  void _validate() {
    setState(() {
      _email = _emailController.text;
      _password = _pwController.text;
    });
  }

  void performLogin() {
    //login here
  }

  @override
  void initState() {
    _emailController = TextEditingController();
    _pwController = TextEditingController();
    _emailFocus = FocusNode();
    _pwFocus = FocusNode();
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
                  focusNode: _emailFocus,
                  controller: _emailController,
                  obscureText: false,
                  keyboardType:
                      TextInputType.emailAddress, //show email keyboard
                  textInputAction: TextInputAction.next,
                  onSubmitted: (input) {
                    _emailFocus.unfocus();
                    _email = input;
                    FocusScope.of(context).requestFocus(_pwFocus);
                  },
                  onTap: _validate,
                  decoration: InputDecoration(
                    labelText: "Email",
                    hintText: 'Enter your password',
                    errorText: isValidEmail() ? null : "Invalid Email Address",
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Material(
                borderRadius: BorderRadius.circular(10.0),
                child: TextField(
                  focusNode: _pwFocus,
                  controller: _pwController,
                  obscureText: _obscureText,
                  textInputAction: TextInputAction.done,
                  onSubmitted: (input) {
                    _pwFocus.unfocus();
                    _password = input;
                    performLogin();
                  },
                  onTap: _validate,
                  decoration: InputDecoration(
                    labelText: "Password",
                    hintText: 'Enter your password',
                    errorText: isValidPassword() ? null : "Password too short.",
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
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: ((context) => HomeScreen())));
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
                              builder: ((context) => HomeScreen())));
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
