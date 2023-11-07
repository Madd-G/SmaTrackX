// ignore_for_file: camel_case_types, prefer_typing_uninitialized_variables

import 'package:SmaTrackX/core.dart';

class DangerButton extends StatelessWidget {
  final String label;
  final IconData? icon;
  final Function onPressed;
  final bool enabled;

  const DangerButton({
    Key? key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.enabled = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.width,
      height: 50,
      child: ElevatedButton.icon(
        icon: Icon(
          icon,
          color: Colors.white,
        ),
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: !enabled ? Colors.grey : Colors.red,
          shape: const StadiumBorder(),
        ),
        onPressed: () {
          if (enabled) onPressed();
        },
      ),
    );
  }
}
