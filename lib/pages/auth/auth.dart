import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:sheff_new/data/repo/auth_repository.dart';
import 'package:sheff_new/data/repo/cart_repository.dart';
import 'package:sheff_new/pages/auth/bloc/auth_bloc.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController usernameController =
      TextEditingController(text: "test@gmail.com");
  final TextEditingController passwordController =
      TextEditingController(text: "123456");

  // bool isLogin = true;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalizations.of(context)!;
    final ThemeData themeData = Theme.of(context);
    return Theme(
      data: themeData.copyWith(
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all(
                Size(MediaQuery.of(context).size.width - 56, 50),
              ),
              backgroundColor:
                  MaterialStateProperty.all<Color>(themeData.primaryColor),
              shape: MaterialStateProperty.all(RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(40))),
            ),
          ),
          snackBarTheme: SnackBarThemeData(
            backgroundColor: themeData.colorScheme.primary,
          ),
          inputDecorationTheme: InputDecorationTheme(
            enabledBorder: OutlineInputBorder(
                borderSide:
                    BorderSide(width: 2, color: themeData.primaryColor)),
            labelStyle: themeData.textTheme.subtitle2,
            fillColor: const Color(0xFFFBE9E7),
            filled: true,
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: themeData.primaryColor,
                width: 2,
              ),
            ),
            contentPadding: const EdgeInsets.all(13),
            border: const OutlineInputBorder(),
          )),
      child: Scaffold(
        body: BlocProvider<AuthBloc>(
          create: (context) {
            final bloc =
                AuthBloc(authRepository, cartRepository);
            bloc.stream.forEach((state) {
              if (state is AuthSuccess) {
                Navigator.of(context).pop();
              } else if (state is AuthError) {
                ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(state.exception.message)));
              }
            });
            bloc.add(AuthStarted());
            return bloc;
          },
          child: SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(28, 50, 28, 0),
                child: BlocBuilder<AuthBloc, AuthState>(
                  buildWhen: ((previous, current) =>
                      current is AuthLoading ||
                      current is AuthInitial ||
                      current is AuthError),
                  builder: (context, state) {
                    return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            state.isLoginMode
                                ? localization.login
                                : localization.signUp,
                            style: themeData.textTheme.headline4,
                          ),
                          const SizedBox(height: 35),
                          state.isLoginMode
                              ? signIn(themeData, context)
                              : signUp(themeData, context),
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              _forgot(context, themeData),
                            ],
                          ),
                          const SizedBox(height: 30),
                          ElevatedButton(
                            onPressed: () async {
                              BlocProvider.of<AuthBloc>(context).add(
                                  AuthButtonIsClicked(usernameController.text,
                                      passwordController.text));
                            },
                            child: state is AuthLoading
                                ? const SizedBox(
                                    height: 20,
                                    width: 20,
                                    child: CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation<Color>(
                                          Colors.white),
                                    ))
                                : Text(
                                    state.isLoginMode
                                        ? localization.login
                                        : localization.signUp,
                                    style: themeData.textTheme.headline6,
                                  ),

                            // Navigator.of(context, rootNavigator: true).push(
                            //     MaterialPageRoute(
                            //         builder: (context) =>
                            //             const RootScreen()));},
                          ),
                          const SizedBox(height: 25),
                          GestureDetector(
                            onTap: () {
                              BlocProvider.of<AuthBloc>(context)
                                  .add(AuthModeChangeIsClicked());
                            },
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.isLoginMode
                                      ? localization.not
                                      : localization.have,
                                  style: themeData.textTheme.bodyText1!
                                      .apply(color: Colors.black87),
                                ),
                                Text(
                                  state.isLoginMode
                                      ? localization.signUp
                                      : localization.login,
                                  style: themeData.textTheme.bodyText1!
                                      .copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: themeData.primaryColor),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 20),
                          Row(children: [
                            const Expanded(child: Divider(thickness: 2)),
                            const SizedBox(width: 10),
                            Text(
                              localization.or,
                              style: themeData.textTheme.subtitle1!
                                  .apply(color: Colors.black87),
                            ),
                            const SizedBox(width: 10),
                            const Expanded(child: Divider(thickness: 2)),
                          ]),
                          const SizedBox(height: 20),
                          Text(
                            localization.orWith,
                            style: themeData.textTheme.subtitle1!
                                .copyWith(fontWeight: FontWeight.w500),
                          ),
                          const SizedBox(height: 30),
                          svg(),
                        ]);
                  },
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Column signUp(ThemeData themeData, BuildContext context) {
    return Column(
      children: [
        _first(themeData, context),
        const SizedBox(height: 13),
        _last(themeData, context),
        const SizedBox(height: 13),
        _email(themeData, context),
        const SizedBox(height: 13),
        Password(controller: passwordController),
      ],
    );
  }

  Column signIn(ThemeData themeData, BuildContext context) {
    return Column(
      children: [
        _email(themeData, context),
        const SizedBox(height: 13),
        Password(controller: passwordController),
      ],
    );
  }

  Row svg() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'assets/svg/telegram_svg.png',
          width: 20,
          height: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          'assets/svg/facebook_svg.png',
          width: 20,
          height: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          'assets/svg/google_svg.png',
          width: 20,
          height: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          'assets/svg/linkedin_svg.png',
          width: 20,
          height: 20,
        ),
        const SizedBox(
          width: 10,
        ),
        Image.asset(
          'assets/svg/twitter.png',
          width: 20,
          height: 20,
        ),
      ],
    );
  }

  Widget _forgot(BuildContext context, ThemeData themeData) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        InkWell(
          onTap: () {},
          child: Text(
            AppLocalizations.of(context)!.forgot,
            style: themeData.textTheme.bodyText2,
          ),
        ),
      ],
    );
  }

  Widget _last(ThemeData themeData, BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        cursorColor: themeData.primaryColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeData.primaryColor, width: 2)),
          border: const OutlineInputBorder(),
          labelStyle: themeData.textTheme.subtitle2,
          labelText: AppLocalizations.of(context)!.last,
        ),
      ),
    );
  }

  Widget _first(ThemeData themeData, BuildContext context) {
    return SizedBox(
      height: 50,
      child: TextField(
        cursorColor: themeData.primaryColor,
        decoration: InputDecoration(
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: themeData.primaryColor, width: 2)),
          border: const OutlineInputBorder(),
          labelStyle: themeData.textTheme.subtitle2,
          labelText: AppLocalizations.of(context)!.first,
        ),
      ),
    );
  }

  Widget _email(ThemeData themeData, BuildContext context) {
    return TextField(
      controller: usernameController,
      cursorColor: themeData.primaryColor,
      keyboardType: TextInputType.emailAddress,
      decoration: InputDecoration(
        labelText: AppLocalizations.of(context)!.email,
      ),
    );
  }
}

class Password extends StatefulWidget {
  const Password({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    final ThemeData themeData = Theme.of(context);
    return TextField(
      controller: widget.controller,
      cursorColor: themeData.primaryColor,
      keyboardType: TextInputType.phone,
      obscureText: obscureText,
      enableSuggestions: false,
      autocorrect: false,
      decoration: InputDecoration(
          labelText: AppLocalizations.of(context)!.password,
          suffixIcon: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            icon: Icon(
              obscureText
                  ? Icons.visibility_outlined
                  : Icons.visibility_off_outlined,
              color: Colors.black45.withOpacity(0.4),
            ),
          )),
    );
  }
}
