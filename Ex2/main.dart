import 'package:flutter/material.dart';
enum Position {left,right}
enum ButtonType {primary,secondary,disabled;
  Color get color{
    if(this == primary){
      return Colors.blue;
    }else if( this == secondary){
      return Colors.green;
    }
    return Colors.grey;
  } 
}

class CustomButton extends StatelessWidget{
  final String label;
  final IconData icon;
  final Position position;
  final ButtonType buttonType;

  const CustomButton ({
    super.key,
    required this.label,
    required this.icon,
    this.position = Position.left,
    this.buttonType = ButtonType.primary
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      padding: EdgeInsets.all(10),
      margin: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: buttonType.color,
        borderRadius: BorderRadius.circular(25)
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if(position == Position.left)
            Icon(icon,color: Colors.grey),
          SizedBox(width: 10),
          Text(label,style: TextStyle(color: Colors.blueGrey)),
          SizedBox(width: 10),
          if(position == Position.right)
            Icon(icon)
        ],
      ),

    );
  }
}

void main(){
  runApp(
    MaterialApp(
      home: Scaffold(
        body: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.all(10),
                child: Text("Custom Button", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black ),),
              ),
              CustomButton(label: 'Submit',icon: Icons.check, position: Position.left, buttonType: ButtonType.primary),
              CustomButton(label: 'Time',icon: Icons.access_time, position: Position.right, buttonType: ButtonType.secondary),
              CustomButton(label: 'Account',icon: Icons.account_tree, position: Position.right, buttonType: ButtonType.disabled)
            ],
          ),
        ),
      ),
  );
}