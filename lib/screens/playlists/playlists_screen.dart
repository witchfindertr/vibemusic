import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gyavun/ui/colors.dart';
import 'package:gyavun/ui/text_styles.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:iconsax/iconsax.dart';

class PlaylistsScreen extends StatelessWidget {
  const PlaylistsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Playlists', style: mediumTextStyle(context, bold: false)),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 8),
        children: [
          ValueListenableBuilder(
              valueListenable: Hive.box('favorites').listenable(),
              builder: (context, Box box, child) {
                return ListTile(
                  onTap: () => context.go('/playlists/favorite'),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  title:
                      Text('Favorites', style: textStyle(context, bold: false)),
                  leading: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: darkGreyColor.withAlpha(50),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(Iconsax.heart5)),
                  subtitle: Text(
                      '${box.values.length} song${box.values.length > 1 ? "s" : ""}'),
                );
              }),
        ],
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () => showCreatePlaylist(context),
      //   child: const Icon(Icons.playlist_add),
      // ),
    );
  }
}
