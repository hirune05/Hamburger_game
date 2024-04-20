void objInit(int no) {
  oy[no] = int(random(-90, -70));
  if (feverMode == 0) {
    oColor[no] = int(random(31));//オブジェクト14種類
  } else {
    oColor[no] = int(random(30));
  }
  oWait[no] =int(random(0, 240));//オブジェクトの待ち時間
}//初期設定

void objDisp() {//オブジェクトの設定
  for (int i = 0; i<15; i++) {
    switch(oColor[i]) {
    case 0:
    case 1:
    case 2:
      if (feverMode == 1) {
        kinds = 2;
      } else {
        kinds = 0;
      }
      break;
    case 3:
    case 4:
    case 5:
      if (feverMode == 1) {
        kinds = 2;
      } else {
        kinds = 1;
      }
      break;
    case 6:
    case 7:
      kinds = 2;
      break;
    case 8:
    case 9:
      if (feverMode == 1) {
        kinds = 2;
      } else {
        kinds = 3;
      }
      break;
    case 10:
    case 11:
      if (feverMode == 1) {
        kinds = 2;
      } else {
        kinds = 4;
      }
      break;
    case 12:
    case 13:
      if (feverMode == 1) {
        kinds = 2;
      } else {
        kinds = 5;
      }
      break;
    case 14:
    case 15:
    case 16:
    case 17:
      kinds = 6;
      break;
    case 18:
    case 19:
    case 20:
    case 21:
      kinds = 7;
      break;
    case 22:
    case 23:
    case 24:
    case 25:
      kinds = 8;
      break;
    case 26:
    case 27:
    case 28:
    case 29:
      kinds = 9;
      break;
    case 30:
      if (feverMode == 1) {
        kinds = 2;
      } else {
        kinds = 10;
      }
    }
    switch(kinds) {
    case 0:
    case 1:
    case 2:
    case 3:
    case 4:
    case 5:
    case 6:
    case 7:
    case 8:
    case 9:
      image(ingredients[kinds], i*120+5, oy[i]);
      break;
    case 10:
      image(star, i*120+5, oy[i]);
      break;
    }
  }
}


void objMove() { //オブジェクトの動き
  for (int i=0; i<15; i++) {
    if ( oWait[i] > 0 ) {
      oWait[i]--;//カウントダウン
    } else { 
      if (feverMode == 0) {
        if (oColor[i] == 30) {
          oy[i] += 10;
        } else {
          oy[i] += (int)random(4, 9);//落ちてくる
        }
      } else {
        oy[i] += (int)random(6, 10);//落ちてくる
      }
    }
    if ( oy[i] > height ) {
      objInit(i);//初期に戻す
    }
  }
}
