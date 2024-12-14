import 'package:flutter/material.dart';
import 'package:travel/pages/loginScreen.dart';
import 'package:travel/client/penggunaServiceClient.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  bool isEmailValid = true;
  bool isPasswordValid = true;
  bool isConfirmPasswordValid = true;
  bool isUsernameValid = true;
  bool isPhoneValid = true;
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;
  bool isLoading = false;

  void _showAlertDialog(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Error'),
        content: Text(message),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _showSuccessDialog() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Success'),
        content: Text('Registration successful!'),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => LoginScreen()),
              );
            },
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _register() async {
    setState(() {
      isUsernameValid = usernameController.text.isNotEmpty;
      isPhoneValid = phoneController.text.isNotEmpty;
      isEmailValid = emailController.text.contains('@');
      isPasswordValid = passwordController.text.length >= 6;
      isConfirmPasswordValid = confirmPasswordController.text.length >= 6;
    });

    if (!isEmailValid) {
      _showAlertDialog('Please enter a valid email address.');
      return;
    }

    if (usernameController.text.isEmpty) {
      _showAlertDialog('Please enter your username.');
      return;
    }

    if (phoneController.text.isEmpty) {
      _showAlertDialog('Please enter your phone number.');
      return;
    }

    if (!isPasswordValid) {
      _showAlertDialog('Password must be at least 6 characters long.');
      return;
    }

    if (passwordController.text != confirmPasswordController.text) {
      _showAlertDialog('Password and confirm password do not match.');
      return;
    }

    setState(() {
      isLoading = true;
    });

    try {
      await PenggunaServiceClient.register(
        nama_pengguna: usernameController.text.trim(),
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        noTelp: phoneController.text.trim(),
      );

      _showSuccessDialog();
    } catch (e) {
      _showAlertDialog(e.toString());
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(
              fit: BoxFit.cover,
              height: double.infinity,
              width: double.infinity,
              image: AssetImage('assets/places/home.jpg')),
          Container(
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Colors.black,
                      Colors.black.withOpacity(0.4),
                      Colors.black.withOpacity(0.15),
                      Colors.black.withOpacity(0.5),
                    ],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter)),
          ),
          Align(
            alignment: Alignment.center,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 30,),
                  Text('Register', style: TextStyle(
                    color: Colors.greenAccent.shade400,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),),
                  SizedBox(height: 30,),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: emailController,
                      decoration: InputDecoration(
                        label: Text('Email Address'),
                        prefixIcon: Icon(Icons.email),
                        fillColor: Color(0xffD8D8DD),
                        filled: true,
                        errorText : isEmailValid ? null : 'Invalid email address',
                        errorBorder: isEmailValid ? null : OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          isEmailValid = value.contains('@');
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: usernameController,
                      decoration: InputDecoration(
                        label: Text('Username'),
                        prefixIcon: Icon(Icons.person),
                        fillColor: Color(0xffD8D8DD),
                        filled: true,
                        errorText: isUsernameValid ? null : 'Username cannot be empty',
                        errorBorder: isUsernameValid ? null : OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          isUsernameValid = value.isNotEmpty;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: phoneController,
                      decoration: InputDecoration(
                        label: Text('No Telp'),
                        prefixIcon: Icon(Icons.phone),
                        fillColor: Color(0xffD8D8DD),
                        filled: true,
                        errorText: isPhoneValid ? null : 'No Telp cannot be empty',
                        errorBorder: isPhoneValid ? null : OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          isPhoneValid = value.isNotEmpty;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: passwordController,
                      obscureText: !isPasswordVisible,
                      decoration: InputDecoration(
                        label: Text('Password'),
                        prefixIcon: Icon(Icons.lock),
                        suffixIcon: IconButton(
                          icon: Icon(isPasswordVisible ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isPasswordVisible = !isPasswordVisible;
                            });
                          },
                        ),
                        fillColor: Color(0xffD8D8DD),
                        filled: true,
                        errorText: isPasswordValid ? null : 'Password must be at least 6 characters',
                        errorBorder: isPasswordValid ? null : OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          isPasswordValid = value.length >= 6;
                        });
                      },
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(20.0),
                    child: TextField(
                      controller: confirmPasswordController,
                      obscureText: !isConfirmPasswordVisible,
                      decoration: InputDecoration(
                        label: Text('Confirm Password'),
                        prefixIcon: Icon(Icons.lock_outline),
                        suffixIcon: IconButton(
                          icon: Icon(isConfirmPasswordVisible ? Icons.visibility : Icons.visibility_off),
                          onPressed: () {
                            setState(() {
                              isConfirmPasswordVisible = !isConfirmPasswordVisible;
                            });
                          },
                        ),
                        fillColor: Color(0xffD8D8DD),
                        filled: true,
                        errorText: isConfirmPasswordValid ? null : 'Confirm Password must be at least 6 characters',
                        errorBorder: isConfirmPasswordValid ? null : OutlineInputBorder(borderSide: BorderSide(color: Colors.red)),
                      ),
                      onChanged: (value) {
                        setState(() {
                          isConfirmPasswordValid = value.length >= 6;
                        });
                      },
                    ),
                  ),
                  SizedBox(height: 20,),
                  isLoading
                    ? CircularProgressIndicator()
                    : GestureDetector(
                      onTap: _register,
                      child: Container(
                        height: 50,
                        width: 370,
                        decoration: BoxDecoration(
                          color: Colors.greenAccent.shade400,
                        ),
                        child: Center(child: Text('Register',
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                          ),),),
                      ),
                    ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, top: 30),
                    child: Row(
                      children: [
                        Text("Already have an account?", style: TextStyle(
                          color: Colors.grey,
                        ),),
                        SizedBox(width: 5,),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                          },
                          child: Text("Sign In", style: TextStyle(
                              color: Colors.greenAccent.shade400,
                              fontWeight: FontWeight.bold,
                              fontSize: 18
                          ),),
                        ),
                      ],
                    ),
                )],
              ),
            ),
          )
        ],
      ),
    );
  }
}