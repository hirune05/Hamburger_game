void mousePressed() {  //クリックした時に呼ばれる
  if (gseq == 1) {
    gameInit();
    gameOver.rewind();
    gameOver.pause();
  } else if (gseq == 2) {
    gameInit();
    gameClear.rewind();
    gameClear.pause();
  }
}

void keyPressed() {
  if (gseq == 0) {
    if (keyCode == CONTROL) {
      pause = 1;
    }
    if (choice == 0) {
      if ( keyCode == LEFT) {
        vansx -= 120;
      }
      if ( keyCode == RIGHT) {
        if ( vansx <= 1238) {
          vansx += 120;
        }
      }
    }
    if (pause == 1) {
      if (choice == 0) {
        if ( keyCode == UP) {
          if (pause_case > 1) {
            pause_case -= 1;
          }
        }
        if (keyCode == DOWN) {
          if (pause_case < 4) {
            pause_case += 1;
          }
        }
      }
    }
  }
  if (gseq == 5) {
    if (keyCode == UP ||  keyCode == DOWN) {
      if (choice == 0) {
        choice = 1;
      } else {
        choice = 0;
      }
    }
    if (sp_con == 0) {
      if (keyCode == ' ') {
        gseq = 3;
        sp_con = 1;
        if (choice == 0) {
          pause_case = 1;
        }
      }
    }
  } else if (gseq == 3) {
    if (keyCode == UP ||  keyCode == DOWN) {
      if (choice_2 == 0) {
        choice_2 = 1;
      } else {
        choice_2 = 0;
      }
    }
    if (sp_con == 1) {
      if (keyCode == ' ') {
        if (choice_2 == 1) {
          kari = 1;
        }
        if (choice_2 == 0) {
          kari = 2;
        }
      }
    }
  }
}
