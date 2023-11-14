import 'package:SmaTrackX/core.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  static const routeName = '/chat';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text(
          'Chat Screen',
          style: CustomTextStyle.textBigSemiBold,
        ),
      ),
    );
  }
}
