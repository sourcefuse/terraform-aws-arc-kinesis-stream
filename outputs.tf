output "name" {
  description = "Name of the Kinesis stream."
  value       = aws_kinesis_stream.this.name
}

output "shard_count" {
  description = "Number of shards provisioned."
  value       = try(aws_kinesis_stream.this.shard_count, null)
}

output "stream_arn" {
  description = "ARN of the Kinesis stream."
  value       = aws_kinesis_stream.this.arn
}

output "consumers" {
  description = "List of consumers registered with Kinesis stream."
  value       = aws_kinesis_stream_consumer.this
}
