part of 'models.dart';

class Promo extends Equatable {
  /// -----------------------------------------
  /// [Promo Class]
  /// This class is used to modeling promo data
  /// -----------------------------------------

  //* Property model
  final String title;
  final String subtitle;
  final int discount;

  //* Constructor model
  Promo({
    @required this.title,
    @required this.subtitle,
    @required this.discount,
  });

  //* Passing property model to list of object
  @override
  List<Object> get props => [
    title,
    subtitle,
    discount,
  ];
}

//* Generate dummy promos data
List<Promo> dummyPromos = [
  Promo(title: "Student Holiday", discount: 50, subtitle: "Maximal only for two peoples"),
  Promo(title: "Family Club", discount: 70, subtitle: "Maximal only for three members"),
  Promo(title: "Student Holiday", discount: 40, subtitle: "Min. one year"),
];