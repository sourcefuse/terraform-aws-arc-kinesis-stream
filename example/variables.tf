################################################################################
## shared
################################################################################
variable "project_name" {
  type        = string
  description = "Name of the project."
}

variable "region" {
  type        = string
  default     = "us-east-1"
  description = "AWS region"
}

variable "environment" {
  type        = string
  default     = "poc"
  description = "ID element. Usually used for region e.g. 'uw2', 'us-west-2', OR role 'prod', 'staging', 'dev', 'UAT'"
}

variable "namespace" {
  type        = string
  description = "Namespace for the resources."
  default     = "arc"
}
variable "shard_count" {
  description = "The number of shards that the stream will use"
  type        = number
  default     = 2
}
variable "consumer_count" {
  description = "Number of consumers to register with Kinesis stream"
  type        = number
  default     = 0
}
