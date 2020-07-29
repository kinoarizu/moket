part of 'pages.dart';

class SignInPage extends StatefulWidget {
  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool isEmailValid = false;
  bool isPasswordValid = false;
  bool isSigningIn = false;

  @override
  Widget build(BuildContext context) {
    context.bloc<ThemeBloc>().add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));

    return WillPopScope(
      onWillPop: () {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        body: ListView(
          children: [
            Container(
              height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(
                    flex: 15,
                  ),
                  SizedBox(
                    height: 70,
                    child: Image.asset("assets/logo.png"),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                      top: 70,
                      bottom: 40,
                    ),
                    child: Text(
                      "Welcome Back,\nExplorer!",
                      style: blackTextFont.copyWith(
                        height: 1.4,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  TextField(
                    controller: emailController,
                    style: blackTextFont.copyWith(fontSize: 16),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Email Address",
                      hintText: "Email Address",
                      labelStyle: GoogleFonts.raleway(fontSize: 16),
                      hintStyle: GoogleFonts.raleway(fontSize: 16),
                    ),
                    onChanged: (text) {
                      setState(() {
                        isEmailValid = EmailValidator.validate(text);
                      });
                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    style: blackTextFont.copyWith(fontSize: 16),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Password",
                      hintText: "Password",
                      labelStyle: GoogleFonts.raleway(fontSize: 16),
                      hintStyle: GoogleFonts.raleway(fontSize: 16),
                    ),
                    onChanged: (text) {
                      setState(() {
                        isPasswordValid = text.length >= 6;
                      });
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Text(
                        "Forgot Password? ",
                        style: greyTextFont.copyWith(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      GestureDetector(
                        onTap: () async {
                          await AuthServices.resetPassword(emailController.text);

                          Flushbar(
                            duration: Duration(seconds: 4),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFF3E9D9D),
                            message: "Reset password link has been sent to your email",
                          )..show(context);
                        },
                        child: Text(
                          "Get Now",
                          style: purpleTextFont.copyWith(fontSize: 12),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Container(
                      width: 50,
                      height: 50,
                      margin: EdgeInsets.only(top: 40, bottom: 30),
                      child: isSigningIn ? SpinKitFadingCircle(color: mainColor) : FloatingActionButton(
                        elevation: 0,
                        child: Icon(
                          Icons.arrow_forward,
                          color: isEmailValid && isPasswordValid ? Colors.white : Color(0xFFBEBEBE),
                        ),
                        backgroundColor: isEmailValid && isPasswordValid ? mainColor : Color(0xFFE4E4E4),
                        onPressed: isEmailValid && isPasswordValid ? () async {
                          setState(() {
                            isSigningIn = true;
                          });

                          SignInSignUpResult result = await AuthServices.signIn(
                            emailController.text,
                            passwordController.text,
                          );

                          if (result.user == null) {
                            setState(() {
                              isSigningIn = false;
                            });

                            Flushbar(
                              duration: Duration(seconds: 4),
                              flushbarPosition: FlushbarPosition.TOP,
                              backgroundColor: Color(0xFFFF5C83),
                              message: result.message,
                            )..show(context);
                          }
                        } : null,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Start Fresh Now? ",
                        style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                      ),
                      GestureDetector(
                        child: Text(
                          "Sign Up",
                          style: purpleTextFont,
                        ),
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToRegistrationPage(Registration()));
                        },
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 26,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
