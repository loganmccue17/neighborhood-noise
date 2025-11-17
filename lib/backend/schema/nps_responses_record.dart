import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class NpsResponsesRecord extends FirestoreRecord {
  NpsResponsesRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "logCount" field.
  int? _logCount;
  int get logCount => _logCount ?? 0;
  bool hasLogCount() => _logCount != null;

  // "NPSData" field.
  int? _nPSData;
  int get nPSData => _nPSData ?? 0;
  bool hasNPSData() => _nPSData != null;

  // "NPS_String" field.
  String? _nPSString;
  String get nPSString => _nPSString ?? '';
  bool hasNPSString() => _nPSString != null;

  // "npsGatePassed" field.
  bool? _npsGatePassed;
  bool get npsGatePassed => _npsGatePassed ?? false;
  bool hasNpsGatePassed() => _npsGatePassed != null;

  void _initializeFields() {
    _logCount = castToType<int>(snapshotData['logCount']);
    _nPSData = castToType<int>(snapshotData['NPSData']);
    _nPSString = snapshotData['NPS_String'] as String?;
    _npsGatePassed = snapshotData['npsGatePassed'] as bool?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('nps_responses');

  static Stream<NpsResponsesRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => NpsResponsesRecord.fromSnapshot(s));

  static Future<NpsResponsesRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => NpsResponsesRecord.fromSnapshot(s));

  static NpsResponsesRecord fromSnapshot(DocumentSnapshot snapshot) =>
      NpsResponsesRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static NpsResponsesRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      NpsResponsesRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'NpsResponsesRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is NpsResponsesRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createNpsResponsesRecordData({
  int? logCount,
  int? nPSData,
  String? nPSString,
  bool? npsGatePassed,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'logCount': logCount,
      'NPSData': nPSData,
      'NPS_String': nPSString,
      'npsGatePassed': npsGatePassed,
    }.withoutNulls,
  );

  return firestoreData;
}

class NpsResponsesRecordDocumentEquality
    implements Equality<NpsResponsesRecord> {
  const NpsResponsesRecordDocumentEquality();

  @override
  bool equals(NpsResponsesRecord? e1, NpsResponsesRecord? e2) {
    return e1?.logCount == e2?.logCount &&
        e1?.nPSData == e2?.nPSData &&
        e1?.nPSString == e2?.nPSString &&
        e1?.npsGatePassed == e2?.npsGatePassed;
  }

  @override
  int hash(NpsResponsesRecord? e) => const ListEquality()
      .hash([e?.logCount, e?.nPSData, e?.nPSString, e?.npsGatePassed]);

  @override
  bool isValidKey(Object? o) => o is NpsResponsesRecord;
}
