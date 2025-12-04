import 'dart:async';

import 'package:collection/collection.dart';

import '/backend/schema/util/firestore_util.dart';
import '/backend/schema/util/schema_util.dart';

import 'index.dart';
import '/flutter_flow/flutter_flow_util.dart';

class UsersRecord extends FirestoreRecord {
  UsersRecord._(
    DocumentReference reference,
    Map<String, dynamic> data,
  ) : super(reference, data) {
    _initializeFields();
  }

  // "email" field.
  String? _email;
  String get email => _email ?? '';
  bool hasEmail() => _email != null;

  // "display_name" field.
  String? _displayName;
  String get displayName => _displayName ?? '';
  bool hasDisplayName() => _displayName != null;

  // "photo_url" field.
  String? _photoUrl;
  String get photoUrl => _photoUrl ?? '';
  bool hasPhotoUrl() => _photoUrl != null;

  // "uid" field.
  String? _uid;
  String get uid => _uid ?? '';
  bool hasUid() => _uid != null;

  // "created_time" field.
  DateTime? _createdTime;
  DateTime? get createdTime => _createdTime;
  bool hasCreatedTime() => _createdTime != null;

  // "phone_number" field.
  String? _phoneNumber;
  String get phoneNumber => _phoneNumber ?? '';
  bool hasPhoneNumber() => _phoneNumber != null;

  // "loginCount" field.
  int? _loginCount;
  int get loginCount => _loginCount ?? 0;
  bool hasLoginCount() => _loginCount != null;

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

  // "profile_refrence" field.
  DocumentReference? _profileRefrence;
  DocumentReference? get profileRefrence => _profileRefrence;
  bool hasProfileRefrence() => _profileRefrence != null;

  // "hasBand" field.
  bool? _hasBand;
  bool get hasBand => _hasBand ?? false;
  bool hasHasBand() => _hasBand != null;

  // "user_band" field.
  DocumentReference? _userBand;
  DocumentReference? get userBand => _userBand;
  bool hasUserBand() => _userBand != null;

  // "liked_posts" field.
  List<DocumentReference>? _likedPosts;
  List<DocumentReference> get likedPosts => _likedPosts ?? const [];
  bool hasLikedPosts() => _likedPosts != null;

  // "followedbands" field.
  List<DocumentReference>? _followedbands;
  List<DocumentReference> get followedbands => _followedbands ?? const [];
  bool hasFollowedbands() => _followedbands != null;

  // "user_instrument" field.
  String? _userInstrument;
  String get userInstrument => _userInstrument ?? '';
  bool hasUserInstrument() => _userInstrument != null;

  void _initializeFields() {
    _email = snapshotData['email'] as String?;
    _displayName = snapshotData['display_name'] as String?;
    _photoUrl = snapshotData['photo_url'] as String?;
    _uid = snapshotData['uid'] as String?;
    _createdTime = snapshotData['created_time'] as DateTime?;
    _phoneNumber = snapshotData['phone_number'] as String?;
    _loginCount = castToType<int>(snapshotData['loginCount']);
    _nPSData = castToType<int>(snapshotData['NPSData']);
    _nPSString = snapshotData['NPS_String'] as String?;
    _npsGatePassed = snapshotData['npsGatePassed'] as bool?;
    _profileRefrence = snapshotData['profile_refrence'] as DocumentReference?;
    _hasBand = snapshotData['hasBand'] as bool?;
    _userBand = snapshotData['user_band'] as DocumentReference?;
    _likedPosts = getDataList(snapshotData['liked_posts']);
    _followedbands = getDataList(snapshotData['followedbands']);
    _userInstrument = snapshotData['user_instrument'] as String?;
  }

  static CollectionReference get collection =>
      FirebaseFirestore.instance.collection('users');

  static Stream<UsersRecord> getDocument(DocumentReference ref) =>
      ref.snapshots().map((s) => UsersRecord.fromSnapshot(s));

  static Future<UsersRecord> getDocumentOnce(DocumentReference ref) =>
      ref.get().then((s) => UsersRecord.fromSnapshot(s));

  static UsersRecord fromSnapshot(DocumentSnapshot snapshot) => UsersRecord._(
        snapshot.reference,
        mapFromFirestore(snapshot.data() as Map<String, dynamic>),
      );

  static UsersRecord getDocumentFromData(
    Map<String, dynamic> data,
    DocumentReference reference,
  ) =>
      UsersRecord._(reference, mapFromFirestore(data));

  @override
  String toString() =>
      'UsersRecord(reference: ${reference.path}, data: $snapshotData)';

  @override
  int get hashCode => reference.path.hashCode;

  @override
  bool operator ==(other) =>
      other is UsersRecord &&
      reference.path.hashCode == other.reference.path.hashCode;
}

Map<String, dynamic> createUsersRecordData({
  String? email,
  String? displayName,
  String? photoUrl,
  String? uid,
  DateTime? createdTime,
  String? phoneNumber,
  int? loginCount,
  int? nPSData,
  String? nPSString,
  bool? npsGatePassed,
  DocumentReference? profileRefrence,
  bool? hasBand,
  DocumentReference? userBand,
  String? userInstrument,
}) {
  final firestoreData = mapToFirestore(
    <String, dynamic>{
      'email': email,
      'display_name': displayName,
      'photo_url': photoUrl,
      'uid': uid,
      'created_time': createdTime,
      'phone_number': phoneNumber,
      'loginCount': loginCount,
      'NPSData': nPSData,
      'NPS_String': nPSString,
      'npsGatePassed': npsGatePassed,
      'profile_refrence': profileRefrence,
      'hasBand': hasBand,
      'user_band': userBand,
      'user_instrument': userInstrument,
    }.withoutNulls,
  );

  return firestoreData;
}

class UsersRecordDocumentEquality implements Equality<UsersRecord> {
  const UsersRecordDocumentEquality();

  @override
  bool equals(UsersRecord? e1, UsersRecord? e2) {
    const listEquality = ListEquality();
    return e1?.email == e2?.email &&
        e1?.displayName == e2?.displayName &&
        e1?.photoUrl == e2?.photoUrl &&
        e1?.uid == e2?.uid &&
        e1?.createdTime == e2?.createdTime &&
        e1?.phoneNumber == e2?.phoneNumber &&
        e1?.loginCount == e2?.loginCount &&
        e1?.nPSData == e2?.nPSData &&
        e1?.nPSString == e2?.nPSString &&
        e1?.npsGatePassed == e2?.npsGatePassed &&
        e1?.profileRefrence == e2?.profileRefrence &&
        e1?.hasBand == e2?.hasBand &&
        e1?.userBand == e2?.userBand &&
        listEquality.equals(e1?.likedPosts, e2?.likedPosts) &&
        listEquality.equals(e1?.followedbands, e2?.followedbands) &&
        e1?.userInstrument == e2?.userInstrument;
  }

  @override
  int hash(UsersRecord? e) => const ListEquality().hash([
        e?.email,
        e?.displayName,
        e?.photoUrl,
        e?.uid,
        e?.createdTime,
        e?.phoneNumber,
        e?.loginCount,
        e?.nPSData,
        e?.nPSString,
        e?.npsGatePassed,
        e?.profileRefrence,
        e?.hasBand,
        e?.userBand,
        e?.likedPosts,
        e?.followedbands,
        e?.userInstrument
      ]);

  @override
  bool isValidKey(Object? o) => o is UsersRecord;
}
