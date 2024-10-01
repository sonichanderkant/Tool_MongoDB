variable "vpc_id" {
  type = string
}

variable "Public_ingress_port" {
  type    = list(number)
  default = ["22","443","80"] 
}

variable "Public_ingress_cidr_block" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "Public_SG_name" {
  type    = string
}

variable "Private_ingress_port" {
  type    = list(number)
  default = ["22","27017"]
}

variable "Private_ingress_cidr_block" {
  type = list(string)
  default = ["0.0.0.0/0"]
}

variable "Private_SG_name" {
  type    = string
}

variable "vpc_id-01" {
  type = string
}
