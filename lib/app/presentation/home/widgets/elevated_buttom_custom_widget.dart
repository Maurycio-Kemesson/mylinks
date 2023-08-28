import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mylinks/app/presentation/home/cubit/link_button_cubit.dart';

class ElevatedButtomCustom extends StatelessWidget {
  final String title;
  final String pathIcon;
  final double height;
  final Uri url;

  const ElevatedButtomCustom({
    super.key,
    required this.title,
    required this.pathIcon,
    required this.height,
    required this.url,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: ElevatedButton.icon(
        onPressed: () async {
          context.read<LinkButtonBloc>().openLink(url);
        },
        label: Text(
          title,
          style: const TextStyle(
              color: Color(0xff3f8a9e), fontWeight: FontWeight.bold),
        ),
        icon: SvgPicture.asset(
          pathIcon,
          theme: const SvgTheme(currentColor: Colors.green),
        ),
        style: ButtonStyle(
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          textStyle: MaterialStateProperty.all<TextStyle>(
            const TextStyle(
              fontSize: 15,
            ),
          ),
          fixedSize: MaterialStateProperty.all<Size>(
            Size(
              height * 0.9,
              height * 0.065,
            ),
          ),
          minimumSize: const MaterialStatePropertyAll<Size>(Size(400, 50)),
          elevation: MaterialStateProperty.all<double>(2),
          alignment: Alignment.centerLeft,
        ),
      ),
    );
  }
}
