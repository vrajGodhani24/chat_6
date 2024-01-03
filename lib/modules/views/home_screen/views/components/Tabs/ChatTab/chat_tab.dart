import 'package:chat_app_3/Modules/Views/Chat_Screen/Model/Chat_Model/chat_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../../Utils/Stream/stream.dart';
import '../../../../../../utils/helper/Authentication_Helper/auth_helper.dart';
import '../../../../../../utils/helper/Cloud_FireStore_Helper/cloud_firestore_helper.dart';

import '../../../../../Chat_Screen/Model/Receiver_Details_Model/receiver_details_model.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder(
        stream: Firestore_Helper.firestore_helper.fetchUser(),
        builder: (ctx, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("${snapshot.error}"),
            );
          } else if (snapshot.hasData) {
            QuerySnapshot<Map<String, dynamic>>? querySnapshot = snapshot.data;
            List<QueryDocumentSnapshot<Map<String, dynamic>>>? userData =
                querySnapshot?.docs;

            return ListView.builder(
                itemCount: userData?.length,
                itemBuilder: (ctx, i) {
                  return Column(
                    children: [
                      ListTile(
                        onTap: () async {
                          Receiver receiver = Receiver(
                              name: userData?[i]['name'],
                              uid: userData?[i]['uid'],
                              photo: userData?[i]['photo']);
                          ChatDetails chatdata = ChatDetails(
                              receiverUid: receiver.uid, // u
                              senderUid: Auth_Helper
                                  .auth_helper.auth.currentUser!.uid, // i
                              message: "");

                          messageData = await Firestore_Helper.firestore_helper
                              .displayMessage(chatDetails: chatdata);
                          Get.toNamed("/chat", arguments: receiver);
                        },
                        title: Text("${userData?[i]['name']}"),
                        subtitle: Text("${userData?[i]['email']}"),
                        leading: CircleAvatar(
                          radius: 30,
                          foregroundImage:
                              NetworkImage("${userData?[i]['photo']}"),
                        ),
                        trailing: IconButton(
                          onPressed: () {
                            Firestore_Helper.firestore_helper.deleteUser(
                                deleteData: "${userData?[i]['uid']}");
                          },
                          icon: Icon(Icons.delete_outline),
                        ),
                      ),
                      Divider(),
                    ],
                  );
                });
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
