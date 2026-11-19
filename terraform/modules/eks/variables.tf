variable "cluster_name" {
  type = string
}

variable "kubernetes_version" {
  type    = string
  default = "1.37"
}

variable "vpc_id" {
  type = string
}

variable "vpc_cidr" {
  type = string
}

variable "private_subnet_ids" {
  type = list(string)
}

variable "node_instance_types" {
  type    = list(string)
  default = ["c7i.large"]
}

variable "capacity_type" {
  type    = string
  default = "ON_DEMAND"
}

variable "node_desired_count" {
  type    = number
  default = 2
}

variable "node_min_count" {
  type    = number
  default = 1
}

variable "node_max_count" {
  type    = number
  default = 5
}

variable "public_endpoint" {
  type    = bool
  default = false
}

variable "public_access_cidrs" {
  type    = list(string)
  default = []
}

variable "tags" {
  type    = map(string)
  default = {}
}

# NEW: how people/roles get access to Kubernetes objects.
# Must match the mode the live cluster uses today.
variable "authentication_mode" {
  type        = string
  default     = "API_AND_CONFIG_MAP"
  description = "EKS access mode: CONFIG_MAP, API_AND_CONFIG_MAP or API"
}

# NEW: IAM users/roles that get cluster admin through EKS access entries.
# Do not list the identity that created the cluster (it already has access).
variable "admin_principal_arns" {
  type        = list(string)
  default     = []
  description = "IAM users/roles that get cluster admin through EKS access entries"
}
