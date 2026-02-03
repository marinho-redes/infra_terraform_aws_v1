#=============================================================
#Informações úteis da infraestrutura informadas no pós-apply
#=============================================================

output "ec2_public_ip" {
  value       = aws_instance.web.public_ip
  description = "IP público da EC2"
}

output "artifact_bucket_name" {
  description = "Nome do bucket S3 para artefatos"
  value       = aws_s3_bucket.artifact_bucket.bucket
}