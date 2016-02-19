template {
  source = "/templates/services.conf.ctmpl"
  destination = "/etc/nginx/sites-available/services.conf"
  command = "service nginx reload"
}
