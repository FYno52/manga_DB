// import 'package:flutter/material.dart';
// import 'package:manga_app/screen/MangaDetailScreen.dart';

// import '../model/model.dart';

// class MangaListScreen extends StatelessWidget {
//   final List<Manga> mangaList = [
//     Manga(title: 'Manga 1', description: 'Description for Manga 1'),
//     Manga(title: 'Manga 2', description: 'Description for Manga 2'),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Favorite Manga'),
//       ),
//       body: ListView.builder(
//         itemCount: mangaList.length,
//         itemBuilder: (context, index) {
//           final manga = mangaList[index];
//           return ListTile(
//             title: Text(manga.title),
//             subtitle: Text(manga.description),
//             onTap: () {
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) => MangaDetailScreen(
//                     manga: manga,
//                     mangaTitle: '',
//                   ),
//                 ),
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
