import 'package:flutter/material.dart';

class Roundbtn extends StatelessWidget {
  final String title;
  final VoidCallback ontap;
  final bool loading;

  const Roundbtn({
    Key? key,
    required this.title,
    required this.ontap,
    this.loading = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: Color(0XFF381866),
        ),
        child: Center(
          child: loading ? CircularProgressIndicator(
              strokeWidth: 3, color: Colors.pink) : Text(title,
            style: TextStyle(fontFamily: "Poppinsmedium", fontSize: 25,color: Colors.white),),
        ),
      ),
    );
  }
}
