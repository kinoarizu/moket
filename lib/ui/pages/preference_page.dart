part of 'pages.dart';

class PreferencePage extends StatefulWidget {
  final List<String> genres = [
    "Horror",
    "Music",
    "Action",
    "Drama",
    "War",
    "Crime",
  ];

  final List<String> languages = [
    "Indonesia",
    "English",
    "Japanese",
    "Korean",
  ];

  final Registration registration;

  PreferencePage(this.registration);

  @override
  _PreferencePageState createState() => _PreferencePageState();
}

class _PreferencePageState extends State<PreferencePage> {
  List<String> selectedGenres = [];
  String selectedLanguage = "English";

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        widget.registration.password = null;
        context.bloc<PageBloc>().add(GoToRegistrationPage(widget.registration));
        return;
      },
      child: Scaffold(
        body: ListView(
          children: [
            Container(
              color: Colors.white,
              padding: EdgeInsets.symmetric(horizontal: defaultMargin),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 56,
                    margin: EdgeInsets.only(
                      top: 20,
                      bottom: 4,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        widget.registration.password = null;
                        context.bloc<PageBloc>().add(GoToRegistrationPage(widget.registration));
                        return;
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                  ),
                  Text(
                    "Select Your Four\nFavorite Genres",
                    style: blackTextFont.copyWith(
                      fontSize: 20,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generateGenreWidgets(context),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Text(
                    "Movie Language\nYou Prefer?",
                    style: blackTextFont.copyWith(
                      fontSize: 20,
                      height: 1.4,
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Wrap(
                    spacing: 24,
                    runSpacing: 24,
                    children: generateLangWidgets(context),
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Center(
                    child: FloatingActionButton(
                      elevation: 0,
                      backgroundColor: mainColor,
                      child: Icon(Icons.arrow_forward),
                      onPressed: () {
                        if (selectedGenres.length != 4) {
                          Flushbar(
                            duration: Duration(milliseconds: 1500),
                            flushbarPosition: FlushbarPosition.TOP,
                            backgroundColor: Color(0xFFFF5C83),
                            message: "Please select 4 genres",
                          )..show(context);
                        } else {
                          widget.registration.selectedGenres = selectedGenres;
                          widget.registration.selectedLang = selectedLanguage;

                          context.bloc<PageBloc>().add(GoToAccountConfirmationPage(widget.registration));
                        }
                      },
                    ),
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

  List<Widget> generateGenreWidgets(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget.genres.map((e) => SelectableBox(
      e,
      width: width,
      isSelected: selectedGenres.contains(e),
      onTap: () {
        onSelectGenre(e);
      },
    )).toList();
  }

  List<Widget> generateLangWidgets(BuildContext context) {
    double width = (MediaQuery.of(context).size.width - 2 * defaultMargin - 24) / 2;

    return widget.languages.map((e) => SelectableBox(
      e,
      width: width,
      isSelected: selectedLanguage == e,
      onTap: () {
        setState(() {
          selectedLanguage = e;
        });
      },
    )).toList();
  }

  void onSelectGenre(String genre) {
    if (selectedGenres.contains(genre)) {
      setState(() {
        selectedGenres.remove(genre);
      });
    } else {
      if (selectedGenres.length < 4) {
        setState(() {
          selectedGenres.add(genre);
        });
      }
    }
  }
}


