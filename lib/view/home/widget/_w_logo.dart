part of '../home_view.dart';

class _WLogo extends StatelessWidget {
  const _WLogo();

  @override
  Widget build(BuildContext context) {
    return SizedBox(      
      height: 52,
      child: Center(
        child: ImageEnums.logo.imageWidget,
      ),
    );
  }
}