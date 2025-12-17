
output "cluster_identity" {
  value = module.aks.kubelet_identity[0].object_id
}
