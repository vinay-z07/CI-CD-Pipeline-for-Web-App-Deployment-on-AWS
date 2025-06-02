variable "aws_region" {
  description = "AWS region to deploy into"
  type        = string
  default     = "us-east-1"
}

variable "ami_id" {
  description = "AMI ID for Ubuntu (e.g., from AWS Console)"
  type        = string
}

variable "public_key_path" {
  description = "Path to your local public SSH key"
  type        = string
}
