variable region {
    type = string
   description = "provide region"
  
}

variable vpc_cider {
    type = string
   description = "provide vpc cider block"
  
}

variable subnet_cider {
    type = list(object({
        cider = string
        subnet_name = string
    }))
   
  
}