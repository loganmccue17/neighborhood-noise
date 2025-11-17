import 'package:flutter/material.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {}

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  String _npsScoreStr = '';
  String get npsScoreStr => _npsScoreStr;
  set npsScoreStr(String value) {
    _npsScoreStr = value;
  }

  bool _showActiveGigsOnly = false;
  bool get showActiveGigsOnly => _showActiveGigsOnly;
  set showActiveGigsOnly(bool value) {
    _showActiveGigsOnly = value;
  }

  List<String> _selectedGenres = [];
  List<String> get selectedGenres => _selectedGenres;
  set selectedGenres(List<String> value) {
    _selectedGenres = value;
  }

  void addToSelectedGenres(String value) {
    selectedGenres.add(value);
  }

  void removeFromSelectedGenres(String value) {
    selectedGenres.remove(value);
  }

  void removeAtIndexFromSelectedGenres(int index) {
    selectedGenres.removeAt(index);
  }

  void updateSelectedGenresAtIndex(
    int index,
    String Function(String) updateFn,
  ) {
    selectedGenres[index] = updateFn(_selectedGenres[index]);
  }

  void insertAtIndexInSelectedGenres(int index, String value) {
    selectedGenres.insert(index, value);
  }
}
