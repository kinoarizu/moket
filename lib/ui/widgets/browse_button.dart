part of 'widgets.dart';

class BrowseButton extends StatelessWidget {
  final String genre;

  BrowseButton(this.genre);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            height: 50,
            width: 50,
            padding: EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Color(0xFFEBEFF6),
              borderRadius: BorderRadius.circular(8),
            ),
            child: generateIconGenre(genre),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            genre,
            style: blackTextFont.copyWith(fontSize: 12),
          ),
        ],
      ),
    );
  }
}

Widget generateIconGenre(String genre) {
  switch(genre) {
    case "Action":
      return Image.asset("assets/ic_action.png");
      break;
    case "Crime":
      return Image.asset("assets/ic_crime.png");
      break;
    case "Drama":
      return Image.asset("assets/ic_drama.png");
      break;
    case "Horror":
      return Image.asset("assets/ic_horror.png");
      break;
    case "War":
      return Image.asset("assets/ic_war.png");
      break;
    default:
      return Image.asset("assets/ic_music.png");
      break;
  }
}