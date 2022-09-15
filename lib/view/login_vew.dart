import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_app_ankara_flutter/view/home.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  final String emailHint = "Email ID";
  final String passwordHint = "Password";
  final String loginText = "Login";
  final String forgotPasswordText = "Forgot Password?";
  final String googleWithLogin = 'Login with Google';
  final String registerText = 'New to Travel App?';
  final String register = 'Register';

  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: horizontalNormalPadding,
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(height: AppBar().preferredSize.height),
                Flexible(
                  child: Lottie.asset('assets/login_lottie.json'),
                ),
                Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const SizedBox(height: 16),
                      buildLoginText(context),
                      const SizedBox(height: 24),
                      buildTextFormField(
                        editingController: emailController,
                        icon: const Icon(CupertinoIcons.mail),
                        hintText: emailHint,
                        textEditingType: TextEditingType.email,
                      ),
                      const SizedBox(height: 16),
                      buildTextFormField(
                        editingController: passwordController,
                        icon: const Icon(CupertinoIcons.lock),
                        hintText: passwordHint,
                        textEditingType: TextEditingType.password,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          textButton(onPressed: () {}, text: forgotPasswordText),
                        ],
                      ),
                      const SizedBox(height: 16),
                      buildLoginButton(),
                      const SizedBox(height: 20),
                      buildOrText(),
                      const SizedBox(height: 20),
                      buildLoginWithGoogle(),
                      const SizedBox(height: 16),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            registerText,
                            style: TextStyle(color: Colors.black.withOpacity(.5), fontWeight: FontWeight.w500),
                          ),
                          textButton(onPressed: () {}, text: register),
                        ],
                      ),
                      const SizedBox(height: 16),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Row buildLoginText(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          loginText,
          style: Theme.of(context).textTheme.headline4!.copyWith(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),
        ),
      ],
    );
  }

  SizedBox buildLoginButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          formKey.currentState!.validate();
        },
        style: ElevatedButton.styleFrom(
          primary: blueColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fixedSize: const Size(0, 50),
        ),
        child: Text(
          loginText,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }

  Row buildOrText() {
    return Row(
      children: [
        const Flexible(child: Divider()),
        Padding(
          padding: horizontalNormalPadding,
          child: Text(
            'OR',
            style: TextStyle(color: Colors.black.withOpacity(.5), fontWeight: FontWeight.w500),
          ),
        ),
        const Flexible(child: Divider()),
      ],
    );
  }

  TextButton textButton({required Function onPressed, required String text}) {
    return TextButton(
        // onPressed: () {Navigator.push(cont},
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (b) => HomeScreen()));
        },
        child: Text(
          text,
          style: TextStyle(color: blueColor, fontWeight: FontWeight.w600),
        ));
  }

  SizedBox buildLoginWithGoogle() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          primary: greyColor,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          fixedSize: const Size(0, 50),
        ),
        child: Padding(
          padding: horizontalNormalPadding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(width: 24, child: googleImage),
              Text(googleWithLogin, style: TextStyle(color: Colors.black.withOpacity(.8))),
              Opacity(opacity: 0, child: SizedBox(width: 24, child: googleImage)),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextFormField({
    required TextEditingController editingController,
    required Icon icon,
    required String hintText,
    required TextEditingType textEditingType,
  }) {
    return TextFormField(
      controller: editingController,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Bu alan boş bırakılamaz';
        }
        switch (textEditingType) {
          case TextEditingType.email:
            if (!value.contains('@')) {
              return 'Lütfen geçerli bir email adresi giriniz';
            }
            break;
          case TextEditingType.password:
            if (value.length < 6) {
              return 'Lütfen en az 6 karakter giriniz';
            }
            break;
          default:
            return null;
        }
        return null;
      },
      obscureText: textEditingType == TextEditingType.password ? !isVisible : false,
      decoration: InputDecoration(
        border: const UnderlineInputBorder(),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black.withOpacity(.2)),
        ),
        focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: blueColor)),
        hintText: hintText,
        suffixIcon: textEditingType == TextEditingType.password
            ? IconButton(
                onPressed: () {
                  isVisible = !isVisible;
                  setState(() {});
                },
                icon: isVisible ? const Icon(CupertinoIcons.eye_slash_fill) : const Icon(CupertinoIcons.eye))
            : const SizedBox(),
        icon: icon,
      ),
    );
  }

  EdgeInsets get horizontalNormalPadding => const EdgeInsets.symmetric(horizontal: 24.0);

  Color get blueColor => const Color(0xFF0164FF);

  Color get greyColor => const Color(0xffF1F6F7);

  //googleImage
  Image get googleImage => Image.asset('assets/google.png');

  //googleImage()
  Image googleImage2() {
    return Image.asset('assets/google.png');
  }
}

enum TextEditingType {
  email,
  password,
}
