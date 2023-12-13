import 'package:SmaTrackX/core.dart';

class UserModel extends UserEntity {
  const UserModel({
    required super.uid,
    required super.email,
    required super.username,
    super.profilePicture,
    super.role,
    super.bio,
    super.workStart,
    super.workEnd,
    super.created,
    super.companyId,
    super.groupIds,
  });

  const UserModel.empty()
      : this(
          uid: '',
          email: '',
          username: '',
          profilePicture: '',
          role: '',
          bio: '',
          workStart: '',
          workEnd: '',
          created: '',
          companyId: '',
        );

  UserModel.fromMap(DataMap map)
      : super(
          uid: map['uid'] as String,
          email: map['email'] as String,
          username: map['username'] as String,
          profilePicture: map['profile_picture'] as String?,
          role: map['role'] as String,
          bio: map['bio'] as String?,
          workStart: map['work_start'] as String?,
          workEnd: map['work_end'] as String?,
          created: map['created'] as String?,
          companyId: map['company_id'] as String?,
          groupIds: (map['groups'] as List<dynamic>).cast<String>(),
        );

  UserModel copyWith({
    String? uid,
    String? email,
    String? profilePicture,
    String? role,
    String? bio,
    String? username,
    String? workStart,
    String? workEnd,
    String? created,
    String? companyId,
    List<String>? groupIds,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      profilePicture: profilePicture ?? this.profilePicture,
      role: role ?? this.role,
      bio: bio ?? this.bio,
      username: username ?? this.username,
      workStart: workStart ?? this.workStart,
      workEnd: workEnd ?? this.workEnd,
      created: created ?? this.created,
      companyId: companyId ?? this.companyId,
      groupIds: groupIds ?? this.groupIds,
    );
  }

  DataMap toMap() {
    return {
      'uid': uid,
      'email': email,
      'username': username,
      'profile_picture': profilePicture,
      'work_start': workStart,
      'work_end': workEnd,
      'role': role,
      'bio': bio,
      'created': created,
      'company_id': companyId,
      'groupIds': groupIds,
    };
  }
}
