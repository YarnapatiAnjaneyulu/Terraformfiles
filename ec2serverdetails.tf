variable "server_details" {
       type = map
       default = {
            "Server1" = {
                "name" = "app-server1"
                "type" = "t2.micro"
}
            "Server2" = {
                "name" = "db-server1"
                "type" = "t3.micro"
            }
     }
}
resource "aws_instance" "myec2" {
  for_each = var.server_details
  ami           = "ami-04681163a08179f28"
  instance_type = each.value.type
  tags = {
    Name = each.value.name
 }
}
