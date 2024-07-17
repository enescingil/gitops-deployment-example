# # Create an EKS cluster
# resource "aws_eks_cluster" "my_cluster" {
#     name     = "my-cluster"
#     role_arn = aws_iam_role.my_eks_role.arn
#     vpc_config {
#         subnet_ids = [aws_subnet.private_subnet.id]
#     }

#     # Node group configuration
#     enabled_cluster_log_types = ["api", "audit", "authenticator", "controllerManager", "scheduler"]
#     version                   = "1.21"
#     node_group {
#         name        = "my-node-group"
#         instance_types = ["t2.small"]
#         desired_capacity = 2
#         min_size = 2
#         max_size = 2
#         ami_type = "AL2_x86_64"
#         remote_access {
#             ec2_ssh_key = "my-key-pair"
#             source_security_group_ids = [aws_security_group.my_security_group.id]
#         }
#     }
# }

# Create an IAM role for EKS
# resource "aws_iam_role" "my_eks_role" {
#     name = "my-eks-role"
#     assume_role_policy = <<EOF
# {
#     "Version": "2012-10-17",
#     "Statement": [
#         {
#             "Effect": "Allow",
#             "Principal": {
#                 "Service": "eks.amazonaws.com"
#             },
#             "Action": "sts:AssumeRole"
#         }
#     ]
# }
# EOF
# }

# # Attach the required policies to the IAM role
# resource "aws_iam_role_policy_attachment" "my_eks_role_policy_attachment" {
#     role       = aws_iam_role.my_eks_role.name
#     policy_arn = "arn:aws:iam::aws:policy/AmazonEKSClusterPolicy"
# }

module "eks_al2" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.0"

  cluster_name    = "test-al2"
  cluster_version = "1.30"

  # EKS Addons
#   cluster_addons = {
#     coredns                = {}
#     eks-pod-identity-agent = {}
#     kube-proxy             = {}
#     vpc-cni                = {}
#   }

  vpc_id     = aws_vpc.my_vpc.id
subnet_ids = [aws_subnet.private_subnet.id, aws_subnet.public_subnet.id]

  eks_managed_node_groups = {
    example = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      ami_type       = "AL2_x86_64"
      instance_types = ["t2.small"]

      min_size = 2
      max_size = 3
      # This value is ignored after the initial creation
      # https://github.com/bryantbiggs/eks-desired-size-hack
      desired_size = 2
    }
  }

  #tags = local.tags
}