output "id" {
  value       = yandex_mdb_redis_cluster.this.id
  description = "Cluster ID"
}

output "hosts" {
  value       = yandex_mdb_redis_cluster.this.host
  description = "Cluster hosts"
}
