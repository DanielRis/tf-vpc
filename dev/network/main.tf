resource "null_resource" "terraforge" {
    triggers {
      uuid = "${uuid()}"  
    }
}