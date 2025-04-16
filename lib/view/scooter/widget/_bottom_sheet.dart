part of '../scooter_view.dart';

class _BottomSheet extends StatelessWidget {
  const _BottomSheet({required this.data});
  final ScooterModel data;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 440,
      width: context.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50)
        ),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
        ConsColor.dynamicBlack.withValues(alpha: .6),
        ConsColor.blackRiverFalls.withValues(alpha: .6)
      ],
      stops: [0.0, 1.0], 
    ),
  ),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:20.0, horizontal: 16),
                    child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal:9.0, vertical: 5.0),
                          child: Text(data.name,style: Theme.of(context).textTheme.titleLarge!.copyWith(color: Colors.white),),
                        ),
                        Padding(padding: EdgeInsets.symmetric(vertical: 16),
                          child: Text(data.description,
                          style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w400),),
                        
                        ),
                        _Display(leftIcon: IconEnums.battery.icon, leftValue: "${data.charge}%", rightIcon: IconEnums.speed.icon, rightValue: "${data.speed}km/h"),     
                        _Display(leftIcon: IconEnums.locationArrow.icon, leftValue: "${data.distance}m", rightIcon: IconEnums.road.icon, rightValue: "${data.road}km")

                       
                  
                        
                        
                      ],
                    ),
                  ),
                  _PriceBottomSheet(data: data,)
                ],
              )
              
            );
  }
}

class _Display extends StatelessWidget {
  const _Display({required this.leftIcon, required this.leftValue, required this.rightIcon, required this.rightValue});
  final IconData leftIcon;
  final String leftValue;
  final IconData rightIcon;
  final String rightValue;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:15.0),
      child: Row(
            children: [
              _DisplayValue(icon: leftIcon, value: leftValue),
              _DisplayValue(icon: rightIcon, value: rightValue)
              
              
            ],
          ),
    );
  }
}

class _DisplayValue extends StatelessWidget {
  const _DisplayValue({required this.icon, required this.value});
  final IconData icon;
  final String value;

  @override
  Widget build(BuildContext context) {
    return Expanded(
          child: Row(
            children: [
              Icon(icon, size: 25, color: Colors.white,),
              SizedBox(width: 18,),
              Text(value,
            style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.w600),),
            ],
          ),
        );
  }
}