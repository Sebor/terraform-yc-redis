resource "yandex_mdb_redis_cluster" "this" {
  name        = var.cluster_name
  description = var.cluster_description
  environment = var.cluster_environment
  folder_id   = var.cluster_folder_id

  network_id         = var.cluster_network_id
  security_group_ids = var.cluster_security_group_ids
  sharded            = var.cluster_sharded
  tls_enabled        = var.cluster_tls_enabled
  persistence_mode   = var.cluster_persistence_mode
  announce_hostnames = var.cluster_announce_hostnames

  deletion_protection = var.cluster_deletion_protection

  config {
    version  = var.cluster_version
    password = var.cluster_password

    timeout                           = var.cluster_timeout
    maxmemory_policy                  = var.cluster_maxmemory_policy
    notify_keyspace_events            = var.cluster_notify_keyspace_events
    slowlog_max_len                   = var.cluster_slowlog_max_len
    databases                         = var.cluster_databases
    client_output_buffer_limit_normal = var.cluster_client_output_buffer_limit_normal
    client_output_buffer_limit_pubsub = var.cluster_client_output_buffer_limit_pubsub
  }

  dynamic "host" {
    for_each = var.hosts

    content {
      zone             = host.value.zone
      subnet_id        = host.value.subnet_id
      shard_name       = host.value.shard_name
      replica_priority = host.value.replica_priority
      assign_public_ip = host.value.assign_public_ip
    }
  }

  resources {
    resource_preset_id = var.cluster_resource_preset_id
    disk_size          = var.cluster_disk_size
    disk_type_id       = var.cluster_disk_size_type
  }

  dynamic "maintenance_window" {
    for_each = var.cluster_maintenance_windows

    content {
      type = lookup(maintenance_window.value, "type", "WEEKLY")
      day  = lookup(maintenance_window.value, "day", null)
      hour = lookup(maintenance_window.value, "hour", null)
    }
  }

  labels = var.labels
}
