import java.lang.*;
import processing.video.*;
import org.opencv.core.*;
import java.util.Random;

Capture cam;
int dimension;
int normal, invertido, random, estado, limite, i, n, r;
Random rand;

void setup(){
  size(400, 400);
  cam = new Capture(this, width, height);
  cam.start();
  dimension = cam.width * cam.height;
  rand = new Random();
  limite = 3;
  normal = 0;
  invertido = 1;
  random = 2;
  estado = normal;
}

void draw(){
  if(cam.available()){
    background(0);
    cam.read();
    cam.loadPixels();
    
    switch(estado){
      case 0:
        cam.loadPixels();
        break;
      case 1:
        for(int i = 1; i < dimension; i++){
          float n1 = 255 - red(cam.pixels[i]); 
          float n2 = 255 - green(cam.pixels[i]); 
          float n3 = 255 - blue(cam.pixels[i]);
          cam.pixels[i] = color(n1, n2, n3);
        }
        cam.updatePixels();
        break;
        
       case 2:
          for(int i = 1; i < dimension; i++){
            float n1 = red(cam.pixels[i]) * rand.nextInt(limite); 
            float n2 = green(cam.pixels[i]) * rand.nextInt(limite); 
            float n3 = blue(cam.pixels[i]) * rand.nextInt(limite);
            cam.pixels[i] = color(n1, n2, n3);
          }
          cam.updatePixels();
          break;
    } 
  }
  image(cam, 0, 0);
  actualizar_filtro();
}

void actualizar_filtro(){
  if (i == 1) estado = invertido;
  if (r == 1) estado = random;
  if (n == 1) estado = normal;
}

void keyPressed(){
  if(keyCode == 73){
    i = 1;
  }if(keyCode == 78){
    n = 1;
  }if(keyCode == 82){
    r = 1;
  }
}

void keyReleased(){
  if(keyCode == 73){
    i = 0;
  }if(keyCode == 78){
    n = 0;
  }if(keyCode == 82){
    r = 0;
  }
}
