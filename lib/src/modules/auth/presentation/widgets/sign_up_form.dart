import 'package:SmaTrackX/core.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.formKey,
    required this.usernameController,
    super.key,
  });

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final TextEditingController usernameController;
  final GlobalKey<FormState> formKey;

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  bool obscurePassword = true;
  bool obscureConfirmPassword = true;

  @override
  void dispose() {
    widget.usernameController.dispose();
    widget.emailController.dispose();
    widget.passwordController.dispose();
    widget.confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        children: [
          CustomTextField(
            controller: widget.usernameController,
            hintText: 'Full Name',
            keyboardType: TextInputType.name,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: widget.emailController,
            hintText: 'Email address',
            keyboardType: TextInputType.emailAddress,
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: widget.passwordController,
            hintText: 'Password',
            obscureText: obscurePassword,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscurePassword = !obscurePassword;
                });
              },
              icon: Icon(
                obscurePassword ? IconlyLight.show : IconlyLight.hide,
                color: Colors.grey,
              ),
            ),
          ),
          const SizedBox(height: 15),
          CustomTextField(
            controller: widget.confirmPasswordController,
            hintText: 'Confirm Password',
            obscureText: obscureConfirmPassword,
            keyboardType: TextInputType.visiblePassword,
            suffixIcon: IconButton(
              onPressed: () {
                setState(() {
                  obscureConfirmPassword = !obscureConfirmPassword;
                });
              },
              icon: Icon(
                obscureConfirmPassword ? IconlyLight.show : IconlyLight.hide,
                color: Colors.grey,
              ),
            ),
            overrideValidator: true,
            validator: (value) {
              if (value != widget.passwordController.text) {
                return 'Passwords do not match';
              }
              return null;
            },
          ),
        ],
      ),
    );
  }
}
