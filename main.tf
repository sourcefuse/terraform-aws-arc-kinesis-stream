resource "aws_kinesis_stream" "this" {

  name                      = local.stream_name
  shard_count               = var.stream_mode != "ON_DEMAND" ? var.shard_count : null
  retention_period          = var.retention_period
  shard_level_metrics       = var.shard_level_metrics
  enforce_consumer_deletion = var.enforce_consumer_deletion
  encryption_type           = var.encryption_type
  kms_key_id                = var.kms_key_id

  dynamic "stream_mode_details" {
    for_each = var.stream_mode != null ? ["set"] : []
    content {
      stream_mode = var.stream_mode
    }
  }

  tags = var.tags
}

resource "aws_kinesis_stream_consumer" "this" {
  count = var.consumer_count // This allows you to dynamically control the number of Kinesis stream consumers

  name       = format("%s-consumer-%s", local.stream_name, count.index)
  stream_arn = aws_kinesis_stream.this.arn
}
