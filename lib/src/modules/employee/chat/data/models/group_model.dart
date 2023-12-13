import 'package:smatrackx/core.dart';

class GroupModel extends GroupEntity {
  const GroupModel({
    required super.id,
    required super.name,
    required super.members,
    required super.groupId,
    super.lastMessage,
    super.lastMessageSenderName,
    super.lastMessageTimestamp,
    super.groupImageUrl,
  });

  GroupModel.empty()
      : this(
          id: '',
          name: '',
          members: const [],
          lastMessage: '',
          groupId: '',
          groupImageUrl: '',
          lastMessageSenderName: '',
          // lastMessageTimestamp: DateTime.now(),
          lastMessageTimestamp: DateTime.now().toString(),
        );

  GroupModel.fromMap(Map<String, dynamic> map)
      : this(
          id: map['company_id'] as String,
          name: map['name'] as String,
          groupId: map['id'] as String,
          members: List<String>.from(map['members'] as List<dynamic>),
          // OR
          // members: (map['members'] as List<dynamic>).cast<String>(),
          // OR
          // members: (map['members'] as List<dynamic>).map((e) => e as String)
          // .toList(),
          lastMessage: map['last_message'] as String?,
          lastMessageSenderName: map['last_message_sender_name'] as String?,
          lastMessageTimestamp:
              // (map['last_message_timestamp'] as Timestamp?)?.toDate(),
              (map['last_message_timestamp'] as String?),
          groupImageUrl: map['group_image_url'] as String?,
        );

  GroupModel copyWith({
    String? id,
    String? name,
    String? groupId,
    List<String>? members,
    // DateTime? lastMessageTimestamp,
    String? lastMessageTimestamp,
    String? lastMessageSenderName,
    String? lastMessage,
    String? groupImageUrl,
  }) {
    return GroupModel(
      id: id ?? this.id,
      name: name ?? this.name,
      groupId: groupId ?? this.groupId,
      members: members ?? this.members,
      lastMessage: lastMessage ?? this.lastMessage,
      lastMessageSenderName:
          lastMessageSenderName ?? this.lastMessageSenderName,
      lastMessageTimestamp: lastMessageTimestamp ?? this.lastMessageTimestamp,
      groupImageUrl: groupImageUrl ?? this.groupImageUrl,
    );
  }

  DataMap toMap() {
    return {
      'company_id': id,
      'id': groupId,
      'name': name,
      'members': members,
      'last_message': lastMessage,
      'last_message_sender_name': lastMessageSenderName,
      'last_message_timestamp':
          lastMessage == null ? null : FieldValue.serverTimestamp(),
      'group_image_url': groupImageUrl,
    };
  }
}
