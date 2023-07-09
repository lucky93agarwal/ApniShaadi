import 'package:apnishaadi/repositories/post_repository.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  bool passwordVisible = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    PostRepository postRepository = PostRepository();
    postRepository.fetchPosts();
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SizedBox(
        width: size.width,
        height: size.height,
        child: ListView(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Text(
              "Welcome back",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff38373d),
                  fontSize: 30,
                  fontWeight: FontWeight.w600),
            ),
            const SizedBox(
              height: 10,
            ),
            const Text(
              "Login to your account",
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Color(0xff76757b),
                  fontSize: 16,
                  fontWeight: FontWeight.normal),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: const Color(0xFFDDE4EE)),
                  borderRadius:const BorderRadius.all(Radius.circular(30)),
                  boxShadow:const [
                    BoxShadow(
                      color: Color(0xFFD1E0EF),
                      blurRadius: 12.0,
                      offset: Offset(2, 2),
                    ),
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/goole.png",
                    width: 25,
                    height: 25,
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Text(
                    "Continue with Google",
                    style: TextStyle(
                        color: Color(0xff76757b),
                        fontSize: 16,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: size.width * 0.45,
                    height: 1,
                    color: const Color(0xffcecece),
                  ),
                  const Text(
                    "OR",
                    style: TextStyle(color: Color(0xffa8a8a8)),
                  ),
                  Container(
                    width: size.width * 0.45,
                    height: 1,
                    color: const Color(0xffcecece),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              color: Colors.white,
              child: TextField(
                controller: emailController,
                style:const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w900),
                decoration: const InputDecoration(
                  enabledBorder:UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey, width: 0.0),
                  ),
                  labelText: 'Mobile No. / Email ID',
                  hintText: 'Enter Mobile No. / Email ID',
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
              color: Colors.white,
              child: TextField(
                controller: passwordController,
                obscureText: !passwordVisible,
                style:const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w900),
                decoration: InputDecoration(
                    enabledBorder:const UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.0),
                    ),
                    labelText: 'Password',
                    hintText: 'Enter Password',
                    suffix: InkWell(onTap: (){
                      setState(() {
                        passwordVisible = !passwordVisible;
                      });
                    },child: Text(passwordVisible ?"Hide":"Show"))),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 40),
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text(
                    "Login with OTP",
                    style: TextStyle(
                        color: Color(0xff2ec4d5),
                        fontSize: 14,
                        fontWeight: FontWeight.w900),
                  ),
                  Text(
                    "Forgot Password?",
                    style: TextStyle(
                        color: Color(0xff2ec4d5),
                        fontSize: 14,
                        fontWeight: FontWeight.w900),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 70, vertical: 15),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              decoration: const BoxDecoration(
                  color: Color(0xff2ec4d5),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0xffe5e5e5),
                      blurRadius: 12.0,
                      offset: Offset(2, 2),
                    ),
                  ]),
              child: const Text(
                "Login",
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 19,
                    fontWeight: FontWeight.w900),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
