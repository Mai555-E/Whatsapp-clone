import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:whatsapp_clone_app/presentation/resources/images.dart';

import '../resources/data.dart';
import 'shareable_widget/chat_details_shareable_widgets.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final ScrollController _scrollController = ScrollController();
  bool _isAvatarVisible = true;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_scrollListener);
  }

  void _scrollListener() {
    if (_scrollController.position.userScrollDirection == ScrollDirection.reverse) {
      if (_isAvatarVisible) {
        setState(() {
          _isAvatarVisible = false;
        });
      }
    } else if (_scrollController.position.userScrollDirection == ScrollDirection.forward) {
      if (!_isAvatarVisible) {
        setState(() {
          _isAvatarVisible = true;
        });
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //  // title: const Text("Contact Info"),
      //   leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () {}),
      //   actions: [
      //     TextButton(onPressed: () {}, child: const Text("Edit", style: TextStyle(color: Colors.black))),
      //   ],
      // ),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            
              leading: IconButton(icon: const Icon(Icons.arrow_back_ios), onPressed: () {}),
        actions: [
          TextButton(onPressed: () {}, child: const Text("Edit", style: TextStyle(color: Colors.black)))],

          // expandedHeight:_isAvatarVisible?  0:50,
            collapsedHeight: 35,
            toolbarHeight: 35,
            backgroundColor: Colors.black.withAlpha(0),
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Visibility(
                visible:! _isAvatarVisible,
                child: Row(
                  spacing: 10,
                  children: [
                    CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(NamedImages.profileSoloLeveling),
                    ),
                    Text("Mai", style: TextStyle(fontSize: 20),),
                  ],
                ),
              ),

          
                // background:
                // AnimatedOpacity(
                //   duration: Duration(milliseconds: 300),
                //   opacity: _isAvatarVisible ? 1.0 : 0.0,
                //   child: CircleAvatar(
                //     radius: 40,
                //     backgroundImage: AssetImage(NamedImages.profileSoloLeveling),
                //   ),
                // ),
              //  Stack(
              //   fit: StackFit.expand,
              //   children: [
              //     Image.asset(
              //       NamedImages.profileSoloLeveling, // Replace with your avatar URL
              //       fit: BoxFit.cover,
              //     ),
              //     Container(color: Colors.black.withOpacity(0.3)),
              //   ],
              // ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                
                Visibility(
                  visible: _isAvatarVisible,
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 40,
                        backgroundImage: AssetImage(NamedImages.profileSoloLeveling),
                      ),

                      Text("MAi")
                    ],
                  ),
                ),
                SizedBox(height: 20),
                ListTile(
                  leading: Icon(Icons.link),
                  title: Text("Facebook Group"),
                  subtitle: Text("https://www.facebook.com/groups/one.million.egyptian.coder"),
                  onTap: () {},
                ),
                ListTile(
                  leading: Icon(Icons.code),
                  title: Text("Programming"),
                  subtitle: Text("Created by You, 18/05/21"),
                ),
                Divider(),
                ListTile(leading: Icon(Icons.notifications), title: Text("Notifications")),
                ListTile(leading: Icon(Icons.image), title: Text("Media Visibility")),
                ListTile(leading: Icon(Icons.star), title: Text("Starred Messages")),
                CustomCards(media: contactDetails),
                CustomCards(media: callsTypes),
                CustomCards(media: callsTypes),
                CustomCards(media: callsTypes),
                CustomCards(media: callsTypes),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
