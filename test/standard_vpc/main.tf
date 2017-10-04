resource "null_resource" "static" {
  triggers {
    static = "hi"
  }
}