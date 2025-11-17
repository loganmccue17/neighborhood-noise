import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class GigsRecord extends FirestoreRecord {
  GigsRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "band_posted" field.
  DocumentReference? _bandPosted;
  DocumentReference? get bandPosted => _bandPosted;
  bool hasBandPosted() => _bandPosted != null;

  // "description" field.
  String? _description;
  String get description => _description ?? '';
  bool hasDescription() => _description != null;

  // "location" field.
  LatLng? _location;
  LatLng? get location => _location;
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _bandPosted = snapshotData['band_posted'] as DocumentReference?;
    _description = snapshotData['description'] as String?;
    _location = snapshotData['location'] as LatLng?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('gigs');

  static Stream<GigsRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => GigsRecord.fromSnapshot(s));

  static Future<GigsRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => GigsRecord.fromSnapshot(s));

  static GigsRecord fromSnapshot(DocumentSnapshot snapshot) => GigsRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static GigsRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      GigsRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'GigsRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is GigsRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createGigsRecordData({
  DocumentReference? bandPosted,
  String? description,
  LatLng? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'band_posted': bandPosted,
      'description': description,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class GigsRecordDocumentEquality implements Equality<GigsRecord> {
  const GigsRecordDocumentEquality();

  @override
  bool equals(GigsRecord? e1, GigsRecord? e2) {
    return e1?.bandPosted == e2?.bandPosted &&
        e1?.description == e2?.description &&
        e1?.location == e2?.location;
  }

  @override
  int hash(GigsRecord? e) =>
      const ListEquality().hash([e?.bandPosted, e?.description, e?.location]);

  @override
  bool isValidKey(Object? o) => o is GigsRecord;
}
