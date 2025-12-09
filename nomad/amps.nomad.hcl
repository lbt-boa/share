job "amps" {
  type = "service"
  constraint {
    attribute = "${meta.has.everything}"
    value = "True"
  }
  group "amps" {
    count = 1
    volume "efs" {
      type      = "host"
      source    = "efs"
      read_only = true
    }

    network {
      port "web" { to = 8085 }
      port "fix-tcp" { to = 9004 }
      port "nvfix-tcp" { to = 9005 }
      port "soap-tcp" { to = 9006 }
      port "json-tcp" { to = 9007 }
      port "composite-json-binary-tcp" { to = 9017 }
      port "amps-any-type-tcp" { to = 9027 }
      port "amps-any-type-websocket" { to = 9028 }
    }
    service {
      name     = "amps-web"
      port     = "web"
      provider = "nomad"
    }
    service {
      name     = "amps-fix-tcp"
      port     = "fix-tcp"
      provider = "nomad"
    }
    service {
      name     = "amps-nvfix-tcp"
      port     = "nvfix-tcp"
      provider = "nomad"
    }
    service {
      name     = "amps-soap-tcp"
      port     = "soap-tcp"
      provider = "nomad"
    }
    service {
      name     = "amps-json-tcp"
      port     = "json-tcp"
      provider = "nomad"
    }
    service {
      name     = "amps-composite-json-binary-tcp"
      port     = "composite-json-binary-tcp"
      provider = "nomad"
    }
    service {
      name     = "amps-amps-any-type-tcp"
      port     = "amps-any-type-tcp"
      provider = "nomad"
    }
    service {
      name     = "amps-amps-any-type-websocket"
      port     = "amps-any-type-websocket"
      provider = "nomad"
    }

    task "amps-task" {
      driver = "exec"
      # artifact {
      #   source      = "http://127.0.0.1:6666/efs/amps/AMPS-5.3.5.27-Release-Linux.tar.gz"
      # 	destination = "local/amps"
      # }
      # artifact {
      #   source      = "http:localhost:6666/efs/amps/nomad.config.xml"
      # }
      config {
        command = "efs/amps/AMPS-5.3.5.27-Release-Linux/bin/ampServer"
	args    = ["efs/amps/nomad.config.xml"]
      }

      volume_mount {
        volume      = "efs"
        destination = "efs"
        read_only = true
      }
    }
  }
}
