import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mylinks/app/presentation/home/cubit/link_button_cubit.dart';
import 'package:mylinks/app/presentation/home/cubit/link_button_state.dart';
import 'package:mylinks/app/presentation/home/widgets/elevated_buttom_custom_widget.dart';
import 'package:mylinks/app/shared/utils/uris.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        color: const Color(0xff011c26),
        child: ListView(
          children: <Widget>[
            Padding(
              padding:
                  EdgeInsets.only(top: height * 0.05, bottom: height * 0.02),
              child: CircleAvatar(
                backgroundColor: const Color(0xffbacf3c),
                radius: 60,
                child: CircleAvatar(
                  backgroundImage: Image.asset(
                    'assets/images/perfil-instagram.png',
                  ).image,
                  radius: 58,
                ),
              ),
            ),
            Text(
              "Maurycio Kemesson".toUpperCase(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                color: Color(0xffbacf3c),
              ),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding:
                  EdgeInsets.only(top: height * 0.01, bottom: height * 0.04),
              child: const Text(
                "Desenvolvedor Mobile e Criador de Conteúdo",
                style: TextStyle(fontSize: 14, color: Color(0xffbacf3c)),
                textAlign: TextAlign.center,
              ),
            ),
            BlocConsumer<LinkButtonBloc, LinkButtonState>(
              listener: (context, state) {
                if (state is ErrorLinkButton) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.erroMessage),
                      backgroundColor: Colors.red,
                    ),
                  );
                }
              },
              builder: (context, state) {
                return _buttonsLiks(height: height);
              },
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Image.asset(
                'assets/images/logo.png',
                width: 100,
                height: 100,
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buttonsLiks({required double height}) {
    return Column(
      children: [
        ElevatedButtomCustom(
            title: "Veja meus contéudos sobre programação mobile",
            pathIcon: 'assets/icons/instagram.svg',
            height: height,
            url: instagramLaunchUri),
        ElevatedButtomCustom(
          title: "Siga-me no GitHub",
          pathIcon: 'assets/icons/github.svg',
          height: height,
          url: gitHubLaunchUri,
        ),
        ElevatedButtomCustom(
          title: "Conecte-se comigo no LinkedIn",
          pathIcon: 'assets/icons/linkedin.svg',
          height: height,
          url: linkedinLauncgUri,
        ),
        ElevatedButtomCustom(
          title: "Siga-me no Medium",
          pathIcon: 'assets/icons/medium.svg',
          height: height,
          url: mediumLauncgUri,
        ),
      ],
    );
  }
}
