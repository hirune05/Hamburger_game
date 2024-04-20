void gameInit() {
  feverMode = 0;
  for (int i = 0; i<15; i++) {
    objInit(i);
  }
  pause = 0;
  stacked = 0;
  hitCon = 0;
  score = 0;
  hp = 3;
  gseq = 0;
  mcnt = 0;
  calorie = 140;
  calorieStop = 0;
  calorieSave = 0;
}// 初期化

void gamePlay() {
  mcnt = 0;
  count = 0;
  music();
  scoreDisp();
  playerDisp(); 
  objDisp();
  ingredients();
  if (pause == 1) {
    pause();
  } else {
    stroke(0);
    strokeWeight(2);
    fill(255);
    rect(1278, 85, 280, 45);
    fill(0);
    textAlign(CENTER);
    textSize(25);
    text("メニュー：control key", 1278, 93);
    playerMove();
    objMove();
    hitCheck();
  }
  if (hp < 1 || score < 0) {
    gseq = 1;//ゲームオーバーへ
  }
}

void gameOperat() {
  if (gseq == 5) {
    background(0);
    textSize(40);
    text("確定:スペースキー", width-450, 100);
    textSize(120);
    text("キー操作", width/4 + 80, 300);// choice == 0
    text("マウス操作", width/4 + 80, 600);// choice == 1
    if (choice == 0) {
      text("▷", width/4 - 20, 300);
    } else {
      text("▷", width/4 - 20, 600);
    }
  }
}

void gameStart() {
  background(0);
  image(burger, 700, 0);
  textSize(80);
  fill(#F0339B);
  textAlign(CORNER);
  text("MAKE HUMBERGER", 60, 250);

    if ((choice == 1 &&((mouseX >= 85 && mouseX <= 430) 
      && (mouseY >= 355 && mouseY <= 415))) || (choice == 0 && choice_2 == 0)) {
      rule = 1;
    }
  else {
    rule = 0;
  }
  if (rule == 0) {
    noFill();
  } else {
    fill(#767672);
  }
  rectMode(CORNER);
  stroke(255);
  strokeWeight(2);
  rect(85, 355, 345, 60);
  textSize(40);
  fill(255);
  text("Rule description", 100, 400);

  if ((choice == 1 && ((mouseX >= 85 && mouseX <= 245)
    &&(mouseY >= 465 && mouseY <= 525))) || (choice == 0 && choice_2 == 1)){
    start = 1;
  } else {
    start = 0;
  }
  if (start == 0) {
    noFill();
  } else {
    fill(#767672);
  }    
  stroke(255);
  rect(85, 465, 160, 60);
  textSize(40);
  fill(255);
  text("Start!!", 100, 510);
  if(sp_con == 1){
  if (choice == 1 && rule == 1 && mousePressed || kari == 2) {
    gseq = 4;
    sp_con = 2;
  }
  if (choice == 1 && start == 1 && mousePressed || kari == 1) {
    gameInit();
    gseq = 0;
    sp_con = 2;
  }
  }
}

void gameClear() {
  if ( count == 0) {
    gameClear.play();
  }
  objDisp();
  scoreDisp();
  background(255);
  vansx = 758;
  playerDisp();
  ingredients();
  calorieStop = 1;

  textSize(100);
  textAlign(CORNER);
  fill(255, 255, 0);
  text("GAME CLEAR!!!", 60, 200);
  textSize(80);
  fill(0);
  text(calorie+"kcal", 200, 400);
  mcnt++;
  if ( (mcnt%60) < 40 ) {
    textSize(30);
    fill(0);
    text("Click to retry!", 120, 260);
  }
  textSize(20);
  fill(0);
  text("Spacekey → タイトル画面へ", 520, 265);
  text("Enterkey → ゲーム終了", 520, 305);
  int chawan = calorie/260;
  for ( int i = 0; i <= chawan; i++) {
    if (i < 8) {
      image(rice, i * 102 + 100, 450);
    } else if (i < 16) {
      image(rice, (i - 8) * 102 + 100, 555);
    } else {
      image(rice, (i - 16) * 102 + 100, 660);
    }
  }
  player.rewind();
  int pos = gameClear.position();
  int len = gameClear.length();
  if (pos == len) {
    gameClear.rewind();
    gameClear.pause();
    count++;
  }

  if (calorieSave == 0) {
    String score = str(calorie);
    println (score + "を書き込みました");
    textWrite( file, score + "\n");
  }
  if (key == ' ') {
      rule_count = 0;
      gameInit();
      sp_con = 1;
      kari = 0;
      gseq = 3;
      rectMode(CORNER);
    }
    if (key == ENTER) {
      exit();
    }
  getData();
  rank();
  calorieSave = 1;
}

void gameOver() {
  background(0);
  if ( count == 0) {
    gameOver.play();
  }
  objDisp();
  playerDisp();
  scoreDisp();//画面が止まる
  textSize(100);
  textAlign(CORNER);
  fill(255, 255, 0);
  text("GAME OVER", 60, 200);
  mcnt++;
  if ( (mcnt%60) < 40 ) {
    textSize(30);
    fill(255);
    text("Click to retry!", 65, 280);
  }
  textSize(30);
  fill(#EABCF5);
  text("Spacekey → タイトル画面へ", 60, 350);
  text("Enterkey → ゲーム終了", 60, 400);
  player.rewind();
  int pos = gameOver.position();
  int len = gameOver.length();
  if (pos == len) {
    gameOver.rewind();
    gameOver.pause();
    count++;
  }
  if (key == ' ') {
      rule_count = 0;
      gameInit();
      sp_con = 1;
      kari = 0;
      gseq = 3;
      rectMode(CORNER);
    }
    if (key == ENTER) {
      exit();
    }
}
