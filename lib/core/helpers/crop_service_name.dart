String cropServiceName(String serviceName) {
  String cropedServiceName = serviceName;
  if (cropedServiceName.length > 20) {
    return '${cropedServiceName.substring(0, 20)}...';
  }
  return cropedServiceName;
}
