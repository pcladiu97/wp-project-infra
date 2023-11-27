module "main_bucket" {
    source = "../tf-modules/bucket"

    project_region        = local.project_region
    tf_state_bucket_name  = "${local.project_id}-tf-state-bucket"
}

module "main_registry" {
    source = "../tf-modules/registry"

    project_name        = local.project_name
    project_id          = local.project_id
    project_zone        = local.project_zone
    project_region      = local.project_region

    repository_names    = ["aspnet-project-infra-registry", "wp-project-infra-registry"]
}