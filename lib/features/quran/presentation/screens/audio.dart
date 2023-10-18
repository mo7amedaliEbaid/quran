import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesn_elmuslim/core/utils/color_manager.dart';
import 'package:hesn_elmuslim/core/utils/values_manager.dart';
import 'package:hesn_elmuslim/core/widgets/text_custom/text_custom.dart';
import '../audio_cubit/audio_cubit.dart';
import '../audio_cubit/audio_state.dart';

class QuranAudio extends StatelessWidget {
  final String urlAudio;

  const QuranAudio({Key? key, required this.urlAudio}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AudioCubit()
        ..playListen()
        ..durationListen()
        ..positionListen(),
      child: BlocConsumer<AudioCubit, AudioState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          var cubit = AudioCubit.get(context);
          return Column(
            children: [
              Slider(
                activeColor: ColorManager.primary,
                min: 0,
                max: cubit.duration.inSeconds.toDouble(),
                value: cubit.position.inSeconds.toDouble(),
                onChanged: (value) async {
                  final position = Duration(seconds: value.toInt());
                  await cubit.audioPlayer.seek(position);

                  // play audio if was paused
                  await cubit.audioPlayer.resume();
                },
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextCustom(text: cubit.formatTime(cubit.position)),
                    CircleAvatar(
                      radius: AppSize.s35,
                      backgroundColor: ColorManager.primary,
                      child: IconButton(
                        onPressed: () async {
                          if (cubit.isPlaying) {
                            await cubit.audioPlayer.pause();
                          } else {
                            await cubit.audioPlayer.play(UrlSource(urlAudio));
                          }
                        },
                        icon: Icon(
                            cubit.isPlaying ? Icons.pause : Icons.play_arrow),
                        iconSize: AppSize.s50,
                        color: ColorManager.white,
                      ),
                    ),
                    TextCustom(
                        text:
                            cubit.formatTime(cubit.duration - cubit.position)),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
