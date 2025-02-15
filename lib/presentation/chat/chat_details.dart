import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import '../resources/data.dart';
import '../resources/images.dart';
import 'shareable_widget/chat_details_shareable_widgets.dart';

class ChatDetails extends StatefulWidget {
  const ChatDetails({super.key});
  @override
  State<ChatDetails> createState() => _ChatDetailsState();
}

class _ChatDetailsState extends State<ChatDetails> {
  final ScrollController _sliverScroller = ScrollController();
  static bool _isAvatarVisible = true;

  @override
  void initState() {
    _sliverScroller.addListener(_scrollListener);
    super.initState();
  }

  void _scrollListener() {
    if (_sliverScroller.position.userScrollDirection == ScrollDirection.reverse && _isAvatarVisible) {
      setState(() => _isAvatarVisible = false);
    } else if (_sliverScroller.position.userScrollDirection == ScrollDirection.forward && !_isAvatarVisible) {
      setState(() => _isAvatarVisible = true);
    }
  }

  @override
  void dispose() {
    _sliverScroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        controller: _sliverScroller,
        slivers: [
          SliverAppBar(
            leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () {}),
            actions: [
              TextButton(onPressed: () {}, child: const Text("Edit", style: TextStyle(color: Colors.black))),
            ],
            pinned: true,
            floating: false,
            toolbarHeight: 35,
            collapsedHeight: 35,
            flexibleSpace: FlexibleSpaceBar(
              title: Visibility(
                visible: !_isAvatarVisible,
                child: Row(
                  spacing: 8,
                  children: [
                    CustomCircularAvatar(radius: 20, image: NamedImages.profileSoloLeveling),
                    CustomText(name: "Mai", size: 18, weight: FontWeight.bold)
                  ],
                ),
              ),
            ),
          ),
          SliverList(
              delegate: SliverChildListDelegate([
            Column(
              children: [
                Visibility(
                  visible: _isAvatarVisible,
                  child: Column(
                    children: [
                      CustomCircularAvatar(image: NamedImages.profileSoloLeveling, radius: 50),
                      CustomText(name: "Mai Emad", size: 22, weight: FontWeight.bold)
                    ],
                  ),
                ),
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
                Align(
                    alignment: Alignment.centerLeft,
                    child: CustomText(name: "group in common", size: 15, weight: FontWeight.w500, padding: 20)),
                CustomCards(media: commonGroup),
                _buildCardShareInfo(context, shareInfo),
                _buildCardShareInfo(context, additionalShareInfo)
              ],
            )
          ]))
        ],
      ),
    );
  }

  Card _buildCardShareInfo(BuildContext context, final List<dynamic> media) {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Column(
            children: ListTile.divideTiles(
          context: context,
          tiles: List.generate(
              media.length, (index) => InfoTile(title: media[index].media, subtitle: null, icon: null, color: media[index].color)),
        ).toList()));
  }

  Card _buildCardDescription() {
    return Card(
        margin: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Container(
            width: double.infinity,
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.symmetric(vertical: 5),
            alignment: Alignment.center,
            child: CustomText(name: "Dreams are the seeds of change. Water them with action.", weight: FontWeight.w400)));
  }
}
