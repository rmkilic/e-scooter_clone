
part of '../scooter_view.dart';
class _PriceBottomSheet extends StatelessWidget {
  const _PriceBottomSheet({required this.data});
  final ScooterModel data;

  @override
  Widget build(BuildContext context) {
    return Container(  
      height: 164,                          
      width: context.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
        color: ConsColor.blackRiverFalls
      ),
      child: Padding(
            padding: const EdgeInsets.all(20.0),

        child: Column(
          children: [
            _perMinute(context),
            SizedBox(height: 20,),
            _unlock(context)
          ],
        ),
      ),
    );
  }

  _perMinute(BuildContext context)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
        children: [
            Icon(IconEnums.payment.icon, color: Colors.white, size: 25,),
        SizedBox(width: 20,),
          RichText(
            text: TextSpan(
              style:Theme.of(context).textTheme.titleSmall, // Varsayılan stil
              children: [
          TextSpan(
            text: "\$${data.spendPerMinute} per "
          ),
          TextSpan(
            text: 'MIN',
            style: TextStyle(
              color: ConsColor.carnival    
            ),
          ),
    
              ],
            ),
          ),
        ],
        ),
        Container(
        width: 35, height: 35,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.red,
          boxShadow: [
            BoxShadow(
              color: Colors.black26,
              offset: Offset(0, 0),
              spreadRadius: 1,
              blurRadius: 4
            )
          ]
        ),
        child: Center(child: Icon(IconEnums.favorite.icon, color: data.favorite ? Colors.black : Colors.white, size: 25,)),
        )
      ],
    );
  }


  _unlock(BuildContext context)
  {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: [
            Text("Unlock fee", style: context.textThem.titleSmall!.copyWith(color: ConsColor.dustToDust),),
            SizedBox(height: 10,),
            Text("\$${data.price.toStringAsFixed(2)}",style: context.textThem.titleLarge!.copyWith(color: ConsColor.turquoiseGreen), )
          ],
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(width: 3, color: ConsColor.turquoiseGreen),
            borderRadius: BorderRadius.circular(50),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [ConsColor.turquoiseGreen.withValues(alpha: .8), ConsColor.lexaloffleGreen])
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 36.0, vertical:12.0),
            child: Text("Unlock", style: context.textThem.titleLarge,),
          ),
        )
      ],
    );
  }
}