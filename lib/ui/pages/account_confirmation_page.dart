part of 'pages.dart';

class AccountConfirmationPage extends StatefulWidget {
  final Registration registration;

  AccountConfirmationPage(this.registration);

  @override
  _AccountConfirmationPageState createState() => _AccountConfirmationPageState();
}

class _AccountConfirmationPageState extends State<AccountConfirmationPage> {
  bool isSigningUp = false;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToPreferencePage(widget.registration));
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
                      bottom: 90,
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
                              context.bloc<PageBloc>().add(GoToPreferencePage(widget.registration));
                            },
                          ),
                        ),
                        Center(
                          child: Text(
                            "Confirm\nNew Account",
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
                    width: 150,
                    height: 150,
                    margin: EdgeInsets.only(bottom: 20),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: (widget.registration.profileImage == null) ? AssetImage("assets/user_pic.png") : FileImage(widget.registration.profileImage),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Text(
                    "Welcome",
                    style: blackTextFont.copyWith(
                      height: 1.4,
                      fontSize: 16,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  Text(
                    "${widget.registration.name}",
                    textAlign: TextAlign.center,
                    style: blackTextFont.copyWith(
                      height: 1.4,
                      fontSize: 20
                    ),
                  ),
                  SizedBox(
                    height: 110,
                  ),
                  (isSigningUp) ?
                  SpinKitFadingCircle(
                    color: Color(0xFF3E9D9D),
                    size: 45,
                  ) : SizedBox(
                    width: 250,
                    height: 45,
                    child: RaisedButton(
                      elevation: 0,
                      color: Color(0xFF3E9D9D),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Create My Account",
                        style: whiteTextFont.copyWith(fontSize: 16),
                      ),
                      onPressed: () async {
                        setState(() {
                          isSigningUp = true;
                        });

                        imageFileToUpload = widget.registration.profileImage;

                        SignInSignUpResult result = await AuthServices.signUp(
                          widget.registration.email,
                          widget.registration.name,
                          widget.registration.password,
                          widget.registration.selectedGenres,
                          widget.registration.selectedLang,
                        );

                        if (result.user == null) {
                          setState(() {
                            isSigningUp = false;
                          });

                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFFFF5C83),
                            message: result.message,
                          )..show(context);
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    height: 70,
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
