resource "aws_ecr_repository" "my_docker_repo" {
  name                 = "my_docker_repo"
  image_tag_mutability = "MUTABLE"

  image_scanning_configuration {
    scan_on_push = true
  }
}