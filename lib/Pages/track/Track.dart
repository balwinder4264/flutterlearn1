// main.dart

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/provider/audioPlayer.dart';


class AudioTrack extends HookConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final spotifyState = ref.watch(spotifyNotifierProvider);

    return MaterialApp(
      title: 'Spotify Player',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Spotify SDK with Riverpod'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(spotifyState.trackName ?? "No track playing"),
              ElevatedButton(
                onPressed: () {
                  if (spotifyState.playbackState == PlaybackState.playing) {
                    ref.read(spotifyNotifierProvider.notifier).pause();
                  } else {
                    ref.read(spotifyNotifierProvider.notifier).play('spotify:track:0YBQXXJhSGP99A19LGY6oU'); // Put your track URI here
                  }
                },
                child: Text(spotifyState.playbackState == PlaybackState.playing ? 'Pause' : 'Play'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
