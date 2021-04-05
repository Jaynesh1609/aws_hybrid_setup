resource "aws_s3_bucket" "task2bucket1" {
    bucket = var.bucketname
    acl = "public-read"
    versioning {
        enabled = true
    }
    tags = {
        Name = var.bucketname
        Environment = "hybrid_Setup"
    }
}

resource "null_resource" "locally-exec" {
    depends_on = [aws_s3_bucket.task2bucket1]
    provisioner "local-exec" {
        command = "https://github.com/Jaynesh1609/aws_hybrid_setup.git"   #change by your own with 
    }
}

resource "aws_s3_bucket_object" "upload_file" {
    depends_on = [aws_s3_bucket.task2bucket1 , null_resource.local-exec]
    bucket = "devOps.jpg"
    source = "K:\DEVOPS\Terraform\My personal project\demo_path\terraform_aws_hybridsetup/devops.jpg"   #this may also be chnage 
    acl = "public-read"
}


output "Image" {
    value  = aws_s3_bucket_object.upload_file
}