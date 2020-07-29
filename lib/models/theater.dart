part of 'models.dart';

class Theater extends Equatable {
  /// -------------------------------------------
  /// [Theater Class]
  /// This class is used to modeling theater data
  /// -------------------------------------------

  //* Property model
  final String name;

  //* Constructor model
  Theater(this.name);

  //* Passing property mdoel to list of object
  @override
  List<Object> get props => [name];
}

//* Generate dummy theaters data
List<Theater> dummyTheaters = [
  Theater("CGV 23 Paskal Hyper Square"),
  Theater("CGV Paris Van Java"),
  Theater("XXI Cihampelas Walk"),
  Theater("XXI Bandung Trade Center"),
];