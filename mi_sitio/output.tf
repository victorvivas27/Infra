output "bucket_name" {
  description = "El nombre del bucket S3 es usado para alojar el contenido."
  value       = module.mi_sitio.bucket_name
}