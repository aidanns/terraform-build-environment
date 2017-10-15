# Configure the Docker provider.
provider "docker" {
  host = "unix:///var/run/docker.sock"
  version = "~> 0.1"
}

# Create a container for Gitlab.
resource "docker_container" "gitlab" {
  image = "${docker_image.centos7.latest}"
  name = "gitlab"
  hostname = "gitlab.local"
  must_run = true

  ports {
    internal = 22
    external = 2022
  }

  ports {
    internal = 443
    external = 2443
  }

  ports {
    internal = 80
    external = 2080
  }

  # Needed so that we can start systemd in the container.
  # TODO(aidanns): Try using only capabilities here.
  privileged = true

  # Start systemd inside the container.
  command = ["/sbin/init"]
  
#  provisioner "local-exec" {
#    command = "./bootstrap_docker_container.sh -c ${docker_container.gitlab.name}"
#  }
}

resource "docker_image" "centos7" {
  name = "centos:centos7"
  keep_locally = true
}
