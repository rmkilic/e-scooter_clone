part of '../home_view.dart';


class _WImage extends StatelessWidget {
  const _WImage();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 1.19,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: ImageEnums.matteBlack.imageWidget,
            
          ),
        );
  }
}