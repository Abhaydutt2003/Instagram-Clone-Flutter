import "package:flutter/material.dart";
import "package:flutter_svg/svg.dart";
import "package:instagram_flutter/resources/auth_methods.dart";
import "package:instagram_flutter/utils/colors.dart";
import "package:instagram_flutter/widgets/text_filed_input.dart";

 class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _bioController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _bioController.dispose();
    _usernameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(flex: 2, child: Container()),
              //svg image
              SvgPicture.asset('assets/ic_instagram.svg',
                  colorFilter:
                      const ColorFilter.mode(primaryColor, BlendMode.srcIn),
                  height: 64),
              const SizedBox(height: 64),
              Stack(children: [
                CircleAvatar(
                  radius: 64,
                  backgroundImage:NetworkImage('https://plus.unsplash.com/premium_photo-1681345515350-89e8c3891b50?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=2787&q=80'),
                ),
                Positioned(
                  bottom: -10,
                  left:80,
                  child:IconButton(onPressed: (){} ,icon :const Icon(Icons.add_a_photo,)))
              ],),
              const SizedBox(height:  64),
              //text input for username
              TextFieldInput(
                hintText: "Enter your username",
                textInputType: TextInputType.text,
                textEditingController: _usernameController,
              ),
              const SizedBox(height: 24),
              //text input for email
              TextFieldInput(
                hintText: "Enter your email",
                textInputType: TextInputType.emailAddress,
                textEditingController: _emailController,
              ),
              const SizedBox(height: 24),
              //text field for password
              TextFieldInput(
                hintText: "Enter your Password",
                textInputType: TextInputType.emailAddress,
                textEditingController: _passwordController,
                isPass: true,
              ),
              const SizedBox(height: 24),
              //text input for bio
              TextFieldInput(
                hintText: "Enter your bio",
                textInputType: TextInputType.text,
                textEditingController: _bioController,
              ),
              const SizedBox(height: 24),
              //button login
              InkWell(
                onTap: () async{
                  String res = await AuthMethods().signUpUser(email: _emailController.text, password: _passwordController.text, username: _usernameController.text, bio:_bioController.text);
                  print(res);
                },
                child : Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration: const ShapeDecoration(
                      color: blueColor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)))),
                  child: const Text('Log In'))
              ),
              const SizedBox(height: 12),
              Flexible(flex: 2, child: Container()),
              //transitioning to sign up
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: const Text("Don't have an account? "),
                  ),
                  GestureDetector(
                    onTap: (){},
                    child : Container(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: const Text("Sign Up!",
                            style: TextStyle(fontWeight: FontWeight.bold))  
                  )
                  )
                ], 
              )
            ],
          )),
    ));
  }
}
