module "networking" {
  source               = "../Modules/networking"
  project_name         = "dummy-data-api"
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidrs  = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidrs = ["10.0.3.0/24", "10.0.4.0/24"]
  availability_zones   = ["us-east-1a", "us-east-1b"]
}

module "ecs" {
  source                = "../Modules/ecs"
  project_name          = "dummy-data-api"
  container_image       = "123456789.dkr.ecr.us-east-1.amazonaws.com/dummy-api:latest"
  cpu                   = 256
  memory                = 512
  desired_count         = 2
  private_subnet_ids    = module.networking.private_subnet_ids
  ecs_security_group_id = module.networking.ecs_security_group_id
  target_group_arn      = module.alb.target_group_blue_arn  # This should now work
  secret_arn            = "arn:aws:secretsmanager:us-east-1:123456789:secret:API_SECRET_KEY"
}


module "alb" {
  source                = "../Modules/alb"
  project_name          = "dummy-data-api"
  vpc_id                = module.networking.vpc_id
  public_subnet_ids     = module.networking.public_subnet_ids
  alb_security_group_id = module.alb.alb_security_group_id
}

module "api_gateway" {
  source                 = "../Modules/api_gateway"
  project_name           = "dummy-data-api"
  alb_dns_name           = module.alb.alb_dns_name
  cognito_user_pool_arn  = module.cognito.cognito_user_pool_arn
  rate_limit             = 10
  burst_limit            = 20
}

module "cognito" {
  source       = "../Modules/cognito"
  project_name = "dummy-data-api"
}

module "waf" {
  source          = "../Modules/waf"
  project_name    = "dummy-data-api"
  rate_limit      = 1000
  api_gateway_arn = module.api_gateway.api_gateway_id
}

module "ecr" {
  source           = "../Modules/ecr"
  repository_name  = "dummy-api"
}

