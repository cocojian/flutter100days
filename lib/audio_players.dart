import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'widgets/btn.dart';
import 'widgets/player_widget.dart';
import 'package:provider/provider.dart';

void main() async {
  runApp(MaterialApp(home: JAudioPlayer()));
}

const kUrl1 = 'https://luan.xyz/files/audio/ambient_c_motion.mp3';
const kUrl2 = 'https://luan.xyz/files/audio/nasa_on_a_mission.mp3';
const kUrl3 = 'http://bbcmedia.ic.llnwd.net/stream/bbcmedia_radio1xtra_mf_p';
AudioCache audioCache = AudioCache();
AudioPlayer advancedPlayer = AudioPlayer();

class JAudioPlayer extends StatefulWidget {
  const JAudioPlayer({Key key}) : super(key: key);

  @override
  _JAudioPlayerState createState() => _JAudioPlayerState();
}

class _JAudioPlayerState extends State<JAudioPlayer> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<Duration>.value(
          initialData: const Duration(),
          value: advancedPlayer.onAudioPositionChanged,
        ),
      ],
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBar(
            bottom: const TabBar(
              tabs: [
                Tab(text: 'Remote Url'),
                Tab(text: 'Local Asset'),
                Tab(text: 'Notification'),
                Tab(text: 'Advanced'),
              ],
            ),
            title: const Text('audioplayers Example'),
          ),
          body: TabBarView(
            children: [
              remoteUrl(),
              localAsset(),
              notification(),
              Advanced(advancedPlayer: advancedPlayer),
            ],
          ),
        ),
      ),
    );
  }

  Widget localAsset() {
    return ListView(
      children: [
        const Text("Play Local Asset 'audio.mp3':"),
        Btn(txt: 'Play', onPressed: () => audioCache.play('audio.mp3')),
        const Text("Play Local Asset (via byte source) 'audio.mp3':"),
        Btn(
          txt: 'Play',
          onPressed: () async {
            final file = await audioCache.loadAsFile('audio.mp3');
            final bytes = await file.readAsBytes();
            audioCache.playBytes(bytes);
          },
        ),
        const Text("Loop Local Asset 'audio.mp3':"),
        Btn(txt: 'Loop', onPressed: () => audioCache.loop('audio.mp3')),
        const Text("Loop Local Asset (via byte source) 'audio.mp3':"),
        Btn(
          txt: 'Loop',
          onPressed: () async {
            final file = await audioCache.loadAsFile('audio.mp3');
            final bytes = await file.readAsBytes();
            audioCache.playBytes(bytes, loop: true);
          },
        ),
        const Text("Play Local Asset 'audio2.mp3':"),
        Btn(txt: 'Play', onPressed: () => audioCache.play('audio2.mp3')),
        const Text("Play Local Asset In Low Latency 'audio.mp3':"),
        Btn(
          txt: 'Play',
          onPressed: () {
            audioCache.play('audio.mp3', mode: PlayerMode.LOW_LATENCY);
          },
        ),
        const Text(
          "Play Local Asset Concurrently In Low Latency 'audio.mp3':",
        ),
        Btn(
          txt: 'Play',
          onPressed: () async {
            await audioCache.play(
              'audio.mp3',
              mode: PlayerMode.LOW_LATENCY,
            );
            await audioCache.play(
              'audio2.mp3',
              mode: PlayerMode.LOW_LATENCY,
            );
          },
        ),
        const Text("Play Local Asset In Low Latency 'audio2.mp3':"),
        Btn(
          txt: 'Play',
          onPressed: () {
            audioCache.play('audio2.mp3', mode: PlayerMode.LOW_LATENCY);
          },
        ),
        getLocalFileDuration(),
      ],
    );
  }

  Widget remoteUrl() {
    return ListView(
      children: [
        Text(
          'Sample 1 ($kUrl1)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        PlayerWidget(url: kUrl1),
        Text(
          'Sample 2 ($kUrl2)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        PlayerWidget(url: kUrl2),
        Text(
          'Sample 3 ($kUrl3)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        PlayerWidget(url: kUrl3),
        Text(
          'Sample 4 (Low Latency mode) ($kUrl1)',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        PlayerWidget(url: kUrl1, mode: PlayerMode.LOW_LATENCY),
      ],
    );
  }

  Future<int> _getDuration() async {
    final uri = await audioCache.load('audio2.mp3');
    await advancedPlayer.setUrl(uri.toString());
    return Future.delayed(
      const Duration(seconds: 2),
      () => advancedPlayer.getDuration(),
    );
  }

  FutureBuilder<int> getLocalFileDuration() {
    return FutureBuilder<int>(
      future: _getDuration(),
      builder: (BuildContext context, AsyncSnapshot<int> snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.none:
            return const Text('No Connection...');
          case ConnectionState.active:
          case ConnectionState.waiting:
            return const Text('Awaiting result...');
          case ConnectionState.done:
            if (snapshot.hasError) {
              return Text('Error: ${snapshot.error}');
            }
            return Text(
              'audio2.mp3 duration is: ${Duration(milliseconds: snapshot.data)}',
            );
        }
      },
    );
  }
}

Widget notification() {
  return ListView(
    children: [
      const Text("Play notification sound: 'messenger.mp3':"),
      Btn(
        txt: 'Play',
        onPressed: () => audioCache.play('messenger.mp3', isNotification: true),
      ),
      const Text('Notification Service'),
      Btn(
        txt: 'Notification',
        onPressed: () async {
          await advancedPlayer.notificationService.startHeadlessService();
          await advancedPlayer.notificationService.setNotification(
            title: 'My Song',
            albumTitle: 'My Album',
            artist: 'My Artist',
            imageUrl: 'Image URL or blank',
            forwardSkipInterval: const Duration(seconds: 30),
            backwardSkipInterval: const Duration(seconds: 30),
            duration: const Duration(minutes: 3),
            elapsedTime: const Duration(seconds: 15),
            enableNextTrackButton: true,
            enablePreviousTrackButton: true,
          );

          await advancedPlayer.play(
            kUrl2,
            isLocal: false,
          );
        },
      ),
      Btn(
        txt: 'Clear Notification',
        onPressed: () async {
          await advancedPlayer.stop();
          await advancedPlayer.notificationService.clearNotification();
        },
      ),
    ],
  );
}

class Advanced extends StatefulWidget {
  final AudioPlayer advancedPlayer;

  const Advanced({Key key, this.advancedPlayer}) : super(key: key);

  @override
  _AdvancedState createState() => _AdvancedState();
}

class _AdvancedState extends State<Advanced> {
  bool seekDone;

  @override
  void initState() {
    widget.advancedPlayer.onSeekComplete
        .listen((event) => setState(() => seekDone = true));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final audioPosition = Provider.of<Duration>(context);
    return SingleChildScrollView(
      child: ListView(
        children: [
          Column(
            children: [
              const Text('Source Url'),
              Row(
                children: [
                  Btn(
                    txt: 'Audio 1',
                    onPressed: () => widget.advancedPlayer.setUrl(kUrl1),
                  ),
                  Btn(
                    txt: 'Audio 2',
                    onPressed: () => widget.advancedPlayer.setUrl(kUrl2),
                  ),
                  Btn(
                    txt: 'Stream',
                    onPressed: () => widget.advancedPlayer.setUrl(kUrl3),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ],
          ),
          Column(
            children: [
              const Text('Release Mode'),
              Row(
                children: [
                  Btn(
                    txt: 'STOP',
                    onPressed: () =>
                        widget.advancedPlayer.setReleaseMode(ReleaseMode.STOP),
                  ),
                  Btn(
                    txt: 'LOOP',
                    onPressed: () =>
                        widget.advancedPlayer.setReleaseMode(ReleaseMode.LOOP),
                  ),
                  Btn(
                    txt: 'RELEASE',
                    onPressed: () => widget.advancedPlayer
                        .setReleaseMode(ReleaseMode.RELEASE),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ],
          ),
          Column(
            children: [
              const Text('Volume'),
              Row(
                children: [0.0, 0.3, 0.5, 1.0, 1.1, 2.0].map((e) {
                  return Btn(
                    txt: e.toString(),
                    onPressed: () => widget.advancedPlayer.setVolume(e),
                  );
                }).toList(),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ],
          ),
          Column(
            children: [
              const Text('Control'),
              Row(
                children: [
                  Btn(
                    txt: 'resume',
                    onPressed: () => widget.advancedPlayer.resume(),
                  ),
                  Btn(
                    txt: 'pause',
                    onPressed: () => widget.advancedPlayer.pause(),
                  ),
                  Btn(
                    txt: 'stop',
                    onPressed: () => widget.advancedPlayer.stop(),
                  ),
                  Btn(
                    txt: 'release',
                    onPressed: () => widget.advancedPlayer.release(),
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ],
          ),
          Column(
            children: [
              const Text('Seek in milliseconds'),
              Row(
                children: [
                  Btn(
                    txt: '100ms',
                    onPressed: () {
                      widget.advancedPlayer.seek(
                        Duration(
                          milliseconds: audioPosition.inMilliseconds + 100,
                        ),
                      );
                      setState(() => seekDone = false);
                    },
                  ),
                  Btn(
                    txt: '500ms',
                    onPressed: () {
                      widget.advancedPlayer.seek(
                        Duration(
                          milliseconds: audioPosition.inMilliseconds + 500,
                        ),
                      );
                      setState(() => seekDone = false);
                    },
                  ),
                  Btn(
                    txt: '1s',
                    onPressed: () {
                      widget.advancedPlayer.seek(
                        Duration(seconds: audioPosition.inSeconds + 1),
                      );
                      setState(() => seekDone = false);
                    },
                  ),
                  Btn(
                    txt: '1.5s',
                    onPressed: () {
                      widget.advancedPlayer.seek(
                        Duration(
                          milliseconds: audioPosition.inMilliseconds + 1500,
                        ),
                      );
                      setState(() => seekDone = false);
                    },
                  ),
                ],
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ],
          ),
          Column(
            children: [
              const Text('Rate'),
              Row(
                children: [0.5, 1.0, 1.5, 2.0, 5.0].map((e) {
                  return Btn(
                    txt: e.toString(),
                    onPressed: () {
                      widget.advancedPlayer.setPlaybackRate(e);
                    },
                  );
                }).toList(),
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              ),
            ],
          ),
          Text('Audio Position: $audioPosition'),
          if (seekDone != null) Text(seekDone ? 'Seek Done' : 'Seeking...'),
        ],
      ),
    );
  }
}
