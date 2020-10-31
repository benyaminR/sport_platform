import 'package:sport_platform/features/authentication/presentation/bloc/authentication/personmodel.dart';

class BewertungModel {

  //Person --> Was will ich von der Person wissen --> ohne auf die GUI einzugehen

  //zu verschiedenen Models verschiedene Namen --> PersonModel

  //Konstruktor wird gesetzt und kleine Berechnungen (z.B. Dauer aus Start und Enddatum) nur mit den Konstruktordaten hantieren, alles andere nicht

  PersonModel _person;
  double _rating;
  String _text;

  BewertungModel(this._person, this._rating, this._text);

  String get text => _text;

  double get rating => _rating;

  PersonModel get person => _person;
}