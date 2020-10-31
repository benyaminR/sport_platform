class PersonModel {
  //Person --> Was will ich von der Person wissen --> ohne auf die GUI einzugehen

  //zu verschiedenen Models verschiedene Namen --> PersonModel

  //Konstruktor wird gesetzt und kleine Berechnungen (z.B. Dauer aus Start und Enddatum) nur mit den Konstruktordaten hantieren, alles andere nicht

  String _vorname;
  String _nachname;

  PersonModel(this._vorname, this._nachname);

  String get nachname => _nachname;

  String get vorname => _vorname;

  set nachname(String value) {
    _nachname = value;
  }
}
