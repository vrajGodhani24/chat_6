import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../utils/constant/constant.dart';
import '../../../Model/Receiver_Details_Model/receiver_details_model.dart';

dynamic chatAppBar() {
  return Builder(builder: (context) {
    Receiver receiver = ModalRoute.of(context)!.settings.arguments as Receiver;
    double h = MediaQuery.sizeOf(context).height;
    double w = MediaQuery.sizeOf(context).width;
    return Container(
      height: h * 0.12,
      width: w,
      color: Constant.appColor,
      child: Column(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconButton(
                onPressed: () {
                  Get.back();
                },
                icon: Icon(Icons.arrow_back_ios_rounded),
                color: Constant.textcolor,
              ),
              CircleAvatar(
                radius: 25,
                foregroundImage: NetworkImage(receiver.photo),
              ),
              SizedBox(
                width: 15,
              ),
              Text(
                receiver.name,
                style: TextStyle(color: Constant.textcolor, fontSize: 20),
              ),
              SizedBox(
                width: 60,
              ),
              Row(
                children: [
                  Icon(
                    Icons.video_call,
                    color: Constant.textcolor,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.phone,
                    color: Constant.textcolor,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Icon(
                    Icons.more_vert_outlined,
                    color: Constant.textcolor,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  });
}
