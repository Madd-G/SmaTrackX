import 'package:smatrackx/core.dart';

class MessageBubble extends StatefulWidget {
  const MessageBubble(this.message, {super.key});

  final Message message;

  @override
  State<MessageBubble> createState() => _MessageBubbleState();
}

class _MessageBubbleState extends State<MessageBubble> {
  UserEntity? user;

  @override
  Widget build(BuildContext context) {
    var user = context.currentUser;
    bool isCurrentUser = widget.message.senderId == context.currentUser!.uid;
    return BlocListener<ChatCubit, ChatState>(
      listener: (_, state) {
        if (state is UserFound && user == null) {
          setState(() {
            user = state.user;
          });
        }
      },
      child: Container(
        constraints: BoxConstraints(maxWidth: context.width - 45),
        margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
        child: Column(
          crossAxisAlignment:
              isCurrentUser ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            if (!isCurrentUser)
              Row(
                children: [
                  CircleAvatar(
                    radius: 16,
                    backgroundImage: NetworkImage(
                      user == null || (user.profilePicture == null)
                          ? kDefaultAvatar
                          : user.profilePicture!,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Text(
                    user == null ? 'Unknown User' : user.username,
                  ),
                ],
              ),
            Container(
              margin: EdgeInsets.only(top: 4, left: isCurrentUser ? 0 : 20),
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: isCurrentUser
                    ? AppColors.primaryColor
                    : AppColors.secondaryColor,
              ),
              child: Text(
                widget.message.message,
                style: TextStyle(
                  color: isCurrentUser ? AppColors.whiteColor : Colors.black,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
