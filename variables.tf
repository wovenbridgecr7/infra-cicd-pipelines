variable "client_secret" {
type = string
description = "pass to azure service principal"
default = "02o8Q~nTtXvSWLbGnQKsB6u4Iduxy.BEkIYNTaTv"
sensitive = true
}


variable "rg_name" {
    type = string
}

variable "vnet_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "interf_name" {
  type = string
}

variable "sg_name" {
  type = string
}