part of '../home_view.dart';

class _WSlogan extends StatelessWidget {
  const _WSlogan();

  @override
  Widget build(BuildContext context) {
    return Align(
          alignment: Alignment.bottomLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: RichText(
      text: TextSpan(
        style: DefaultTextStyle.of(context).style, // Varsayılan stil
        children: [
    TextSpan(
      text: 'Rent a ',
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        letterSpacing: .32
      ),
    ),
    TextSpan(
      text: 'E',
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
        color: ConsColor.turquoiseGreen,
        fontWeight: FontWeight.w600,
        letterSpacing: .32
    
      ),
    ),
    TextSpan(
      text: 'lectric',
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
        color: Colors.white,
        fontWeight: FontWeight.w600,
        letterSpacing: .32
    
      ),
    ),
    TextSpan(
      text: '\nScooter',
      style: Theme.of(context).textTheme.displaySmall!.copyWith(
        color: ConsColor.turquoiseGreen,
        fontWeight: FontWeight.w600,
        letterSpacing: .32
    
      ),
    ),
        ],
      ),
    ),
          ),
        );
  }
}