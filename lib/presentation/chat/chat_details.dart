import 'package:flutter/material.dart';

import '../resources/data.dart';
import '../resources/images.dart';
import 'shareable_widget/chat_details_shearble_widgets.dart';

class ChatDetails extends StatelessWidget {
  const ChatDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contact Info"),
        leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () {}),
        actions: [
          TextButton(onPressed: () {}, child: const Text("Edit", style: TextStyle(color: Colors.black))),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5,vertical: 8),
          child: Column(
            spacing: 8,
            children: [
              CircleAvatar(radius: 50, backgroundImage: AssetImage(NamedImages.profileSoloLeveling) // Add profile image
                  ),
              CustomText(name: "Mai Emad", size: 22, weight: FontWeight.bold),
              CustomText(name: "+20 120 205 5995", size: 16, color: Colors.grey),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ContactButton(icon: Icons.call, label: "Audio"),
                  ContactButton(icon: Icons.video_call, label: "Video"),
                  ContactButton(icon: Icons.search, label: "Search")
                ],
              ),
              _buildCardDescription(),
              CustomCards(media: mediaTypes),
              CustomCards(media: additions),
              CustomCards(media: contactDetails),
              Container(
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.only(left: 15),
                  child: CustomText(name: "group in common", size: 15, weight: FontWeight.w500)),
              CustomCards(media: commonGroup),
              _buildCardShareInfo(context, shareInfo),
              _buildCardShareInfo(context, additionalShareInfo)
            ],
          ),
        ),
      ),
    );
  }

  Card _buildCardShareInfo(BuildContext context, final List<dynamic> media) {
    return Card(
      child: SizedBox(
        width: double.infinity,
        child: Column(
            children: ListTile.divideTiles(
          context: context,
          tiles: List.generate(
              media.length, (index) => InfoTile(title: media[index].media, subtitle: null, icon: null, color: media[index].color)),
        ).toList()),
      ),
    );
  }

  Card _buildCardDescription() {
    return Card(
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            child: CustomText(name: "Dreams are the seeds of change. Water them with action.", weight: FontWeight.w400)));
  }
}

class ContactButton extends StatelessWidget {
  final IconData icon;
  final String label;

  const ContactButton({super.key, required this.icon, required this.label});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        width: MediaQuery.sizeOf(context).width / 4.3,
        height: 70,
        child: Column(
          children: [IconButton(icon: Icon(icon, size: 30, color: Colors.green), onPressed: () {}), Text(label)],
        ),
      ),
    );
  }
}
