bind_socket = "/var/run/rspamd/rspamd-proxy.sock mode=0666 owner=_rspamd";

upstream "local" {
  default = yes;
  hosts = "/var/run/rspamd/rspamd-normal.sock";
}
