import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:testovoe/features/photo/presentation/cubit/photos/photos_cubit.dart';

class SingleAlbumPage extends StatefulWidget {
  final int? albumId;
  final String? title;

  const SingleAlbumPage({super.key, required this.albumId, required this.title});

  @override
  State<SingleAlbumPage> createState() => _SingleAlbumPageState();
}

class _SingleAlbumPageState extends State<SingleAlbumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Альбом"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Card(
              color: Colors.blueGrey[800],
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  widget.title ?? 'empty album name',
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: BlocBuilder<PhotosCubit, PhotosState>(
                builder: (context, state) {
                  if (state is PhotosLoaded) {
                    final filteredPhotos = state.photos.where((photo) => photo.albumId == widget.albumId).toList();
                    return ListView.builder(
                      padding: const EdgeInsets.all(8.0),
                      itemCount: filteredPhotos.length,
                      itemBuilder: (context, index) {
                        final photo = filteredPhotos[index];
                        return Card(
                          color: const Color.fromARGB(255, 34, 59, 102),
                          elevation: 4,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Image.network(
                                  photo.url!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                  // height: 200,
                                  loadingBuilder:
                                      (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                                    if (loadingProgress == null) return child;
                                    return Center(
                                      child: CircularProgressIndicator(
                                        value: loadingProgress.expectedTotalBytes != null
                                            ? loadingProgress.cumulativeBytesLoaded /
                                                loadingProgress.expectedTotalBytes!
                                            : null,
                                      ),
                                    );
                                  },
                                  errorBuilder: (context, object, stackTrace) {
                                    return const Center(child: Icon(Icons.error));
                                  },
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  } else {
                    return const Center(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Icon(Icons.error_outline, size: 48, color: Colors.redAccent),
                          SizedBox(height: 16),
                          Text(
                            "Ошибка загрузки comments",
                            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
