part of '../scooter_view.dart';



class GreenBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = ConsColor.turquoiseGreen
      ..style = PaintingStyle.fill;

    final path = Path();
    path.moveTo(0, size.height - size.height*.16);
    path.lineTo(size.width * 0.65, size.height * 0.33); 
    path.lineTo(size.width, size.height * 0.44); 
    path.lineTo(size.width, 0);                      
    path.lineTo(size.width, size.height);            
    path.lineTo(0, size.height);                      
    path.close();

    canvas.drawPath(path, paint);
  }

    double convertRadiusToSigma(double radius) {
    return radius * 0.57735 + 0.5;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
