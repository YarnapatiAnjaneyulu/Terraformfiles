variable "server_names" {
       type = list
       default = ["app-serve1","db-server1"]
}
resource "aws_instance" "myec2" {
  count = 2
  ami           = "ami-04681163a08179f28"
  instance_type = "t2.micro"
  tags = {
    Name = element(var.server_names,count.index)
 }
}
