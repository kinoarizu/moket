part of 'widgets.dart';

class RatingStars extends StatelessWidget {
  final double voteAverage;
  final double starSize;
  final double fontSize;
  final Color color;
  final MainAxisAlignment mainAxisAlignment;

  RatingStars({
    this.voteAverage = 0,
    this.starSize = 20,
    this.fontSize = 12,
    this.color,
    this.mainAxisAlignment = MainAxisAlignment.start,
  });

  @override
  Widget build(BuildContext context) {
    int n = (voteAverage / 2).round();

    List<Widget> widgets = List.generate(5, (index) => Icon(
      index < n ? MdiIcons.star : MdiIcons.starOutline,
      color: accentColor2,
      size: starSize,
    ));

    widgets.add(
      SizedBox(width: 3)
    );

    widgets.add(
      Text(
        "$voteAverage",
        style: whiteNumberFont.copyWith(
          fontWeight: FontWeight.w300,
          fontSize: fontSize,
          color: color,
        ),
      ),
    );

    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: widgets,
    );
  }
}