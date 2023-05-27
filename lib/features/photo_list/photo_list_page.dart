import 'package:cf_flutter/domain/utils/date_formatter.dart';
import 'package:cf_flutter/features/photo_list/photo_list_presenter.dart';
import 'package:cf_flutter/features/photo_list/photo_list_presentation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoListPage extends StatefulWidget {
  final PhotoListPresenter presenter;

  const PhotoListPage({required this.presenter, Key? key}) : super(key: key);

  @override
  State<PhotoListPage> createState() => _PhotoListPageState();
}

class _PhotoListPageState extends State<PhotoListPage> {
  PhotoListPresenter get presenter => widget.presenter;

  @override
  void initState() {
    super.initState();
    presenter.navigator.context = context;
    presenter.onInit();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PhotoListPresenter, PhotoListPresentationModel>(
      bloc: presenter,
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('CF Flutter'),
            centerTitle: true,
            actions: [
              Switch(
                value: state.isDarkTheme,
                onChanged: presenter.onThemeToggled,
                activeColor: Theme.of(context).primaryColorLight,
              ),
            ],
          ),
          body: state.isLoading
              ? Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).colorScheme.background,
                  ),
                )
              : ListView(
                  children: state.photos
                      .map(
                        (photo) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                          decoration: BoxDecoration(
                              color: Theme.of(context).cardColor, borderRadius: BorderRadius.circular(10)),
                          child: ListTile(
                            onTap: () => presenter.onPhotoTapped(photo),
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
