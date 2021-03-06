# AzureContainers 1.2.0

- New `call_docker_compose` function for calling docker-compose.
- Add delay in loop to wait for service principal during AKS resource creation; could timeout prematurely otherwise.
- `KubernetesCluster$create()`, `apply()`, etc now accept HTTP\[S\] URLs as well as filenames as arguments.
- Use the processx package to run external commands, rather than `base::system2()`. A major benefit of this change is that command output is automatically captured and returned as an R object, making it easier to write automated scripts.
  - The commandline is now a list component of the R object, rather than an attribute.
- The various `DockerRegistry` and `KubernetesCluster` methods for calling docker, kubectl and helm now have `...` as an argument, allowing you to pass extra inputs to these commands as needed.
- Add `list_cluster_resources()` method for the AKS resource class, which returns a list of all the Azure resources managed by the cluster.

# AzureContainers 1.1.2

* The `aks$update_aad_password()` and `aks$update_service_password()` methods now use the new Graph API calls for managing app passwords. The arguments to both these methods are `name` (an optional friendly name for the password) and `duration`. As a security measure, passwords can no longer be manually specified; instead all passwords are now auto-generated on the server with a cryptographically secure PRNG.

# AzureContainers 1.1.1

* Enable creating ACI and AKS instances with assigned managed identities. Note that this is still in preview for AKS; see the [Microsoft Docs page](https://docs.microsoft.com/en-us/azure/aks/use-managed-identity) for enabling this feature.

# AzureContainers 1.1.0

* Make `docker_registry` and `kubernetes_cluster` into constructor functions rather than R6 classes, for consistency with other AzureR packages. The corresponding class objects are now `DockerRegistry` and `KubernetesCluster`.
* Enable AAD authentication for ACR. By default, instantiating a new docker registry object will authenticate using the AAD credentials of the currently signed-in user. Alternative authentication details can be supplied to `docker_registry`, which will be passed to `AzureAuth::get_azure_token`. See the help for `docker_registry` for more information.
* Enable authenticating with service principals to ACR from ACI and AKS.
* By default, create new container instances with a managed service identity.
* Add `aks$update_aad_password()` method to reset/update the password for AAD integration.
* Add custom `acr$add_role_assignment()` method that recognises AKS objects.

# AzureContainers 1.0.3

* Add `aks$update_service_password()` method to reset/update the service principal credentials.
* Send the docker password via `stdin`, rather than on the commandline.
* Not released to CRAN (superseded by 1.1.0 above).

# AzureContainers 1.0.2

* Ensure dir for Kubernetes config file exists before writing the file.
* Add `wait` argument to `create_aci` and `create_aks` methods; rely on AzureRMR 2.0 for implementation.
* By default, create a new service principal when creating a new AKS resource; this relies on the AzureGraph package.
* Fix bug in `aci$start()` method.
* By default, save the config file for an AKS cluster in the AzureR directory to allow reuse without going through Resource Manager.

# AzureContainers 1.0.1

* Change `aks$get_cluster()` method to use a non-deprecated API call.
* Allow resource group and subscription accessor methods to work even if AzureContainers is not on the search path.
* Allow for different AAD token implementations, either from httr or AzureAuth.

# AzureContainers 1.0.0

* Submitted to CRAN

# AzureContainers 0.9.0

* Moved to cloudyr organisation
