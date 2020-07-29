part of 'pages.dart';

class EditProfilePage extends StatefulWidget {
  final User user;

  EditProfilePage(this.user);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  TextEditingController nameController;
  String profilePath;
  bool isDataEdited = false;
  File profileImageFile;
  bool isUpdating = false;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.user.name);
    profilePath = widget.user.profilePicture;
  }

  @override
  Widget build(BuildContext context) {
    context.bloc<ThemeBloc>().add(ChangeTheme(ThemeData().copyWith(primaryColor: accentColor2)));

    return WillPopScope(
      onWillPop: () async {
        context.bloc<PageBloc>().add(GoToProfilePage());
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
                              context.bloc<PageBloc>().add(GoToProfilePage());
                            },
                          ),
                        ),
                        Center(
                          child: Text(
                            "Edit Your\nProfile",
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
                    margin: EdgeInsets.only(bottom: 36),
                    child: Stack(
                      children: [
                        Container(
                          height: 90,
                          width: 90,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: (profileImageFile != null) ? FileImage(profileImageFile) : (profilePath != "") ? NetworkImage(profilePath) : AssetImage("assets/user_pic.png"),
                            ),
                          ),
                        ),
                        Align(
                          alignment: Alignment.bottomCenter,
                          child: GestureDetector(
                            onTap: () async {
                              if (profilePath == "") {
                                profileImageFile = await getImage();

                                if (profileImageFile != null) {
                                  profilePath = basename(profileImageFile.path);
                                }
                              }
                              else {
                                profileImageFile = null;
                                profilePath = "";
                              }

                              setState(() {
                                isDataEdited = (nameController.text.trim() != widget.user.name || profilePath != widget.user.profilePicture) ? true : false;
                              });
                            },
                            child: Container(
                              height: 28,
                              width: 28,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  image: AssetImage(
                                    (profilePath == "") ? "assets/btn_add_photo.png" : "assets/btn_del_photo.png",
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  AbsorbPointer(
                    child: TextField(
                      controller: TextEditingController(text: widget.user.id),
                      style: whiteNumberFont.copyWith(
                        fontSize: 16,
                        color: accentColor3,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "User ID",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  AbsorbPointer(
                    child: TextField(
                      controller: TextEditingController(text: widget.user.email),
                      style: whiteTextFont.copyWith(
                        fontSize: 16,
                        color: accentColor3,
                      ),
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Email Address",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  TextField(
                    controller: nameController,
                    style: blackTextFont,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      labelText: "Full Name",
                      hintText: "Full Name",
                    ),
                    onChanged: (text) {
                      setState(() {
                        isDataEdited = (text.trim() != widget.user.name || profilePath != widget.user.profilePicture) ? true : false;
                      });
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    width: 250,
                    height: 45,
                    child: RaisedButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            MdiIcons.alertCircle,
                            color: Colors.white,
                            size: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "Change Password",
                            style: whiteTextFont.copyWith(
                              fontSize: 16,
                              color: (isUpdating) ? Color(0xFFBEBEBE) : Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Icon(
                            MdiIcons.alertCircle,
                            color: Colors.white,
                            size: 20,
                          ),
                        ],
                      ),
                      disabledColor: Color(0xFFE4E4E4),
                      color: Colors.red[400],
                      onPressed: (isUpdating) ? null : () async {
                        await AuthServices.resetPassword(widget.user.email);

                        Flushbar(
                          duration: Duration(milliseconds: 2000),
                          flushbarPosition: FlushbarPosition.TOP,
                          backgroundColor: Color(0xFFFF5C83),
                          message: "Reset password link has been sent to your email",
                        )..show(context);
                      },
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  (isUpdating) ? SizedBox(
                    width: 50,
                    height: 50,
                    child: SpinKitFadingCircle(
                      color: Color(0xFF3E9D9D),
                    ),
                  ) : Container(
                    width: 250,
                    height: 45,
                    child: RaisedButton(
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        "Update My Profile",
                        style: whiteTextFont.copyWith(
                          fontSize: 16,
                          color: (isDataEdited) ? Colors.white : Color(0xFFBEBEBE),
                        ),
                      ),
                      disabledColor: Color(0xFFE4E4E4),
                      color: Color(0xFF3E9D9D),
                      onPressed: (isDataEdited) ? () async {
                        setState(() {
                          isUpdating = true;
                        });

                        if (profileImageFile != null) {
                          profilePath = await uploadImage(profileImageFile);
                        }

                        context.bloc<UserBloc>().add(
                          UpdateData(
                            name: nameController.text,
                            profileImage: profilePath,
                          ),
                        );

                        context.bloc<PageBloc>().add(GoToProfilePage());
                      } : null,
                    ),
                  ),
                  SizedBox(
                    height: 30,
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