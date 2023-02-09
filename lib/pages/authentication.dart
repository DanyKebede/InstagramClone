import 'package:flutter/material.dart';
import 'package:insta_clone/services/firebase_auth.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  var _isLogin = false;
  var _obscurePassword = true;
  var _isLoading = false;

  void signUpUser() async {
    setState(() => _isLoading = true);
    await FirebaseAuthMethods().signUpWithEmail(
      userName: _nameController.text.trim(),
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      context: context,
    );
    setState(() => _isLoading = false);
  }

  void loginUser() async {
    setState(() => _isLoading = true);
    await FirebaseAuthMethods().loginWithEmail(
      email: _emailController.text.trim(),
      password: _passwordController.text.trim(),
      context: context,
    );
    setState(() => _isLoading = false);
  }

  // void submitForm() {
  //   var isValid = _formKey.currentState!.validate();
  //   if (!isValid) return;
  //   _formKey.currentState!.save();
  //    setState(() => _isLoading = true);
  //   if (_isLogin) {
  //     loginUser();
  //   } else {
  //     signUpUser();
  //   }
  // setState(() => _isLoading = false);
  // }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        margin: const EdgeInsets.only(top: 100),
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              _renderLogo(),
              const SizedBox(height: 20),
              if (!_isLogin) _buildNameField(),
              const SizedBox(height: 10),
              _buildEmailField(),
              const SizedBox(height: 10),
              _buildPasswordField(),
              const SizedBox(height: 20),
              _buildSubmitButton(),
              const SizedBox(height: 10),
              _buildTextButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _renderLogo() => Container(
        child: Column(
          children: [
            Container(
              height: 80,
              child: Image.asset('assets/images/Instagram_icon.png'),
            ),
            const SizedBox(height: 10),
            Container(
              alignment: Alignment.center,
              child: Image.asset('assets/images/InstagramLogo.png'),
            ),
          ],
        ),
      );

  Widget _buildNameField() => TextFormField(
        validator: (value) {
          if (value != null) {
            return 'please provide user name';
          }
          return null;
        },
        controller: _nameController,
        decoration: customInputDecoration(hintText: 'User name'),
      );
  Widget _buildEmailField() => TextFormField(
        validator: (value) {
          if (value != null) {
            return 'please provide email name';
          }
          if (!value!.contains('@')) {
            return 'please provide valid email';
          }
          return null;
        },
        controller: _emailController,
        decoration: customInputDecoration(
          hintText: 'Email',
        ),
      );

  Widget _buildPasswordField() => TextFormField(
        validator: (value) {
          if (value != null) {
            return 'please provide password';
          }
          if (value!.length < 6) {
            return 'password should have more than 6 characters';
          }
          return null;
        },
        obscureText: _obscurePassword,
        controller: _passwordController,
        decoration: customInputDecoration(hintText: 'Password', ispass: true),
      );

  Widget _buildSubmitButton() => ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.lightBlue,
        ),
        onPressed: _isLogin ? loginUser : signUpUser,
        // onPressed: submitForm,
        child: _isLoading
            ? const FittedBox(
                child: Center(
                    child: CircularProgressIndicator(color: Colors.white)),
              )
            : Container(
                padding: const EdgeInsets.symmetric(vertical: 13),
                alignment: Alignment.center,
                width: double.infinity,
                child: Text(
                  _isLogin ? 'Log In' : 'Sign Up',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontFamily: 'SourceSansPro',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
      );

  Widget _buildTextButton() => TextButton(
        onPressed: () => setState(() => _isLogin = !_isLogin),
        child: Text(
          _isLogin ? 'Sign up' : 'Already have an account',
          style: const TextStyle(
            color: Colors.lightBlue,
            fontSize: 14,
            fontFamily: 'SourceSansPro',
            fontWeight: FontWeight.w600,
          ),
        ),
      );

  InputDecoration customInputDecoration({
    required hintText,
    ispass = false,
  }) {
    return InputDecoration(
      suffixIcon: ispass
          ? IconButton(
              onPressed: () {
                setState(() {
                  _obscurePassword = !_obscurePassword;
                });
              },
              icon: _obscurePassword
                  ? const Icon(Icons.visibility)
                  : const Icon(Icons.visibility_off))
          : null,
      hintText: hintText,
      hintStyle: const TextStyle(
        fontSize: 13,
        color: Colors.black,
        fontFamily: 'SourceSansPro-Regular',
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
        borderSide: const BorderSide(
          color: Colors.black,
        ),
      ),
      focusColor: Colors.black,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(5),
      ),
      contentPadding: const EdgeInsets.symmetric(
        vertical: 0,
        horizontal: 14,
      ),
    );
  }
}
