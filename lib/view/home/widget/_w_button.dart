part of '../home_view.dart';

class _WButton extends StatelessWidget {
  const _WButton();

  @override
  Widget build(BuildContext context) {
    return Align(
            alignment: Alignment.bottomRight,
            child: InkWell(
              onTap: ()
              {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapScreen()));
              },
              child: Container(
                decoration: BoxDecoration(
                  color: ConsColor.turquoiseGreen,
                  
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    topLeft: Radius.circular(30),
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(6.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        width: 48,
                        height: 48,
                        child: Container(
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            boxShadow: [
                    BoxShadow(
                      color: Colors.yellow,
                      offset: Offset(0, 0),
                      spreadRadius: 3,
                      blurRadius: 3
                    )
                  ],
                          color: ConsColor.buttonBack,
              
                          ),
                          child: Center(child:Icon(IconEnums.arrowRight.icon , color: Colors.white, size: 24,) ,),
                        ),
                      )
                      ,
                      SizedBox(width: 10,),
                      Text("Get Started...", style: TextStyle(fontWeight: FontWeight.w600, // SemiBold
                      fontSize: 25,
                      height: 1.88, // 47 / 25
                      color: Colors.white,
                      letterSpacing: 0.32,),)
                    ],
                  ),
                ),
              ),
            ),
          );
  }
}