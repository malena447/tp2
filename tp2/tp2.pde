//Malena Caniu Fernandez  - Comision 1

PImage so1;
PImage so2;
PImage so3;

PFont texto;

int posX= 640;
int posY= 480;

int ancho = 64;
int alto = 48;
int tamtexto = 25;
int movimiento = 0;

boolean empujar = false;
boolean mostrarimagen= false;

int aparece = 0; 
int textoY;
int so2X;

boolean subirtexto = false;
int tiempoimagen= 2;

color rojo= color(100,0,0);
color azul= color(0,0,200);
color negro= color(0);
color verde= color(0,255,0);

String mitexto1, mitexto2, mitexto3;

void setup() {
  size(640, 480);
  background(255);
so1= loadImage("so1.jpg");
so2 = loadImage("so2.jpg");
so3= loadImage("so3.png");
  
  mitexto1= ("Solar Opposites");
  mitexto2= ("Creada por Justin Roiland \ny ThomasMiddlethich" );
  mitexto3= ("Producido by Hulu \n ¿La vida extraterrestre en la tierra es peor o mejor?");
  
  texto= loadFont ("CenturyGothic-Bold-25.vlw");
  
  textAlign(CENTER, CENTER);
  textoY = height + 50;
}
void draw() {
  background(255);
  if (ancho >= width && alto >= height && tamtexto >= 25) {
    if (!empujar) {
      empujar = true;
      aparece = frameCount;
    }
  }
  if (empujar && movimiento < width) {
    movimiento += 2;
  }
  if (empujar && !mostrarimagen) {
    
    image(so2, 0,0, width, height);
    textAlign(posX= (-10)+ movimiento, posY= 0);
    fill(negro);
    textFont(texto);
    textSize(20); 
    text(mitexto2 ,posX/2,height / 2);
    
    if (frameCount - aparece >= 600) {
      mostrarimagen = true;
      subirtexto = true;
      tiempoimagen = frameCount;
    }
  }
  if (mostrarimagen) {
    image(so3, 0, 0, width, height);
    if (subirtexto) {
      if (textoY > height / 2) {
        textoY -= 2;
      } else {
        textoY = height / 2;
        subirtexto = false;
      }
    }
    fill(negro);
    textFont(texto);
    textSize(20);
    textAlign(CENTER, CENTER);
    text(mitexto3, 300, textoY);
  
  }
  int x = (width - ancho) / 2 + movimiento;
  int y = (height - alto) / 2;
  image(so1, x, y, ancho, alto);
  textFont(texto);
  textAlign(CENTER, CENTER);
  fill(negro);
  textSize(20);
  text(mitexto1, 300 + 1 +movimiento , 200 + 1+movimiento);
  if (ancho < width) ancho += 8;
  if (alto < height) alto += 3;
  if (tamtexto < 25) tamtexto += 1;
}
