provider "aws" {}

resource "aws_instance" "test" {
  ami           = "ami-a21529cc"
  instance_type = "t2.micro"
}


provider "digitalocean" {}

resource "digitalocean_droplet" "test" {
    image = "ubuntu-14-04-x64"
    name = "test-1"
    region = "sgp1"
    size = "512mb"
}
