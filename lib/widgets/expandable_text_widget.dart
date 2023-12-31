import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery/utils/app_colors.dart';
import 'package:food_delivery/utils/dimensions.dart';
import 'package:food_delivery/widgets/small_text.dart';

class ExpandableTextWidget extends StatefulWidget {
  final String text;
  const ExpandableTextWidget({Key? key, required this.text}) : super(key: key);

  @override
  State<ExpandableTextWidget> createState() => _ExpandableTextWidgetState();
}

class _ExpandableTextWidgetState extends State<ExpandableTextWidget> {

  late String firstHalf;
late String secondHalf;
bool hiddenText=true;
double textHeight=Dimensions.screenHeight/6.0952;

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    if(widget.text.length>textHeight){
      firstHalf=widget.text.substring(0, textHeight.toInt());
      secondHalf=widget.text.substring(textHeight.toInt()+1, widget.text.length);
    }else{
      firstHalf=widget.text;
      secondHalf="";
    }
  }

@override
  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty?SmallText(size: Dimensions.font16, text: firstHalf, color: Colors.black, height: 1.4,)
          :Column(children: [
          SmallText(size: Dimensions.font16, text: hiddenText?(firstHalf+".....")
              :firstHalf+secondHalf, color: Colors.black, height: 1.4,),
          InkWell(
            onTap: () {
              setState(() {
                hiddenText=!hiddenText;
              });
            },child: Row(
            children: [
              SmallText(text:hiddenText? "Show more": "Show less", color: AppColors.mainColor,),
              SizedBox(width: Dimensions.width10/2,),
              Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up_outlined, color: AppColors.mainColor,)
            ],
          ),
          )
        ],
      ),
    );
  }
}
