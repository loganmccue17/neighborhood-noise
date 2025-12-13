import 'package:flutter/material.dart';
import 'flutter_flow/request_manager.dart';
import '/backend/backend.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FFAppState extends ChangeNotifier {
  static FFAppState _instance = FFAppState._internal();

  factory FFAppState() {
    return _instance;
  }

  FFAppState._internal();

  static void reset() {
    _instance = FFAppState._internal();
  }

  Future initializePersistedState() async {
    prefs = await SharedPreferences.getInstance();
    _safeInit(() {
      _filterRange = prefs.getDouble('ff_filterRange') ?? _filterRange;
    });
  }

  void update(VoidCallback callback) {
    callback();
    notifyListeners();
  }

  late SharedPreferences prefs;

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

  LatLng? _mockedLatLong = LatLng(41.4862328, -71.53067879999999);
  LatLng? get mockedLatLong => _mockedLatLong;
  set mockedLatLong(LatLng? value) {
    _mockedLatLong = value;
  }

  double _filterRange = 0.0;
  double get filterRange => _filterRange;
  set filterRange(double value) {
    _filterRange = value;
    prefs.setDouble('ff_filterRange', value);
  }

  DocumentReference? _activeBand;
  DocumentReference? get activeBand => _activeBand;
  set activeBand(DocumentReference? value) {
    _activeBand = value;
  }

  final _mapQueryManager = StreamRequestManager<List<BandsRecord>>();
  Stream<List<BandsRecord>> mapQuery({
    String? uniqueQueryKey,
    bool? overrideCache,
    required Stream<List<BandsRecord>> Function() requestFn,
  }) =>
      _mapQueryManager.performRequest(
        uniqueQueryKey: uniqueQueryKey,
        overrideCache: overrideCache,
        requestFn: requestFn,
      );
  void clearMapQueryCache() => _mapQueryManager.clear();
  void clearMapQueryCacheKey(String? uniqueKey) =>
      _mapQueryManager.clearRequest(uniqueKey);
}

void _safeInit(Function() initializeField) {
  try {
    initializeField();
  } catch (_) {}
}

Future _safeInitAsync(Function() initializeField) async {
  try {
    await initializeField();
  } catch (_) {}
}
