variable "aws_region" {
  description = "The AWS region"
  type        = string
  default     = "us-west-2"
}

variable "custom_tags" {
  description = "Custom tags to set on the vpc"
  type        = map(string)
  default = {
    Example = "yes"
  }
}

variable "key_name" {
  description = "The name of the key pair"
  type        = string
  default     = "examples_test"
}

variable "env" {
  description = "The service env (e.g. 'dev')"
  type        = string
  default     = "test"
}

variable "org_name_underscore" {
  description = "The name of the org, delimited with underscores (e.g. 'org_name')"
  type        = string
  default     = "org_name"
}

variable "public_key" {
  description = "The public key of the key pair"
  type        = string
  default     = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQDUVyIwMtLdjCo/6mIZLt8O7dATYeZyxJpNeWhmosECe/ny4yNVclv9kfbUUJ/cnrvzU3xBDVRdyrD4AIRemado/K83OmRz62BJroJMoeun0ahnmT9cRPl1dfYgIw6cAHIqBvQp10bK9coj/MCr+2iKtFwj0q5kQlfz1q97+4zcoY10ZsKAlDCVI+gtydF1oA9I6YcxbUnEUFV4hytCefYGprNDukj2sJZGkF4i7BYfdgrOSFzTwsA+RcssnkyLjuVbnyVqtCeYlko790U2foRHEK4G/UKfrgmzpu7mJVfyPPtg6B3MN5JWJhW/e0KLkFLumbF1Tz9a9Cxt5f7x3ct5LFw7eTuIpRrwiIbCT5ICQ/Bbt+O3WAjCbqBhShzwIDtNBdrbQIADDj2Mp003PCpRWHssanXNhy80FvVG+OjWh+z0OP1vvalJIEdfqPx4K7arR7UBYQhN065oUcy9M0ZtSIq3X/WxFGlURfGbTGI1cyWw1XDGLEApuNuOOBZJztQlFV7HQgnTAOLhH0uV6fXfQC+X5hKQxW0INMBrADnu6YQl5OCRQwlg6FgA7RHDDhkOXRkVGKLjZCwrHqBuz1FDZpoKsWpxXBudBaTVW0Tn7PSJoC6dxPPveIGrzz60E/iR3WhW5WRU1NKSurWO9/GseUUeDFuQuSsSe8zeZoVAbQ== percygrunwald-percygrunwald-test-github_actions"
}

variable "team_name_underscore" {
  description = "The name of the team, delimited with underscores (e.g. 'team_name')"
  type        = string
  default     = "team_name"
}
