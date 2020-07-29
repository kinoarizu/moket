part of 'pages.dart';

class SignUpPage extends StatefulWidget {
  final Registration registration;

  SignUpPage(this.registration);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController retypePasswordController = TextEditingController();

  @override
  void initState() {
    super.initState();

    nameController.text = widget.registration.name;
    emailController.text = widget.registration.email;
  }

  @override
  Widget build(BuildContext context) {
    context.bloc<ThemeBloc>().add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToSplashPage());
        return;
      },
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                children: [
                  Container(
                    height: 56,
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 22,
                    ),
                    child: Stack(
                      children: [
                        Align(
                          alignment: Alignment.centerLeft,
                          child: GestureDetector(
                            child: Icon(
                              Icons.arrow_back,
                              color: Colors.black,
                            ),
                            onTap: () {
                              context.bloc<PageBloc>().add(GoToSplashPage());
                            },
                          ),
                        ),
                        Center(
                          child: Text(
                            "Create New\nYour Account",
                            textAlign: TextAlign.center,
                            style: blackTextFont.copyWith(
                              height: 1.4,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: 90,
                    height: 104,
                    child: Stack(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: (widget.registration.profileImage == null) ? AssetImage("assets/user_pic.png") : FileImage(widget.registration.profileImage),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () async {
                              if (widget.registration.profileImage == null) {
                                widget.registration.profileImage = await getImage();
                              }
                              else {
                                widget.registration.profileImage = null;
                              }

                              setState(() {});
                            },
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    (widget.registration.profileImage == null) ? "assets/btn_add_photo.png" : "assets/btn_del_photo.png",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 36,
                  ),
                  TextField(
                    controller: nameController,
                    style: blackTextFont.copyWith(fontSize: 16),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Full Name",
                      hintText: "Full Name",
                      labelStyle: GoogleFonts.raleway(fontSize: 16),
                      hintStyle: GoogleFonts.raleway(fontSize: 16),
                    ),
                    onChanged: (text) {

                    },
                  ),
                  SizedBox(
                    height: 16,
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

                    },
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: retypePasswordController,
                    obscureText: true,
                    style: blackTextFont.copyWith(fontSize: 16),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Confirm Password",
                      hintText: "Confirm Password",
                      labelStyle: GoogleFonts.raleway(fontSize: 16),
                      hintStyle: GoogleFonts.raleway(fontSize: 16),
                    ),
                    onChanged: (text) {

                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  FloatingActionButton(
                    elevation: 0,
                    backgroundColor: mainColor,
                    child: Icon(Icons.arrow_forward),
                    onPressed: () {
                      if (
                        !(nameController.text.trim() != ""
                        && emailController.text.trim() != ""
                        && passwordController.text.trim() != ""
                        && retypePasswordController.text.trim() != "")
                      ) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Please fill all the fields",
                        )..show(context);
                      }
                      else if (passwordController.text != retypePasswordController.text) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Mismatch password and confirmed password",
                        )..show(context);
                      }
                      else if (passwordController.text.length < 6) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Password's length min 6 characters",
                        )..show(context);
                      }
                      else if (!EmailValidator.validate(emailController.text)) {
                        Flushbar(
                          duration: Duration(milliseconds: 1500),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Password's length min 6 characters",
                        )..show(context);
                      }
                      else {
                        widget.registration.name = nameController.text;
                        widget.registration.email = emailController.text;
                        widget.registration.password = passwordController.text;

                        context.bloc<PageBloc>().add(GoToPreferencePage(widget.registration));
                      }
                    },
                  ),
                  SizedBox(
                    height: 40,
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
