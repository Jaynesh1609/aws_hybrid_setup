resource "aws_security_group" "sg_grp" {
    name = var.firewallname
    description = "this is for testing"


    ingress  {
        description = "SSH"
        from_port   =  22 
        to_port     =  22
        protocol    =  "tcp"
        cidr_block  =  ["0.0.0.0/0"]
    }


    ingress  {
        description = "HTTP PROTOCOL"
        from_port   =  80 
        to_port     =  80
        protocol    =  "tcp"
        cidr_block  =  ["0.0.0.0/0"]
    }


    ingress  {
        description = "HTTPS PROTOCOL"
        from_port   =  443
        to_port     =  443
        protocol    =  "tcp"
        cidr_block  =  ["0.0.0.0/0"]
    }

    egress {
        description = "egress connectivty"
        from_port   = 0
        to_port     = 0
        protocol    =-1
        cidr_block  = ["0.0.0.0/0"]
    }
    tags = {
        Name = var.firewallname
    }
}