import ddf.minim.*;//もしかしてこれ以外いらん？
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;
import java.io.FileOutputStream;

Minim minim = new Minim(this);
AudioPlayer player;
AudioPlayer gameClear;
AudioPlayer gameOver;
AudioPlayer fever;
int vansx = 758;//パッドのx座標
int vansy = 800;//パッドのy座標
int vansw = 80;//パッドの幅
int vansh = vansw/4;//パッドの高さ
int ow = 70;//オブジェクトの幅
int oh = 40;//オブジェクトの高さ
int rw; 
int rh;
int score;
int hp;
int gseq = 5;//ゲームの流れ管理
int choice = 0;//キー操作かマウス操作か
int choice_2 = 0;//ルール説明かスタートか
int mcnt;//メッセージ用カウンタ
int tot1 = vansx;
int hitcount = 0;
int stacked = 0;// 積み重なっている具材の数
int hitCon = 0;// whatHit[]の中身を制御する
int count = 0;
int calorie = 140;//カロリー
int calorieStop = 0;//カロリー終了
int rule;
int start;
int rule_count = 0;
int val1;
int val2;
int val3;
int calorieSave = 0;// 関数calorieSaveを一度だけ実行する
int sp_con = 0;//スペースキーをコントロールする
int kinds;
int speed;
int pause;
int pause_case;//選択
int kari = 0;

int feverMode = 0;
int superKinds;

int rank1;
int rank2;
int rank3;

int[] oy = new int[15];//オブジェクトのy座標＊15種類
int[] oColor = new int[15];//オブジェクトの色＊15種類
int[] oWait = new int[15];//オブジェクトの待ち時間＊15種類
IntList whatHit = new IntList();
PImage kichen;
PImage bun;
PImage rice;
PImage burger;
PImage life;
PImage star;
PImage[] ingredients = new PImage[10];

int data[] = new int[100];
String textScoreData[] = null;
String file;
void settings() {
  fullScreen();
}

void setup() {
  //size(1200, 700);
  noStroke();
  PFont font = createFont("UTF-8", 50);
  textFont(font);
  kichen = loadImage("bg_house_kitchen.jpg");
  ingredients[0] = loadImage("hamburger_goods_tomato.png");
  ingredients[1] = loadImage("hamburger_goods_lettuce.png");
  ingredients[2] = loadImage("hamburger_goods_hamburg.png");
  ingredients[3] = loadImage("hamburger_goods_fish.png");
  ingredients[4] = loadImage("hamburger_goods_bacon.png");
  ingredients[5] = loadImage("hamburger_goods_cheese.png");
  ingredients[6]= loadImage("shoes_nagagutsu.png");
  ingredients[7] = loadImage("gomi_shigen_can.png");
  ingredients[8] = loadImage("kin_kabi.png");
  ingredients[9] = loadImage("hamburger_goods_bun1.png");
  rice = loadImage("food_gohan.png");
  burger = loadImage("タワーバーガー.png");
  life = loadImage("heart_blur.png");
  star = loadImage("スター.png");

  for (int i = 0; i <= 9; i++) {
    if (i <= 5|| i == 9) {
      ingredients[i].resize(ow, oh);
    } else {
      ingredients[i].resize(70, 70);
    }
  }
  rice.resize(100, 100);
  burger.resize(500, height);
  kichen.resize(width, height);
  life.resize(50, 50);
  star.resize(70, 70);

  player = minim.loadFile("今日の料理.mp3");
  gameClear = minim.loadFile("ゲームクリア.mp3");
  gameOver = minim.loadFile("ゲームオーバー.mp3");
  fever = minim.loadFile("フィーバーモード.mp3");

  String initFile = dataPath("") + "\\test.txt";//書き込むファイルの置いてあるところ
  file = initFile;
  textScoreData = loadStrings( file );
  for (int i = 0; i < 13; i++) {
    data[i] = Integer.valueOf(textScoreData[i]);
  }

  if ( textScoreData == null ) { //text ファイルロード失敗
    println( "\n" + file + "読み込み失敗" );
    exit();
  }
  data = reverse(sort(data));/*textファイルに書き込まれたスコアを大きい順に並び替える
   →小さい順に書き込んだものを逆にしている*/
}

void draw() {
  image(kichen, 0, 0);
  if ( gseq == 0 ) {
    gamePlay();
  } else if ( gseq == 1 ) { //hpがなくなったっとき
    gameOver();
    fever.rewind();
    fever.pause();
    player.pause();
  } else if ( gseq == 2 ) { //クリアしたとき
    gameClear();
    fever.rewind();
    fever.pause();
    player.pause();
  }
  //　↓後から付け足した　最初の画面
  else if (gseq == 3) {
    gameStart();
    player.rewind();
    fever.rewind();
    player.pause();
    fever.pause();
  } else if (gseq == 4) {
    Rule_description();
    player.rewind();
    fever.rewind();
    player.pause();
    fever.pause();
  } else if (gseq == 5) {
    gameOperat();
  }
}   
