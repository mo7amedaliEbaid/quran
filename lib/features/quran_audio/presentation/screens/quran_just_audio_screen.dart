import 'package:audio_video_progress_bar/audio_video_progress_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hesn_elmuslim/core/utils/font_manager.dart';
import 'package:hesn_elmuslim/core/utils/values_manager.dart';
import 'package:hesn_elmuslim/core/widgets/cached_image_custom/cached_network_image.dart';
import 'package:hesn_elmuslim/features/quran/data/models/surah_names.dart';
import 'package:hesn_elmuslim/features/quran_audio/presentation/controller/aduio_cubit/audio_cubit.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:rxdart/rxdart.dart';
import '../../../../core/utils/color_manager.dart';
import '../../../../core/utils/constants_manager.dart';
import '../../../../core/widgets/app_bar/app_bar_custom.dart';
import '../../../../core/widgets/scaffold_custom/scaffold_custom.dart';
import '../../../../core/widgets/text_custom/text_custom.dart';

class QuranJustAudioScreen extends StatefulWidget {
  const QuranJustAudioScreen({Key? key}) : super(key: key);

  @override
  State<QuranJustAudioScreen> createState() => _QuranJustAudioScreenState();
}

class _QuranJustAudioScreenState extends State<QuranJustAudioScreen> {
  late AudioPlayer audioPlayer;

  final playList = ConcatenatingAudioSource(
      children: List.generate(
          SurahNames.surah.length,
          (index) => AudioSource.uri(
                tag: MediaItem(
                    id: '$index',
                    title:AppConstants.surahName == ''? SurahNames.surah[index]:SurahNames.audioName[index],
                    artUri: Uri.parse('https://i.ibb.co/9rxqZdr/quranA.png'),
                    artist: AppConstants.reciterName),
                Uri.parse(SurahNames.audio[index]),
              )));

  Stream<PositionData> get positionDataStream => Rx.combineLatest3(
      audioPlayer.positionStream,
      audioPlayer.bufferedPositionStream,
      audioPlayer.durationStream,
      (position, bufferedPosition, duration) => PositionData(
          position: position,
          duration: duration ?? Duration.zero,
          bufferedPosition: bufferedPosition));

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    audioPlayer = AudioPlayer();

    init();
  }

  Future<void> init() async {
    await audioPlayer.setLoopMode(LoopMode.all);
    // ignore: use_build_context_synchronously
    await audioPlayer.setAudioSource(playList,
        initialIndex: BlocProvider.of<AudioCubit>(context).surahId);
  }

  @override
  void dispose() {
    AppConstants.reciterName = '';
    AppConstants.surahName = '';
    audioPlayer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ScaffoldCustom(
      backgroundColor: const Color(0xff175973),
      appBarCustom: const AppBarCustom(
        brightness: Brightness.light,
        backgroundColor: Colors.transparent,
        text: 'القرآن الكريم',
        textColor: ColorManager.white,
        iconColor: ColorManager.white,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(AppPadding.p18),
          child: Column(
            children: [
              StreamBuilder(
                  stream: audioPlayer.sequenceStateStream,
                  builder: (context, snapshot) {
                    final state = snapshot.data;
                    if (state?.sequence.isEmpty ?? true) {
                      return const SizedBox();
                    }
                    final metadata = state!.currentSource!.tag as MediaItem;
                    return MediaMetaData(
                        title: metadata.title,
                        imageUrl: metadata.artUri.toString(),
                        artist: metadata.artist ?? '');
                  }),
              StreamBuilder<PositionData>(
                  stream: positionDataStream,
                  builder: (context, snapshot) {
                    final positionData = snapshot.data;
                    return ProgressBar(
                      barHeight: AppSize.s8,
                      baseBarColor: ColorManager.textFormColor,
                      progressBarColor: ColorManager.error,
                      thumbColor: ColorManager.error,
                      timeLabelTextStyle: const TextStyle(
                          color: ColorManager.white,
                          fontWeight: FontWeight.w600),
                      progress: positionData?.position ?? Duration.zero,
                      total: positionData?.duration ?? Duration.zero,
                      buffered: positionData?.bufferedPosition ?? Duration.zero,
                      onSeek: audioPlayer.seek,
                    );
                  }),
              Controls(audioPlayer: audioPlayer),
            ],
          ),
        ),
      ),
    );
  }
}

class PositionData {
  final Duration position;
  final Duration duration;
  final Duration bufferedPosition;

  PositionData(
      {required this.position,
      required this.duration,
      required this.bufferedPosition});
}

class Controls extends StatelessWidget {
  final AudioPlayer audioPlayer;

  const Controls({Key? key, required this.audioPlayer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: audioPlayer.seekToNext,
          icon: const Icon(Icons.skip_next_rounded),
          iconSize: 80,
          color: ColorManager.white,
        ),
        StreamBuilder<PlayerState>(
            stream: audioPlayer.playerStateStream,
            builder: (context, snapshot) {
              final playerState = snapshot.data;
              final processingState = playerState?.processingState;
              final playing = playerState?.playing;
              if (processingState == ProcessingState.loading ||
                  processingState == ProcessingState.buffering) {
                return Container(
                  margin: const EdgeInsets.all(8.0),
                  width: 64.0,
                  height: 64.0,
                  child: const CircularProgressIndicator(
                    color: ColorManager.white,
                  ),
                );
              } else if (playing == false) {
                return IconButton(
                  onPressed: audioPlayer.play,
                  icon: const Icon(Icons.play_arrow_rounded),
                  iconSize: 80,
                  color: ColorManager.white,
                );
              } else if (processingState != ProcessingState.completed) {
                return IconButton(
                  onPressed: audioPlayer.pause,
                  icon: const Icon(Icons.pause_rounded),
                  iconSize: 80,
                  color: ColorManager.white,
                );
              }
              return const Icon(
                Icons.play_arrow_rounded,
                size: 80,
                color: ColorManager.white,
              );
            }),
        IconButton(
          onPressed: audioPlayer.seekToPrevious,
          icon: const Icon(Icons.skip_previous_rounded),
          iconSize: 80,
          color: ColorManager.white,
        ),
      ],
    );
  }
}

class MediaMetaData extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String artist;

  const MediaMetaData(
      {Key? key,
      required this.title,
      required this.imageUrl,
      required this.artist})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CachedNetworkImageCustom(
          url: imageUrl,
          width: AppSize.s100 * 3,
          height: AppSize.s100 * 3,
          boxFit: BoxFit.cover,
        ),
        const SizedBox(
          height: AppSize.s20,
        ),
        TextCustom(
          text: title,
          color: ColorManager.white,
          fontSize: FontSize.s20,
          fontWeight: FontWeight.bold,
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: AppSize.s8,
        ),
        TextCustom(
          text: artist,
          color: ColorManager.white,
          fontSize: FontSize.s20,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
