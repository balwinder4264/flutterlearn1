// spotify_provider.dart

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

final spotifyProvider = Provider<SpotifySdk>((ref) => SpotifySdk());

// spotify_state.dart



enum PlaybackState {
  playing,
  paused,
  stopped,
}

class SpotifyState {
  final PlaybackState playbackState;
  final String? trackName;

  SpotifyState({required this.playbackState, this.trackName});
}

class SpotifyNotifier extends StateNotifier<SpotifyState> {
  SpotifyNotifier() : super(SpotifyState(playbackState: PlaybackState.stopped));

  void play(String trackUri) {
    // Use Spotify SDK to play a track by its URI
    SpotifySdk.play(spotifyUri: trackUri);
    state = SpotifyState(playbackState: PlaybackState.playing);
  }

  void pause() {
    // Use Spotify SDK to pause playback
    SpotifySdk.pause();
    state = SpotifyState(playbackState: PlaybackState.paused);
  }

  // Add more methods as required (e.g. stop, next, previous etc.)
}

final spotifyNotifierProvider = StateNotifierProvider<SpotifyNotifier, SpotifyState>((ref) {
  return SpotifyNotifier();
});
