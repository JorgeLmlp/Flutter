class Pet {
  int energia = 50, fome = 50;

  void brincar() {
    if(energia > 0)
    {
    energia -= 10;
    }
  }

  void alimentar() {
    if (fome > 0)
    {

    fome -= 10;
    }
  }
}
