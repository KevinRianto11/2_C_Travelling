import 'package:flutter/material.dart';
import 'package:register/view/login.dart';
import 'package:register/component/component.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  
  final _formKey = GlobalKey<FormState>();
  TextEditingController usernameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController notelController = TextEditingController();
  TextEditingController idController = TextEditingController();
  String _gender = 'Male';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputForm(
                (p0){
                  if(p0==null || p0.isEmpty){
                    return 'Username Tidak Boleh Kosong !';
                  }
                  if(p0.toLowerCase() == 'anjing'){
                    return 'Tidak boleh Menggunakan kata kasar';
                  }
                  if (p0.contains(' ')) {
                    return 'Username tidak boleh mengandung spasi';
                  }
                  if (!RegExp(r'\d').hasMatch(p0)) {
                    return 'Username harus mengandung setidaknya satu angka';
                  }
                  return null;
                },
                  controller: usernameController,
                  hintTxt: "Username",
                  helperTxt: "Kevin",
                  iconData: Icons.person),
              inputForm(
                ((p0){
                  if(p0 == null || p0.isEmpty){
                    return 'Email Tidak Boleh Kosong !';
                  }
                  if(!p0.contains('@')){
                    return 'Email harus menggunakan @';
                  }
                  return null;
                }),
                controller: emailController,
                hintTxt: "Email",
                helperTxt: "ucup@gmail.com",
                iconData: Icons.email),
              inputForm(
                ((p0){
                  if(p0 == null || p0.isEmpty){
                    return 'Password Tidak Boleh Kosong !';
                  }
                  if(p0.length<5){
                    return 'Password minimal 5 digit';
                  }
                  if (!RegExp(r'[0-9]').hasMatch(p0)) {
                    return 'Password harus mengandung setidaknya satu angka';
                  }
                  if (!RegExp(r'[!@#\$&*~]').hasMatch(p0)) {
                    return 'Password harus mengandung setidaknya satu simbol spesial (!@#\$&*~)';
                  }
                  return null;
                }),
                controller: passwordController,
                hintTxt: "Password",
                helperTxt: "xxxxxxxx",
                iconData: Icons.password,
                password: true),
              inputForm(
                ((p0){
                  if(p0 == null || p0.isEmpty){
                    return 'Nomor Telepon Tidak Boleh Kosong !';
                  }
                  return null;
                }),
                controller: notelController,
                hintTxt: "No Telp",
                helperTxt: "081212345678",
                iconData: Icons.phone_android),
              inputForm(
                ((p0){
                  if(p0 == null || p0.isEmpty){
                    return 'Nomor KTP Tidak Boleh Kosong !';
                  }
                  return null;
                }),
                controller: idController,
                hintTxt: "No KTP",
                helperTxt: "3171061204880001",
                iconData: Icons.badge),
              Column(
                children: [
                  RadioListTile<String>(
                    title: const Text('Male'),
                    value: 'Male',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Female'),
                    value: 'Female',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                  RadioListTile<String>(
                    title: const Text('Other'),
                    value: 'Other',
                    groupValue: _gender,
                    onChanged: (value) {
                      setState(() {
                        _gender = value!;
                      });
                    },
                  ),
                ],
              ),
              ElevatedButton(
                onPressed: (){
                  if(_formKey.currentState!.validate()){
                    Map<String,dynamic> formData = {};
                    formData['username'] = usernameController.text;
                    formData['password'] = passwordController.text;
                    Navigator.push(context, MaterialPageRoute(builder: (_)=> LoginView(data : formData)));
                  }
                }, 
                child: const Text('Register'))
            ],
          ), 
        ),
      ),
    );
  }
}