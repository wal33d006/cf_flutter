import 'package:cf_flutter/domain/utils/date_formatter.dart';
import 'package:cf_flutter/features/photo_details/photo_details_presenter.dart';
import 'package:cf_flutter/features/photo_details/photo_details_initial_params.dart';
import 'package:cf_flutter/features/photo_details/photo_details_presentation_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PhotoDetailsPage extends StatefulWidget {
  final PhotoDetailsInitialParams initialParams;

  const PhotoDetailsPage({required this.initialParams, Key? key}) : super(key: key);

  @override
  State<PhotoDetailsPage> createState() => _PhotoDetailsPageState();
}

class _PhotoDetailsPageState extends State<PhotoDetailsPage> {
  late PhotoDetailsPresenter cubit;

  @override
  void initState() {
    super.initState();
    cubit = BlocProvider.of<PhotoDetailsPresenter>(context);
    cubit.navigator.context = context;
    cubit.onInit(widget.initialParams);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<PhotoDetailsPresenter, PhotoDetailsPresentationModel>(
        bloc: cubit,
        builder: (context, state) {
          final photo = state.photo;
          return Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Center(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.network(photo.imgSrc),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
                    child: ListTile(
                      title: Text('Camera details', style: Theme.of(context).textTheme.titleMedium),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Camera ID'),
                              Text(photo.camera.id.toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Photo ID'),
                              Text(photo.id.toString()),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Name'),
                              Text(photo.camera.name),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Full name'),
                              Text(photo.camera.fullName, overflow: TextOverflow.ellipsis),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Earth date'),
                              Text(formatDate(photo.earthDate)),
                            ],
                          ),
                          const Divider(),
                          Text('Rover details', style: Theme.of(context).textTheme.titleMedium),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Name'),
                              Text(photo.rover.name),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Launch date'),
                              Text(formatDate(photo.rover.launchDate)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text('Landing date'),
                              Text(formatDate(photo.rover.landingDate)),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
