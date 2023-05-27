import 'package:cf_flutter/domain/utils/date_formatter.dart';
import 'package:cf_flutter/features/photo_list/photo_list_cubit.dart';
import 'package:cf_flutter/features/photo_list/photo_list_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoListPage extends StatefulWidget {
  const PhotoListPage({Key? key}) : super(key: key);

  @override
  State<PhotoListPage> createState() => _PhotoListPageState();
}

class _PhotoListPageState extends State<PhotoListPage> {
  late PhotoListCubit cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<PhotoListCubit>(context);
    cubit.navigator.context = context;
    cubit.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoListCubit, PhotoListState>(
      bloc: cubit,
      builder: (context, state) {
        return Scaffold(
          body: state.isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : ListView(
                  children: state.photos
                      .map(
                        (photo) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          decoration:
                              BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            onTap: () => cubit.onPhotoTapped(photo),
                            title: Text(photo.camera.name),
                            subtitle: Text(photo.camera.fullName, overflow: TextOverflow.ellipsis),
                            trailing: Text(formatDate(photo.earthDate)),
                            leading: CircleAvatar(backgroundImage: NetworkImage(photo.imgSrc)),
                          ),
                        ),
                      )
                      .toList(),
                ),
        );
      },
    );
  }
}
