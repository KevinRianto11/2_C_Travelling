import 'package:flutter/material.dart';
import 'package:travel/pages/home_page.dart';
import 'package:travel/pages/registerScreen.dart';
import 'package:travel/client/penggunaServiceClient.dart'; 
import 'package:travel/client/shared_preference.dart'; // Import the shared preference file

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override 
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController(); 
  final TextEditingController passwordController = TextEditingController();
  bool emailValid = true; 
  bool isPasswordValid = true;
  bool isLoading = false; 
  bool isPasswordVisible = false;
  bool isConfirmPasswordVisible = false;

  void showCustomDialog({
    required String title,
    required String message,
    required IconData icon,
    required Color iconColor,
    bool isSuccess = false,
  }) {
    showDialog(
      context: context,
      barrierDismissible: false, 
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(20),
              boxShadow: const [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: iconColor.withOpacity(0.1),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    icon,
                    size: 36,
                    color: iconColor,
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  message,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 14,
                    color: Colors.grey[700],
                  ),
                ),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      if (isSuccess) {
                        Navigator.of(context).pop();
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFF9900),
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: const Text(
                      "Ok",
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  void _handleLogin() async { 
    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true; 
      });

      try {
        final response = await PenggunaServiceClient.login(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
        );

        await SharedPreference().saveToken(response['token']);
        await SharedPreference().saveUserId(response['detail']['id']);
      
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const HomePage()),
        );

        
      } catch (e) {
        showCustomDialog(
            title: "Error",
            message: "Gagal Login $e",
            icon: Icons.error,
            iconColor: Colors.red,
          );
      } finally {
        setState(() {
          isLoading = false; 
        });
      }
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
            image: AssetImage('assets/places/home.jpg'),
          ),
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
                end: Alignment.topCenter,
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Login',
                  style: TextStyle(
                    color: Colors.greenAccent.shade400,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 30),
                Padding(
                  padding: EdgeInsets.all(20.0),
                  child: Form(
                    key: _formKey, 
                    child: Column(
                      children: [
                        Container(
                          width: double.infinity,
                          child: TextFormField(
                            controller: emailController,
                            decoration: const InputDecoration(
                              label: Text('Email Address'),
                              prefixIcon: Icon(Icons.email),
                              fillColor: Color(0xffD8D8DD),
                              filled: true,
                            ),
                            validator: (value) { 
                              if (value == null || value.isEmpty) {
                                setState(() { emailValid = false; }); 
                                return 'Please enter your email address'; 
                              } 
                              if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) { 
                                setState(() { emailValid = false; });
                                return 'Please enter a valid email address'; 
                              }
                              setState(() { emailValid = true; }); 
                              return null; 
                            },
                          ),
                        ),
                        SizedBox(height: 30),
                         Container(
                          width: double.infinity,
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
                        SizedBox(height: 30),
                        isLoading ? CircularProgressIndicator()
                          : GestureDetector(
                              onTap: _handleLogin,
                              child: Container(
                                height: 50,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Colors.greenAccent.shade400,
                                ),
                                child: Center(
                                  child: Text(
                                    'Login',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                        SizedBox(height: 15),
                        Padding(
                          padding: const EdgeInsets.only(left: 100.0, top: 20),
                          child: Row(
                            children: [
                              Text(
                                "Don't have an account?",
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(width: 5),
                              GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => RegisterScreen()),
                                  );
                                },
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                    color: Colors.greenAccent.shade400,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}