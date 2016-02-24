template {
  source = "/templates/services.conf.ctmpl"
  destination = "/etc/nginx/sites-available/services.conf"
  command = "ln -sf /etc/nginx/sites-available/services.conf /etc/nginx/sites-enabled/services.conf;service nginx reload"
}
