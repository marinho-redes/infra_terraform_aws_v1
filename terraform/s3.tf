#=========================================================
# S3 Bucket para artefatos
#=========================================================
resource "aws_s3_bucket" "artifact_bucket" {
  bucket        = "devops-artifacts-raul-marinho-123456"
  force_destroy = true

  tags = {
    Name    = "devops-artifacts"
    Project = "Projeto DevOps1"
  }
}