class ManageIQ::Providers::Kubernetes::Inventory::Collector < ManageIQ::Providers::Inventory::Collector
  require_nested :ContainerManager

  def connect(service)
    manager.connect(:service => service)
  rescue KubeException
    nil
  end

  def kubernetes_connection
    @kubernetes_connection ||= connect("kubernetes")
  end
end
