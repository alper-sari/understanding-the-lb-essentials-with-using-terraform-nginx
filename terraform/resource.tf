provider "google" {
   project     = "<your-project-id>"
   region      = "us-central1-c"
}


resource "google_compute_instance" "web-1" {
   name = "web-1"
   machine_type = "n1-standard-1"
   zone = "us-central1-c"
   tags = ["http-server"]
   boot_disk {
     initialize_params {
       image = "ubuntu-2004-focal-v20240110"
       size  = 30
       type  = "pd-balanced"
     }
   }
   network_interface {
     network = "default"
     subnetwork = "default"
     access_config {
      network_tier = "PREMIUM"
    }
    
   }
   metadata_startup_script = local.startup_script_content_ws
}

resource "google_compute_instance" "web-2" {
   name = "web-2"
   machine_type = "n1-standard-1"
   zone = "us-central1-c"
   tags = ["http-server"]
   boot_disk {
     initialize_params {
       image = "ubuntu-2004-focal-v20240110"
       size  = 30
       type  = "pd-balanced"
     }
   }
   network_interface {
     network = "default"
     subnetwork = "default"
     access_config {
      network_tier = "PREMIUM"
    }
    
   }
    metadata_startup_script = local.startup_script_content_ws
   
}

resource "google_compute_instance" "nginx-lb" {
   name = "nginx-lb"
   machine_type = "n1-standard-1"
   zone = "us-central1-c"
   tags = ["http-server"]
   boot_disk {
     initialize_params {
       image = "ubuntu-2004-focal-v20240110"
       size  = 30
       type  = "pd-balanced"
     }
   }
   network_interface {
     network = "default"
     subnetwork = "default"
     access_config {
      network_tier = "PREMIUM"
    }
    
   }
   metadata_startup_script = local.startup_script_content_lb
}


locals {
  startup_script_path_ws = "../bash/nginx-web-server.sh"
  startup_script_content_ws = file(local.startup_script_path_ws)
  startup_script_path_lb = "../bash/nginx-load-balancer.sh"
  startup_script_content_lb = file(local.startup_script_path_lb)
}