# Configure the Docker provider.
provider "docker" {
  host = "unix:///var/run/docker.sock"
  version = "~> 0.1"
}

# Create a container for Gitlab.
resource "docker_container" "gitlab" {
  image = "${docker_image.centos6.latest}"
  name = "gitlab"
  # Ensures that the container doesn't exit.
  command = ["tail", "-f", "/dev/null"]
  
  provisioner "local-exec" {
    command = "docker exec gitlab ./bootstrap_docker_container.sh"
  }
}

resource "docker_image" "centos6" {
  name = "centos:centos6"
}
