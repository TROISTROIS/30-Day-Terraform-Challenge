# terraform {
#     backend "s3" {
#         key = "live/prod/terraform.tfstate"
#         assume_role = {
#             role_arn = "arn:aws:iam::966392475043:role/CrossAccountRole"
#             }
#     }
# }