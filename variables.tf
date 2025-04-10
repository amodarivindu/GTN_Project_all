variable "aws_region" {
  description = "The AWS region to deploy to"
  type        = string
  default     = "us-east-1"
}

variable "execution_role_arn" {
  description = "IAM role ARN that ECS uses to pull images and run tasks"
  type        = string
}

variable "app_image" {
  description = "Docker image URI for the app"
  type        = string
}

variable "subnet_ids" {
  description = "List of subnet IDs for ECS service"
  type        = list(string)
}

variable "security_group_id" {
  description = "Security group ID for the ECS service"
  type        = string
}
