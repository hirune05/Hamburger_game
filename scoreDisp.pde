void scoreDisp() {
  if (score >= 0) {
    for (int lifeCount = hp; lifeCount > 0; lifeCount--) {
      image(life, 20 + (lifeCount- 1) * 60, 25);
    }
  }
}//scoreとHPの表示

void pause() {
  int i;
  int[] size = new int[4];
  if (choice == 1) {
    if (mouseX > 623 && mouseX < 816) {
      if (mouseY >= 272 && mouseY < 311) {
        pause_case = 1;
      } else if (mouseY >= 377 && mouseY < 409) {
        pause_case = 2;
      } else if (mouseY >= 476 && mouseY < 508) {
        pause_case = 3;
      } else if (mouseY >= 577 && mouseY < 607) {
        pause_case = 4;
      } else {
        pause_case = 5;
      }
    }
  }

  switch(pause_case) {
  case 1:
    size[0] = 30;
    for (i = 1; i < 4; i++) {
      size[i] = 20;
    }
    break;
  case 2:
    for (i = 0; i < 4; i++) {
      size[i] = 20;
    }
    size[1] = 30;
    break;
  case 3:
    for (i = 0; i < 4; i++) {
      size[i] = 20;
    }
    size[2] = 30;
    break;
  case 4:
    for (i = 0; i < 4; i++) {
      size[i] = 20;
    }
    size[3] = 30;
    break;
  default:
    for (i = 0; i < 4; i++) {
      size[i] = 20;
    }
    break;
  }
  fill(255);
  stroke(0);
  rectMode(CENTER);
  rect(width/2, height/2, 400, 500, 30);
  textAlign(CENTER);
  fill(0);
  textSize(size[0]);
  text("スタート画面へ", width/2, 300);
  textSize(size[1]);
  text("ルール画面へ", width/2, 400);
  textSize(size[2]);
  text("ゲームを終了する", width/2, 500);
  textSize(size[3]);
  text("ゲームを続ける", width/2, 600);
  
  if (gseq == 0) {
    if (pause == 1) {
      if((choice == 0 && key == ' ' ) || (choice == 1 && mousePressed)){
        switch(pause_case) {
        case 1:
          gseq = 3;
          pause = 0;
          sp_con = 1;
          kari = 0;
          break;
        case 2:
          rule_count = 0;
          gseq = 4;
          pause = 0;
          break;
        case 3:
          exit();
          pause = 0;
          break;
        case 4:
          pause = 0;
          break;
        }
      }
    }
  }
}
