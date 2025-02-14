import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  const CustomText({super.key, required this.name, this.size, this.color, this.weight});
  final String name;
  final double? size;
  final Color? color;
  final FontWeight? weight;
  @override
  Widget build(BuildContext context) {
    return Text(name, style: TextStyle(fontSize: size, fontWeight: weight));
  }
}

///
class InfoTile extends StatelessWidget {
  final String title;
  final String? subtitle;
  final IconData? icon;
  final Color? color;
  const InfoTile({super.key, required this.title, this.subtitle = "", this.icon, this.color});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      
        minTileHeight: 30,
        textColor: color,
        contentPadding: EdgeInsets.only(right: 4,left: 10),
        leading: (icon != null) ? Icon(icon) : null,
        title: CustomText(name: title, size: 15, weight: FontWeight.w500, color: color),
        trailing: (icon != null)

            ? SizedBox(
              width: 60,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      subtitle!,
                      style: const TextStyle(color: Colors.grey)
                    ),
                    Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
            )
            : Icon(icon, size: 16, color: Colors.grey),
        onTap: () {});
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
        width: MediaQuery.sizeOf(context).width / 5,
        height: 70,
        child: Column(
          children: [IconButton(icon: Icon(icon, size: 30, color: Colors.green), onPressed: () {}), Text(label)],
        ),
      ),
    );
  }
}

class CustomCards extends StatelessWidget {
  const CustomCards({
    super.key,
    required this.media,
  });

  final List<dynamic> media;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10),
      child: Card(
        child: Column(
          children: ListTile.divideTiles(
            context: context,
            color: const Color(0xffefefef),
            tiles: List.generate(
                media.length, (index) => InfoTile(title: media[index].media, subtitle: media[index].number?? "", icon: media[index].icon)),
          ).toList(),
        ),
      ),
    );
  }
}

class CustomCircularAvatar extends StatelessWidget {
  const CustomCircularAvatar({
    super.key, required this.radius, required this.image,
  });
  final double radius;
  final String image;
  @override
  Widget build(BuildContext context) {
    return CircleAvatar(radius: radius, backgroundImage: AssetImage(image.toString()) // Add profile image
        );
  }
}

