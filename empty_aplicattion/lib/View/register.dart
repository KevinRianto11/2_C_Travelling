import 'package:flutter/material.dart';
import 'package:empty_aplicattion/View/login.dart';
import 'package:empty_aplicattion/component/form_component.dart';


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
  TextEditingController notelpController = TextEditingController();
  TextEditingController jenisKelaminController = TextEditingController();
 

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              inputForm((p0){
                if(p0 == null || p0.isEmpty){
                  return 'Username Tidak Boleh Kosong';
                }
                if(p0.toLowerCase() == 'anjing'){
                  return 'Tidak Boleh Menggunakan kata kasar';
                }
                return null;
              },
                controller: usernameController,
                hintTxt : "Username",
                helperTxt: "Ucup Surucup",
                iconData: Icons.person),

              inputForm(
                ((p0){
                  if(p0 == null || p0.isEmpty){
                    return 'Email tidak boleh kosong';
                  }
                  if(!p0.contains('@')){
                    return 'email harus Menggunakan @';
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
                    return 'Jenis kelamin tidak boleh kosong';
                  }
                  if(p0 != "Laki" && p0 != "Perempuan"){
                    return 'Jenis kelamin harus Laki atau Perempuan';
                  }
                  return null;
                }),
                controller: jenisKelaminController,
                hintTxt: "Jenis Kelamin",
                helperTxt: "Laki/Perempuan",
                iconData: Icons.person,
              ),
             

              inputForm(
                ((p0){
                  if(p0 == null || p0.isEmpty){
                    return 'Password tidak boleh kosong';
                  }
                  if(p0.length<5){
                    return 'Password minimal 5 digit';
                  }
                  return null;
                }),
                controller: passwordController,
                hintTxt: "Password",
                helperTxt: "xxxxxxx",
                iconData: Icons.password,
                password: true),

              inputForm(
                ((p0){
                  if(p0 == null || p0.isEmpty){
                    return 'Nomor telepon tidak boleh kosong';
                  }
                  return null;
                }),
                controller: notelpController,
                hintTxt: "No Telp",
                helperTxt: "082123456789",
                iconData: Icons.phone_android),
              ElevatedButton(
                onPressed: () {
                  if(_formKey.currentState!.validate()){
                    Map<String,dynamic> formData = {};
                    formData['email'] = emailController.text;
                    formData['password'] = passwordController.text;

                    Navigator.push(context, MaterialPageRoute(builder: (_) => LoginView(data: formData ,)) );
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