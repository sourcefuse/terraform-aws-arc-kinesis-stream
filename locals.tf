locals {
  environment = try(var.tags.environment, var.tags.Environment, var.tags.env, "")
  namespace   = try(var.tags.namespace, "")
  stream_name = local.namespace == "" ? "${local.environment}-${var.name}" : "${local.namespace}-${local.environment}-${var.name}"
}
