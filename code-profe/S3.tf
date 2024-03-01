resource "aws_s3_bucket" "victor-bucket" {
  bucket = "${var.nombre}-vivas"
}
