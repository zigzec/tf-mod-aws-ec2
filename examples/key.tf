resource "aws_key_pair" "this" {
  key_name   = local.key_name
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABAQDGD2KO449DvLYo0g4CVtQ9MQ8UypbsKM7V4+rUTrskF1OEEHRV1FQ+hvJb6f2S4KvA8g9+vYsPYpw5huxXsLODx+wK9IWBx4ukNQ9db5vTI7EDmKosNtDwcVSQkfkKxk3OyZ2KLpsC93G1Y5nJhHabipRCU6a7689q0kcIhqGpbA1r94Gx+V94BOoMRf8mAp0jZOmoLAMwv2+9MqzW7aIQlakMxhfmBEybdvLntsDZwGj1tNFShCi4ur6TDjM0Dpe7Hnwb4qaq4vMhhwcg8QxnKkTYxiVa0RtfIAne5Mg21NR4NC2U2fqmxxKHwferbseZCGavZ4mgf0WXMCubuJaj test-tf-only"
}
