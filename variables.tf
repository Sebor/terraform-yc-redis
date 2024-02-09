variable "cluster_name" {
  type        = string
  description = "Redis cluster name and name prefix for cluster resources"
}

variable "cluster_password" {
  type        = string
  description = "Password for the Redis cluster"
}

variable "cluster_description" {
  type        = string
  default     = "Redis cluster managed by terraform"
  description = "A description of the Redis cluster"
}

variable "cluster_resource_preset_id" {
  type        = string
  default     = "b3-c1-m4"
  description = "The ID of the preset for computational resources available to a host (CPU, memory etc.)"
}

variable "cluster_disk_size" {
  type        = number
  default     = 20
  description = "Volume of the storage available to a host, in gigabytes"
}

variable "cluster_disk_size_type" {
  type        = string
  default     = null
  description = "Type of the storage of Redis hosts - environment default is used if missing."
}

variable "cluster_folder_id" {
  type        = string
  default     = null
  description = "The ID of the folder that the Redis cluster belongs to"
}

variable "cluster_environment" {
  type        = string
  default     = "PRODUCTION"
  description = <<EOF
  Deployment environment of the Redis cluster.
  Can be either PRESTABLE or PRODUCTION. The default is PRODUCTION
  EOF

  validation {
    condition     = contains(["PRODUCTION", "PRESTABLE"], var.cluster_environment)
    error_message = "Environment must be 'PRODUCTION' or 'PRESTABLE'."
  }
}

variable "cluster_network_id" {
  type        = string
  description = "ID of the network, to which the Redis cluster belongs"
}

variable "cluster_version" {
  type        = string
  description = "Version of the Redis cluster"
}

variable "cluster_sharded" {
  type        = bool
  default     = null
  description = "Redis Cluster mode enabled/disabled"
}

variable "cluster_tls_enabled" {
  type        = bool
  default     = null
  description = "TLS support mode enabled/disabled"
}

variable "cluster_persistence_mode" {
  type        = bool
  default     = null
  description = "Persistence mode"
}

variable "cluster_announce_hostnames" {
  type        = bool
  default     = null
  description = "Announce fqdn instead of ip address"
}

variable "cluster_deletion_protection" {
  type        = bool
  default     = null
  description = "Inhibits deletion of the cluster"
}

variable "cluster_security_group_ids" {
  type        = list(string)
  default     = null
  description = "List of security group IDs to be assigned to cluster"
}

variable "cluster_maintenance_windows" {
  type        = map(any)
  default     = {}
  description = <<EOF
  Maintenance policy of the Redis cluster
  Example:
  ```
  cluster_maintenance_windows = {
      type = "WEEKLY"
      day  = "MON
      hour = "17"
  }
  ```
  EOF
}

variable "hosts" {
  type = list(object({
    zone             = string
    subnet_id        = optional(string)
    shard_name       = optional(string)
    replica_priority = optional(string)
    assign_public_ip = optional(bool)
  }))
  description = "Hosts configuration"
}

variable "labels" {
  type        = map(any)
  default     = null
  description = "A set of key/value label pairs to assign to the cluster resources"
}

variable "cluster_client_output_buffer_limit_pubsub" {
  type        = any
  default     = null
  description = "Pubsub clients output buffer limits. See redis config file"
}

variable "cluster_client_output_buffer_limit_normal" {
  type        = any
  default     = null
  description = "Normal clients output buffer limits. See redis config file"
}

variable "cluster_databases" {
  type        = number
  default     = null
  description = "Number of databases (changing requires redis-server restart)"
}

variable "cluster_slowlog_max_len" {
  type        = string
  default     = null
  description = "Slow queries log length"
}

variable "cluster_notify_keyspace_events" {
  type        = string
  default     = null
  description = "Select the events that Redis will notify among a set of classes"
}

variable "cluster_maxmemory_policy" {
  type        = string
  default     = null
  description = "Redis key eviction policy for a dataset that reaches maximum memory. Can be any of the listed in the official RedisDB documentation"
}

variable "cluster_timeout" {
  type        = number
  default     = null
  description = "Close the connection after a client is idle for N seconds"
}
