variable "scale_out" {
    description = "The name of the scale OUT by the ASG"
    type = string
    default = "scale-out-during-business-hours"
}

variable "scale_in" {
    description = "The name of the scale IN by the ASG"
    type = string
    default = "scale-in-during-business-hours"
}