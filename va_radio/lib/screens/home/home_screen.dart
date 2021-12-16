import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:va_radio/model/radio.dart';
import 'package:va_radio/utils/au_utils.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

// AlanVoice.addButton(
//         "e9e9110033dff05f07d2c160dee7c2e72e956eca572e1d8b807a3e2338fdd0dc/testing",
//         buttonAlign: AlanVoice.BUTTON_ALIGN_LEFT);

class _HomeScreenState extends State<HomeScreen> {
  late List<RadioStation> radios;
  late RadioStation _selectedRadio;
  late Color _selectedColor;
  bool _isPlaying = false;

  final AudioPlayer _audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    fetchRadios();
    _audioPlayer.onNotificationPlayerStateChanged.listen((event) {
      if (event == PlayerState.PLAYING) {
        _isPlaying = true;
      } else {
        _isPlaying = false;
      }
    });
  }

  fetchRadios() async {
    final radioJson = await rootBundle.loadString('assets/radio.json');
    radios = VARadioList.fromJson(radioJson).radios;
    print(radios);
    setState(() {});
  }

  _playMusic(String url) {
    _audioPlayer.play(url);
    _selectedRadio = radios.firstWhere((element) => element.url == url);
    print(_selectedRadio.name);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          VxAnimatedBox()
              .size(context.screenWidth, context.screenHeight)
              .withGradient(
                LinearGradient(
                  colors: [AIColors.primaryColor, AIColors.primaryColor2],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              )
              .make(),
          AppBar(
            title: 'VA Radio'.text.xl4.bold.white.make().shimmer(
                  primaryColor: Vx.purple300,
                  secondaryColor: Vx.white,
                ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ).h(100).p(10),
          VxSwiper.builder(
            itemCount: radios.length,
            aspectRatio: 1.0,
            enlargeCenterPage: true,
            itemBuilder: (context, i) {
              final rad = radios[i];

              return VxBox(
                child: ZStack(
                  [
                    Positioned(
                      right: 0,
                      top: 0,
                      child: VxBox(
                        child: rad.category.text.uppercase.white.make().px16(),
                      ).height(40).black.alignCenter.withRounded(value: 10).make(),
                    ),
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: VStack(
                        [
                          rad.name.text.xl3.white.bold.make(),
                          5.heightBox,
                          rad.tagline.text.sm.white.semiBold.make(),
                        ],
                        crossAlignment: CrossAxisAlignment.center,
                      ),
                    ),
                    Align(
                        alignment: Alignment.center,
                        child: [
                          const Icon(
                            CupertinoIcons.play_circle,
                            color: Colors.white,
                          ),
                          10.heightBox,
                          'Double tap to play'.text.gray300.make(),
                        ].vStack())
                  ],
                  // clip: Clip.antiAlias,
                ),
              )
                  .clip(Clip.antiAlias)
                  .bgImage(DecorationImage(
                      image: NetworkImage(rad.image),
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.3),
                        BlendMode.darken,
                      )))
                  .withRounded(value: 60)
                  .border(color: Colors.black, width: 5)
                  .make()
                  .onInkDoubleTap(() => _playMusic(rad.url))
                  .p16();
            },
          ).centered(),
          Align(
                  alignment: Alignment.bottomCenter,
                  child: [
                    if (_isPlaying) 'Playing Now - ${_selectedRadio.name} FM'.text.makeCentered(),
                    Icon(
                      _isPlaying ? CupertinoIcons.stop_circle : CupertinoIcons.play_circle,
                      size: 50,
                    ).onInkTap(() => _isPlaying ? _audioPlayer.stop() : _playMusic(_selectedRadio.url)),
                  ].vStack())
              .pOnly(bottom: context.percentHeight * 12)
        ],
      ),
    );
  }
}
