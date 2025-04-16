part of '../mock_map_view.dart';

class _Bottom_Sheet extends StatelessWidget {
  const _Bottom_Sheet();

  @override
  Widget build(BuildContext context) {
    return Container(
     // width: context.screenWidth,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(50),
          topRight: Radius.circular(50)
        ),
    gradient: LinearGradient(
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      colors: [
       // ConsColor.dynamicBlack.withValues(alpha: .6),
        ConsColor.blackRiverFalls.withValues(alpha: .6),
        ConsColor.blackRiverFalls.withValues(alpha: .6),
      ],
      stops: [0.0, 1.0], 
    ),
  ),
    child: Padding(
      padding: EdgeInsets.only(top: 0, left: 20, bottom: 20),
    
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _divider(),
          _title(context),
          Padding(
            padding: const EdgeInsets.symmetric(vertical:20.0),
            child: SizedBox(
              height: 198,
              width: context.screenWidth,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: dummyScooterList.length,
                itemBuilder: (context,index) => _listItem(context, dummyScooterList[index], index)
                ),
            ),
          ),
          _bottomText(context, dummyScooterList.first)
        ],
      ),
    ),
    );
  }

  _divider()
  {
    return Padding(
          padding: const EdgeInsets.symmetric(vertical:15.0),
          child: Align(
            alignment: Alignment.topCenter,
            child: Container(
              width: 50,
              height: 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
              color: Color(0xFFD2D1D1),

              ),
            ),
          ),
        );
  }

  _title(BuildContext context)
  {
    return Text("Choose Your Prefer\nScooter Type ", style: context.textThem.bodyLarge!.copyWith(color: Colors.white),);
  }

  _listItem(BuildContext context, ScooterModel data, int index)
  {
    return Padding(
      padding: EdgeInsets.only(right: 20),
      child: Container(
        padding: EdgeInsets.all(10),
        width: 148,
        height: 198,
         decoration: BoxDecoration(
      color: const Color(0x800F0F0F), // %50 opaklık için 0x80 (128/255)
      borderRadius: BorderRadius.circular(20),
      border: Border.all(
        color: index != 0 ? const Color(0x66FFFFFF): const Color(0x6600F27E), // %40 opaklık için 0x66 (102/255)
        width: 2,
      ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SizedBox(
          width: 133,
          height: 133,
          child: FittedBox(
            fit: BoxFit.fitHeight,
            child: data.image.imageWidget,
          ),
        ),
        Text(data.name, style: context.textThem.bodyMedium!.copyWith(color: Colors.white),),
        Text("Per min: \$${data.spendPerMinute.toStringAsFixed(2)}",style: context.textThem.bodySmall!.copyWith(color: Color(0xFF999696)),)
      ],
        ),
      ),
    );
  }

  _bottomText(BuildContext context,ScooterModel data)
  {
    return Padding(
      padding: const EdgeInsets.only(right:10.0),
      child: SizedBox(
        height: 50,
        child: Row(
          children: [
            Text("Nearest: ${data.distance}m" ,style:context.textThem.bodyLarge!.copyWith(color: Color(0xFF9E9E9E))),
            SizedBox(width: 10),
            Expanded(
              child: InkWell(
                onTap: ()
                {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => ScooterView(data: dummyScooterList.first)));
                },
                child: Container(
                 
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: ConsColor.turquoiseGreen),
                    borderRadius: BorderRadius.circular(50),
                    gradient: LinearGradient(
                      begin: Alignment.centerRight,
                      end: Alignment.centerLeft,
                      colors: [ConsColor.turquoiseGreen.withValues(alpha: .8), ConsColor.lexaloffleGreen])
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical:10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text("UNLOCK", style: context.textThem.bodyLarge!.copyWith(color: Colors.white),),
                        Spacer(),
                        Icon(IconEnums.arrowRight.icon, color: Colors.white, size: 30,)
                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}