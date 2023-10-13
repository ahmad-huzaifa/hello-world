resource "ssh_resource" "ssh_host" {

  host        = "ec2-54-204-157-249.compute-1.amazonaws.com"
  user        = "ubuntu"
  private_key = file("${var.SSH_KEY}")

  timeout     = "15m"
  retry_delay = "5s"

  commands = [
    "sudo snap install docker",
    "sudo docker run -d --name alpine-container alpine:latest sleep infinity"
  ]
}

terraform {
  required_providers {
    ssh = {
      source  = "loafoe/ssh"
      version = "2.6.0"
    }
  }
}