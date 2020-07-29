part of 'shared.dart';

/// ------------------------------------------------------
/// [THEME DATA]
/// Used to share constanst theme data of this application
/// ------------------------------------------------------

//* Constant default margin data
const double defaultMargin = 24;

//* Constant theme colors data
Color mainColor = Color(0xFF503E9D);
Color accentColor1 = Color(0xFF2C1F63);
Color accentColor2 = Color(0xFFFBD460);
Color accentColor3 = Color(0xFFADADAD);

//* Constant text styles data
TextStyle blackTextFont = GoogleFonts.raleway().copyWith(
  color: Colors.black,
  fontWeight: FontWeight.w500,
);
TextStyle whiteTextFont = GoogleFonts.raleway().copyWith(
  color: Colors.white,
  fontWeight: FontWeight.w500,
);
TextStyle purpleTextFont = GoogleFonts.raleway().copyWith(
  color: mainColor,
  fontWeight: FontWeight.w500,
);
TextStyle greyTextFont = GoogleFonts.raleway().copyWith(
  color: accentColor3,
  fontWeight: FontWeight.w500,
);

//* Constant number styles data
TextStyle whiteNumberFont = GoogleFonts.openSans().copyWith(color: Colors.white);
TextStyle yellowNumberFont = GoogleFonts.openSans().copyWith(color: accentColor2);
