import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class ProfileDataRecord extends FirestoreRecord {
  ProfileDataRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "name" field.
  String? _name;
  String get name => _name ?? '';
  bool hasName() => _name != null;

  // "nickname" field.
  String? _nickname;
  String get nickname => _nickname ?? '';
  bool hasNickname() => _nickname != null;

  // "birthday" field.
  DateTime? _birthday;
  DateTime? get birthday => _birthday;
  bool hasBirthday() => _birthday != null;

  // "location" field.
  String? _location;
  String get location => _location ?? '';
  bool hasLocation() => _location != null;

  void _initializeFields() {
    _name = snapshotData['name'] as String?;
    _nickname = snapshotData['nickname'] as String?;
    _birthday = snapshotData['birthday'] as DateTime?;
    _location = snapshotData['location'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('ProfileData');

  static Stream<ProfileDataRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => ProfileDataRecord.fromSnapshot(s));

  static Future<ProfileDataRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => ProfileDataRecord.fromSnapshot(s));

  static ProfileDataRecord fromSnapshot(DocumentSnapshot snapshot) =>
      ProfileDataRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static ProfileDataRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      ProfileDataRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'ProfileDataRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is ProfileDataRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createProfileDataRecordData({
  String? name,
  String? nickname,
  DateTime? birthday,
  String? location,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'name': name,
      'nickname': nickname,
      'birthday': birthday,
      'location': location,
    }.withoutNulls,
  );

  return firestoreData;
}

class ProfileDataRecordDocumentEquality implements Equality<ProfileDataRecord> {
  const ProfileDataRecordDocumentEquality();

  @override
  bool equals(ProfileDataRecord? e1, ProfileDataRecord? e2) {
    return e1?.name == e2?.name &&
        e1?.nickname == e2?.nickname &&
        e1?.birthday == e2?.birthday &&
        e1?.location == e2?.location;
  }

  @override
  int hash(ProfileDataRecord? e) => const ListEquality()
      .hash([e?.name, e?.nickname, e?.birthday, e?.location]);

  @override
  bool isValidKey(Object? o) => o is ProfileDataRecord;
}
