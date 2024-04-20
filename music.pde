void music() {
  int playerPos = player.position();
  int playerLen = player.length();
  int feverPos = fever.position();
  int feverLen = fever.length();
  if (playerPos == playerLen) {
    player.rewind();
  }
  if (feverPos == feverLen) {
    feverMode = 2;
  }

  if (pause == 1) {
    player.pause();
    fever.pause();
  } else {
    if (feverMode != 1) {
      fever.rewind();
      fever.pause();
      player.play();
    } else {
      player.pause();
      fever.play();
    }
  }
}
