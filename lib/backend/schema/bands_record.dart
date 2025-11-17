import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class BandsRecord extends FirestoreRecord {
  BandsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "bandName" field.
  String? _bandName;
  String get bandName => _bandName ?? '';
  bool hasBandName() => _bandName != null;

  // "bandMembers" field.
  List<DocumentReference>? _bandMembers;
  List<DocumentReference> get bandMembers => _bandMembers ?? const [];
  bool hasBandMembers() => _bandMembers != null;

  // "posts" field.
  List<DocumentReference>? _posts;
  List<DocumentReference> get posts => _posts ?? const [];
  bool hasPosts() => _posts != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  // "genre" field.
  String? _genre;
  String get genre => _genre ?? '';
  bool hasGenre() => _genre != null;

  // "bandPhotoUrl" field.
  String? _bandPhotoUrl;
  String get bandPhotoUrl => _bandPhotoUrl ?? '';
  bool hasBandPhotoUrl() => _bandPhotoUrl != null;

  // "gigs" field.
  List<DocumentReference>? _gigs;
  List<DocumentReference> get gigs => _gigs ?? const [];
  bool hasGigs() => _gigs != null;

  // "hasActiveGigs" field.
  bool? _hasActiveGigs;
  bool get hasActiveGigs => _hasActiveGigs ?? false;
  bool hasHasActiveGigs() => _hasActiveGigs != null;

  // "genreKeywords" field.
  List<String>? _genreKeywords;
  List<String> get genreKeywords => _genreKeywords ?? const [];
  bool hasGenreKeywords() => _genreKeywords != null;

  void _initializeFields() {
    _bandName = snapshotData['bandName'] as String?;
    _bandMembers = getDataList(snapshotData['bandMembers']);
    _posts = getDataList(snapshotData['posts']);
    _location = snapshotData['location'] as String?;
    _genre = snapshotData['genre'] as String?;
    _bandPhotoUrl = snapshotData['bandPhotoUrl'] as String?;
    _gigs = getDataList(snapshotData['gigs']);
    _hasActiveGigs = snapshotData['hasActiveGigs'] as bool?;
    _genreKeywords = getDataList(snapshotData['genreKeywords']);
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('bands');

  static Stream<BandsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => BandsRecord.fromSnapshot(s));

  static Future<BandsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => BandsRecord.fromSnapshot(s));

  static BandsRecord fromSnapshot(DocumentSnapshot snapshot) => BandsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static BandsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      BandsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'BandsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is BandsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createBandsRecordData({
  String? bandName,
  String? location,
  String? genre,
  String? bandPhotoUrl,
  bool? hasActiveGigs,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'bandName': bandName,
      'location': location,
      'genre': genre,
      'bandPhotoUrl': bandPhotoUrl,
      'hasActiveGigs': hasActiveGigs,
    }.withoutNulls,
  );

  return firestoreData;
}

class BandsRecordDocumentEquality implements Equality<BandsRecord> {
  const BandsRecordDocumentEquality();

  @override
  bool equals(BandsRecord? e1, BandsRecord? e2) {
    const listEquality = ListEquality();
    return e1?.bandName == e2?.bandName &&
        listEquality.equals(e1?.bandMembers, e2?.bandMembers) &&
        listEquality.equals(e1?.posts, e2?.posts) &&
        e1?.location == e2?.location &&
        e1?.genre == e2?.genre &&
        e1?.bandPhotoUrl == e2?.bandPhotoUrl &&
        listEquality.equals(e1?.gigs, e2?.gigs) &&
        e1?.hasActiveGigs == e2?.hasActiveGigs &&
        listEquality.equals(e1?.genreKeywords, e2?.genreKeywords);
  }

  @override
  int hash(BandsRecord? e) => const ListEquality().hash([
        e?.bandName,
        e?.bandMembers,
        e?.posts,
        e?.location,
        e?.genre,
        e?.bandPhotoUrl,
        e?.gigs,
        e?.hasActiveGigs,
        e?.genreKeywords
      ]);

  @override
  bool isValidKey(Object? o) => o is BandsRecord;
}
