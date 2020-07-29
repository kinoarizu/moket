part of 'extensions.dart';

extension StringExtension on String {
  /// -------------------------------------------------------
  /// [STRING EXTENSION]
  /// Used to make additional method/getter from String class
  /// -------------------------------------------------------

  //* Method to check digit character using codeunit
  bool isDigit(int index) => this.codeUnitAt(index) >= 48 && this.codeUnitAt(index) <= 57;
}