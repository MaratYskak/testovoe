import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/features/app/const/page_const.dart';
import 'package:testovoe/features/photo/presentation/cubit/albums/albums_cubit.dart';

class PhotosPage extends StatefulWidget {
  const PhotosPage({super.key});

  @override
  State<PhotosPage> createState() => _PhotosPageState();
}

class _PhotosPageState extends State<PhotosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Posts"),
      //   centerTitle: true,
      // ),
      body: BlocBuilder<AlbumsCubit, AlbumsState>(
        builder: (context, state) {
          if (state is AlbumsLoaded) {
            return ListView.builder(
              padding: EdgeInsets.all(8.0),
              itemCount: state.albums.length,
              itemBuilder: (context, index) {
                final album = state.albums[index];
                return GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, PageConst.singleAlbumPage,
                        arguments: {'albumId': album.id, 'title': album.title});
                  },
                  child: Card(
                    color: const Color.fromARGB(255, 34, 59, 102),
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            album.title ?? "Без заголовка",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
                  SizedBox(height: 16),
                  Text(
                    "Ошибка загрузки albums",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
