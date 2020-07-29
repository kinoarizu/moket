part of 'pages.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: ListView(
        children: [
          Container(
            height: MediaQuery.of(context).size.height - MediaQuery.of(context).padding.top,
            padding: EdgeInsets.symmetric(horizontal: defaultMargin),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Spacer(
                  flex: 10,
                ),
                Container(
                  height: 136,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/logo.png"),
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(
                    top: 70,
                    bottom: 16,
                  ),
                  child: Text(
                    "New Experience",
                    style: blackTextFont.copyWith(fontSize: 20),
                  ),
                ),
                Text(
                  "Watch a new movie much\neasier than any before",
                  textAlign: TextAlign.center,
                  style: greyTextFont.copyWith(
                    height: 1.375,
                    fontSize: 16,
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Container(
                  width: 250,
                  height: 46,
                  margin: EdgeInsets.only(
                    top: 70,
                    bottom: 20,
                  ),
                  child: RaisedButton(
                    elevation: 0,
                    color: mainColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      "Get Started",
                      style: whiteTextFont.copyWith(fontSize: 16),
                    ),
                    onPressed: () {
                      context.bloc<PageBloc>().add(GoToRegistrationPage(Registration()));
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",
                      style: greyTextFont.copyWith(fontWeight: FontWeight.w400),
                    ),
                    GestureDetector(
                      onTap: () {
                        context.bloc<PageBloc>().add(GoToLoginPage());
                      },
                      child: Text(
                        "Sign In",
                        style: purpleTextFont,
                      ),
                    ),
                  ],
                ),
                Spacer(
                  flex: 7,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
