void ingredients() {
  rectMode(CENTER);
  if (hitcount!=0) {
    for (int i = 0; i<stacked; i++) {
      if ( whatHit.get(i) != 9 && whatHit.get(i) != 4) {
        switch(whatHit.get(i)) {
        case 0:
          fill(255, 0, 0);
          rw = 80;
          rh = 10;
          if ( gseq == 2 && calorieStop == 0) {
            calorie += 3;
          }
          break;
        case 1:
          fill(0, 255, 0);
          rw = 90;
          rh = 5;
          if ( gseq == 2 && calorieStop == 0) {
            calorie += 1;
          }
          break;
        case 2:
          fill(#835A0C);
          rw = 80;
          rh = 20;
          if ( gseq == 2 && calorieStop == 0) {
            calorie += 216;
          }
          break;
        case 3:
          fill(#F0D39D);
          rw = 80;
          rh = 20;
          if ( gseq == 2 && calorieStop == 0) {
            calorie += 85;
          }
          break;
        case 5:
          fill(#FAE312);
          rw = 80;
          rh = 10;
          if ( gseq == 2 && calorieStop == 0) {
            calorie += 61;
          }
        }
        noStroke();
        rect(vansx, vansy - (i + 1)*20, rw, rh, 5);
      }
      if (whatHit.get(i) == 4) {
        strokeWeight(4);
        stroke(#F563D3);
        line(vansx-vansw/2, vansy - (i + 1)*20 + 10, vansx-vansw/2 + 20, vansy - (i + 1)*20);
        line(vansx-vansw/2 + 20, vansy - (i + 1)*20, vansx-vansw/2 + 20*2, vansy - (i + 1)*20 + 10);
        line(vansx-vansw/2 + 20*2, vansy - (i + 1)*20 + 10, vansx-vansw/2 + 20*3, vansy - (i + 1)*20);
        line(vansx-vansw/2 + 20 * 3, vansy - (i + 1)*20, vansx-vansw/2 + 20*4, vansy - (i + 1)*20 + 10);
        if ( gseq == 2 && calorieStop == 0) {
          calorie += 77;
        }
      }
      if (whatHit.get(i) == 9) {
        noStroke();
        fill(#DB9D1F);
        arc(vansx, vansy - (i + 1)*20, vansw, vansh, radians(180), radians(360));
        gseq = 2;
      }
    }
  }
}
//バンズの設定

void hitCheck() {
  int ox;//オブジェクトのx座標
  for (int i=0; i<15; i++) {
    ox = i*120+5;//オブジェクト並べる
    if ( (vansx < (ox+ow)- 5) && ((vansx+vansw) > ox + 5)
      && (vansy - stacked*20 < (oy[i]+oh))&&((vansy - vansh) > oy[i])) {
      hitcount++;
      switch(oColor[i]) {         
      case 0:
      case 1:
      case 2:
        if (feverMode == 1) {
          whatHit.set(hitCon, 2);
        } else {
          whatHit.set(hitCon, 0);
        }
        score++;
        stacked++;
        hitCon++;
        break;
      case 3:
      case 4:
      case 5:
        if (feverMode == 1) {
          whatHit.set(hitCon, 2);
        } else {
          whatHit.set(hitCon, 1);
        }
        score++;
        stacked++;
        hitCon++;
        break;
      case 6:
      case 7:
        whatHit.set(hitCon, 2);
        score++;
        stacked++;
        hitCon++;
        break;
      case 8:
      case 9:
        if (feverMode == 1) {
          whatHit.set(hitCon, 2);
        } else {
          whatHit.set(hitCon, 3);
        }
        score++;
        stacked++;
        hitCon++;
        break;
      case 10:
      case 11:
        if (feverMode == 1) {
          whatHit.set(hitCon, 2);
        } else {
          whatHit.set(hitCon, 4);
        }
        score++;
        stacked++;
        hitCon++;
        break;
      case 12:
      case 13:
        if (feverMode == 1) {
          whatHit.set(hitCon, 2);
        } else {
          whatHit.set(hitCon, 5);
        }
        score++;
        stacked++;
        hitCon++;
        break;
      case 26:
      case 27:
      case 28:
      case 29:
        whatHit.set(hitCon, 9);
        score+=10;
        stacked++;
        hitCon++;
        break;
      case 30:
        if (feverMode == 1) {
          whatHit.set(hitCon, 2);
        } else {
          feverMode = 1;
        }
        break;
      default :
        hitcount--;
        hp--;
        stacked--;
        hitCon--;
        score--;
        break;
      }
      objInit(i);//当たり判定
    }
  }
}
