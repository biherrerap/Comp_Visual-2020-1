PImage img;
PImage avgImage;
PImage lumaImage;

void setup() {
  img = loadImage("/home/inkremental/Descargas/abc.jpeg");
  avgImage = loadImage("/home/inkremental/Descargas/abc.jpeg");
  lumaImage = loadImage("/home/inkremental/Descargas/abc.jpeg");
  img.resize(500, 400);
  avgImage.resize(500, 400);
  lumaImage.resize(500, 400);
  size(1500, 400);
}

void draw() {
  
  image(avgImage, img.width, 0);
  int total_image = width*height;
  loadPixels();
  for (int i = 0; i < total_image; i++) {
    color p = pixels[i];
    float r = red(p);
    float g = green(p);
    float b = blue(p);
    float nc = (r + g +b)/3.0;
    pixels[i] = color(nc);
  }
  updatePixels();
  
  
  image(lumaImage,img.width + avgImage.width,0);
  int lumaImage = width*height;
    
   loadPixels();

  float val_red_luma = 0.2126;
  float val_green_luma = 0.7152;
  float val_blue_luma = 0.0722;
  
    for(int i = 0; i < lumaImage; i++) {
        color p = pixels[i];
        float r = red(p) * val_red_luma;
        float g = green(p) * val_green_luma;
        float b = blue(p) * val_blue_luma;
        float sum_luma = r+g+b;
        pixels[i] = color(sum_luma);
    }
    
  updatePixels();

  image(img, 0, 0);
}
