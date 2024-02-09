# Redis

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.5.0 |
| <a name="requirement_yandex"></a> [yandex](#requirement\_yandex) | >= 0.107 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_yandex"></a> [yandex](#provider\_yandex) | >= 0.107 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [yandex_mdb_redis_cluster.this](https://registry.terraform.io/providers/yandex-cloud/yandex/latest/docs/resources/mdb_redis_cluster) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cluster_announce_hostnames"></a> [cluster\_announce\_hostnames](#input\_cluster\_announce\_hostnames) | Announce fqdn instead of ip address | `bool` | `null` | no |
| <a name="input_cluster_client_output_buffer_limit_normal"></a> [cluster\_client\_output\_buffer\_limit\_normal](#input\_cluster\_client\_output\_buffer\_limit\_normal) | Normal clients output buffer limits. See redis config file | `any` | `null` | no |
| <a name="input_cluster_client_output_buffer_limit_pubsub"></a> [cluster\_client\_output\_buffer\_limit\_pubsub](#input\_cluster\_client\_output\_buffer\_limit\_pubsub) | Pubsub clients output buffer limits. See redis config file | `any` | `null` | no |
| <a name="input_cluster_databases"></a> [cluster\_databases](#input\_cluster\_databases) | Number of databases (changing requires redis-server restart) | `number` | `null` | no |
| <a name="input_cluster_deletion_protection"></a> [cluster\_deletion\_protection](#input\_cluster\_deletion\_protection) | Inhibits deletion of the cluster | `bool` | `null` | no |
| <a name="input_cluster_description"></a> [cluster\_description](#input\_cluster\_description) | A description of the Redis cluster | `string` | `"Redis cluster managed by terraform"` | no |
| <a name="input_cluster_disk_size"></a> [cluster\_disk\_size](#input\_cluster\_disk\_size) | Volume of the storage available to a host, in gigabytes | `number` | `20` | no |
| <a name="input_cluster_disk_size_type"></a> [cluster\_disk\_size\_type](#input\_cluster\_disk\_size\_type) | Type of the storage of Redis hosts - environment default is used if missing. | `string` | `null` | no |
| <a name="input_cluster_environment"></a> [cluster\_environment](#input\_cluster\_environment) | Deployment environment of the Redis cluster.<br>  Can be either PRESTABLE or PRODUCTION. The default is PRODUCTION | `string` | `"PRODUCTION"` | no |
| <a name="input_cluster_folder_id"></a> [cluster\_folder\_id](#input\_cluster\_folder\_id) | The ID of the folder that the Redis cluster belongs to | `string` | `null` | no |
| <a name="input_cluster_maintenance_windows"></a> [cluster\_maintenance\_windows](#input\_cluster\_maintenance\_windows) | Maintenance policy of the Redis cluster<br>  Example:<pre>cluster_maintenance_windows = {<br>      type = "WEEKLY"<br>      day  = "MON<br>      hour = "17"<br>  }</pre> | `map(any)` | `{}` | no |
| <a name="input_cluster_maxmemory_policy"></a> [cluster\_maxmemory\_policy](#input\_cluster\_maxmemory\_policy) | Redis key eviction policy for a dataset that reaches maximum memory. Can be any of the listed in the official RedisDB documentation | `string` | `null` | no |
| <a name="input_cluster_name"></a> [cluster\_name](#input\_cluster\_name) | Redis cluster name and name prefix for cluster resources | `string` | n/a | yes |
| <a name="input_cluster_network_id"></a> [cluster\_network\_id](#input\_cluster\_network\_id) | ID of the network, to which the Redis cluster belongs | `string` | n/a | yes |
| <a name="input_cluster_notify_keyspace_events"></a> [cluster\_notify\_keyspace\_events](#input\_cluster\_notify\_keyspace\_events) | Select the events that Redis will notify among a set of classes | `string` | `null` | no |
| <a name="input_cluster_password"></a> [cluster\_password](#input\_cluster\_password) | Password for the Redis cluster | `string` | n/a | yes |
| <a name="input_cluster_persistence_mode"></a> [cluster\_persistence\_mode](#input\_cluster\_persistence\_mode) | Persistence mode | `bool` | `null` | no |
| <a name="input_cluster_resource_preset_id"></a> [cluster\_resource\_preset\_id](#input\_cluster\_resource\_preset\_id) | The ID of the preset for computational resources available to a host (CPU, memory etc.) | `string` | `"b3-c1-m4"` | no |
| <a name="input_cluster_security_group_ids"></a> [cluster\_security\_group\_ids](#input\_cluster\_security\_group\_ids) | List of security group IDs to be assigned to cluster | `list(string)` | `null` | no |
| <a name="input_cluster_sharded"></a> [cluster\_sharded](#input\_cluster\_sharded) | Redis Cluster mode enabled/disabled | `bool` | `null` | no |
| <a name="input_cluster_slowlog_max_len"></a> [cluster\_slowlog\_max\_len](#input\_cluster\_slowlog\_max\_len) | Slow queries log length | `string` | `null` | no |
| <a name="input_cluster_timeout"></a> [cluster\_timeout](#input\_cluster\_timeout) | Close the connection after a client is idle for N seconds | `number` | `null` | no |
| <a name="input_cluster_tls_enabled"></a> [cluster\_tls\_enabled](#input\_cluster\_tls\_enabled) | TLS support mode enabled/disabled | `bool` | `null` | no |
| <a name="input_cluster_version"></a> [cluster\_version](#input\_cluster\_version) | Version of the Redis cluster | `string` | n/a | yes |
| <a name="input_hosts"></a> [hosts](#input\_hosts) | Hosts configuration | <pre>list(object({<br>    zone             = string<br>    subnet_id        = optional(string)<br>    shard_name       = optional(string)<br>    replica_priority = optional(string)<br>    assign_public_ip = optional(bool)<br>  }))</pre> | n/a | yes |
| <a name="input_labels"></a> [labels](#input\_labels) | A set of key/value label pairs to assign to the cluster resources | `map(any)` | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_hosts"></a> [hosts](#output\_hosts) | Cluster hosts |
| <a name="output_id"></a> [id](#output\_id) | Cluster ID |
<!-- END_TF_DOCS -->