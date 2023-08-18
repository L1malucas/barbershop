import 'package:barbershop/src/core/ui/contants.dart';
import 'package:barbershop/src/core/ui/helpers/form_helper.dart';
import 'package:barbershop/src/core/ui/widgets/fixed_spacer.dart';
import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final emailEC = TextEditingController();
  final passwordEC = TextEditingController();

  @override
  void dispose() {
    emailEC.dispose();
    passwordEC.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: DecoratedBox(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                'assets/images/background_image_chair.jpg',
              ),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(ImageConstants.imageLogo),
                          FixedSpacer.vSmall,
                          TextFormField(
                            controller: emailEC,
                            onTapOutside: (_) => unfocus(context),
                            validator: Validatorless.multiple([
                              Validatorless.required('Email obrigatório'),
                              Validatorless.email('Email inválido')
                            ]),
                            decoration: const InputDecoration(
                              label: Text('Email'),
                              hintText: 'Digite seu email',
                              hintStyle: TextStyle(color: ColorsContants.black),
                              labelStyle:
                                  TextStyle(color: ColorsContants.black),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                          ),
                          FixedSpacer.vSmall,
                          TextFormField(
                            controller: passwordEC,
                            onTapOutside: (_) => unfocus(context),
                            obscureText: true,
                            validator: Validatorless.multiple([
                              Validatorless.required('Senha obrigatória '),
                              Validatorless.min(
                                  6, 'Senha deve conter mais de 6 caracteres')
                            ]),
                            decoration: const InputDecoration(
                              label: Text('Senha'),
                              hintText: 'Digite sua senha',
                              hintStyle: TextStyle(color: ColorsContants.black),
                              labelStyle:
                                  TextStyle(color: ColorsContants.black),
                              floatingLabelBehavior:
                                  FloatingLabelBehavior.never,
                            ),
                          ),
                          FixedSpacer.vSmaller,
                          const Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              "Esqueceu a senha?",
                              style: TextStyle(color: ColorsContants.brown),
                            ),
                          ),
                          FixedSpacer.vSmall,
                          ElevatedButton(
                            onPressed: () {},
                            style: ElevatedButton.styleFrom(
                                minimumSize: const Size.fromHeight(56)),
                            child: const Text('ACESSAR'),
                          )
                        ],
                      ),
                      const Align(
                        alignment: Alignment.bottomCenter,
                        child: Text(
                          'Criar conta',
                          style: TextStyle(
                              color: ColorsContants.white,
                              fontWeight: FontWeight.w500,
                              fontSize: 16),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
