part of 'pages.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToMainPage());
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
                    child: Container(
                      margin: EdgeInsets.only(
                        top: 20,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onTap: () {
                            context.bloc<PageBloc>().add(GoToMainPage());
                          },
                        ),
                      ),
                    ),
                  ),
                  BlocBuilder<UserBloc, UserState>(
                    builder: (_, userState) {
                      User user = (userState as UserLoaded).user;

                      return Column(
                        children: [
                          Container(
                            width: 120,
                            height: 120,
                            margin: EdgeInsets.only(
                              bottom: 10,
                              top: 30,
                            ),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                fit: BoxFit.cover,
                                image: (user.profilePicture == "" ? AssetImage("assets/user_pic.png") : NetworkImage(user.profilePicture)),
                              ),
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                            child: Text(
                              user.name,
                              style: blackTextFont.copyWith(fontSize: 18),
                              maxLines: 2,
                              textAlign: TextAlign.center,
                              overflow: TextOverflow.clip,
                            ),
                          ),
                          SizedBox(
                            height: 8,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width - 2 * defaultMargin,
                            child: Text(
                              user.email,
                              textAlign: TextAlign.center,
                              style: greyTextFont.copyWith(
                                fontSize: 16,
                                fontWeight: FontWeight.w300,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Column(
                    children: [
                      BlocBuilder<UserBloc, UserState>(
                        builder: (_, userState) => GestureDetector(
                          behavior: HitTestBehavior.translucent,
                          onTap: () {
                            context.bloc<PageBloc>().add(GoToEditProfilePage((userState as UserLoaded).user));
                          },
                          child: Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                margin: EdgeInsets.only(right: 10),
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage("assets/edit_profile.png"),
                                  ),
                                ),
                              ),
                              Text(
                                "Edit Profile",
                                style: blackTextFont.copyWith(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          bottom: 16,
                        ),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          context.bloc<PageBloc>().add(GoToWalletPage(GoToProfilePage()));
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/my_wallet.png"),
                                ),
                              ),
                            ),
                            Text(
                              "My Wallet",
                              style: blackTextFont.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          bottom: 16,
                        ),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/language.png"),
                              ),
                            ),
                          ),
                          Text(
                            "Change Language",
                            style: blackTextFont.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          bottom: 16,
                        ),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/help_center.png"),
                              ),
                            ),
                          ),
                          Text(
                            "Help Centre",
                            style: blackTextFont.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          bottom: 16,
                        ),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 24,
                            height: 24,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/like.png"),
                              ),
                            ),
                          ),
                          Text(
                            "Rate Flutix",
                            style: blackTextFont.copyWith(fontSize: 16),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          bottom: 16,
                        ),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.translucent,
                        onTap: () {
                          context.bloc<UserBloc>().add(SignOut());
                          AuthServices.signOut();
                        },
                        child: Row(
                          children: [
                            Container(
                              width: 24,
                              height: 24,
                              margin: EdgeInsets.only(right: 10),
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage("assets/sign_out.png"),
                                ),
                              ),
                            ),
                            Text(
                              "Sign Out",
                              style: blackTextFont.copyWith(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                          top: 10,
                          bottom: 16,
                        ),
                        child: Divider(
                          thickness: 1,
                        ),
                      ),
                    ],
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
