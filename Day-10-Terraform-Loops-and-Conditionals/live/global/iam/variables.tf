variable "user_names" {
    description = "Create the IAM users with these names"
    type = list(string)
    default = [ "dev" , "stage" ,"prod" ]
}