#' Create Azure Kubernetes Service (AKS)
#'
#' Method for the [AzureRMR::az_resource_group] class.
#'
#' @rdname create_aks
#' @name create_aks
#' @aliases create_aks
#' @section Usage:
#' ```
#' create_aks(name, location = self$location,
#'            dns_prefix = name, kubernetes_version = NULL,
#'            enable_rbac = FALSE, agent_pools = list(),
#'            login_user = "", login_passkey = "",
#'            cluster_service_principal = NULL, managed_identity = FALSE,
#'            properties = list(), ..., wait = TRUE)
#' ```
#' @section Arguments:
#' - `name`: The name of the Kubernetes service.
#' - `location`: The location/region in which to create the service. Defaults to this resource group's location.
#' - `dns_prefix`: The domain name prefix to use for the cluster endpoint. The actual domain name will start with this argument, followed by a string of pseudorandom characters.
#' - `kubernetes_version`: The Kubernetes version to use. If not specified, uses the most recent version of Kubernetes available.
#' - `enable_rbac`: Whether to enable role-based access controls.
#' - `agent_pools`: A list of pool specifications. See 'Details'.
#' - `login_user,login_passkey`: Optionally, a login username and public key (on Linux). Specify these if you want to be able to ssh into the cluster nodes.
#' - `cluster_service_principal`: The service principal (client) that AKS will use to manage the cluster resources. This should be a list, with the first component being the client ID and the second the client secret. If not supplied, a new service principal will be created (requires an interactive session).
#' - `managed_identity`: Whether the cluster should have a managed identity assigned to it. This is currently in preview; see the [Microsoft Docs page](https://docs.microsoft.com/en-us/azure/aks/use-managed-identity) for enabling this feature.
#' - `properties`: A named list of further Kubernetes-specific properties to pass to the initialization function.
#' - `wait`: Whether to wait until the AKS resource provisioning is complete. Note that provisioning a Kubernetes cluster can take several minutes.
#' - `...`: Other named arguments to pass to the initialization function.
#'
#' @section Details:
#' An AKS resource is a Kubernetes cluster hosted in Azure. See the [documentation for the resource][aks] for more information. To work with the cluster (deploy images, define and start services, etc) see the [documentation for the cluster endpoint][kubernetes_cluster].
#'
#' To specify the agent pools for the cluster, it is easiest to use the [aks_pools] function. This takes as arguments the name(s) of the pools, the number of nodes, the VM size(s) to use, and the operating system (Windows or Linux) to run on the VMs.
#'
#' By default, the password for a newly-created service principal will expire after one year. You can run the `update_service_password` method of the AKS object to reset/update the password before it expires.
#'
#' @section Value:
#' An object of class `az_kubernetes_service` representing the service.
#'
#' @seealso
#' [get_aks], [delete_aks], [list_aks], [aks_pools]
#'
#' [az_kubernetes_service]
#'
#' [kubernetes_cluster] for the cluster endpoint
#'
#' [AKS documentation](https://docs.microsoft.com/en-us/azure/aks/) and
#' [API reference](https://docs.microsoft.com/en-us/rest/api/aks/)
#'
#' [Kubernetes reference](https://kubernetes.io/docs/reference/)
#'
#' @examples
#' \dontrun{
#'
#' rg <- AzureRMR::get_azure_login()$
#'     get_subscription("subscription_id")$
#'     get_resource_group("rgname")
#'
#' rg$create_aks("mycluster", agent_pools=aks_pools("pool1", 5))
#'
#' # GPU-enabled cluster
#' rg$create_aks("mygpucluster", agent_pools=aks_pools("pool1", 5, size="Standard_NC6s_v3"))
#'
#' }
NULL


#' Get Azure Kubernetes Service (AKS)
#'
#' Method for the [AzureRMR::az_resource_group] class.
#'
#' @rdname get_aks
#' @name get_aks
#' @aliases get_aks list_aks
#'
#' @section Usage:
#' ```
#' get_aks(name)
#' list_aks()
#' ```
#' @section Arguments:
#' - `name`: For `get_aks()`, the name of the Kubernetes service.
#'
#' @section Details:
#' The `AzureRMR::az_resource_group` class has both `get_aks()` and `list_aks()` methods, while the `AzureRMR::az_subscription` class only has the latter.
#'
#' @section Value:
#' For `get_aks()`, an object of class `az_kubernetes_service` representing the service.
#'
#' For `list_aks()`, a list of such objects.
#'
#' @seealso
#' [create_aks], [delete_aks]
#'
#' [az_kubernetes_service]
#'
#' [kubernetes_cluster] for the cluster endpoint
#'
#' [AKS documentation](https://docs.microsoft.com/en-us/azure/aks/) and
#' [API reference](https://docs.microsoft.com/en-us/rest/api/aks/)
#'
#' [Kubernetes reference](https://kubernetes.io/docs/reference/)
#'
#' @examples
#' \dontrun{
#'
#' rg <- AzureRMR::get_azure_login()$
#'     get_subscription("subscription_id")$
#'     get_resource_group("rgname")
#'
#' rg$get_aks("mycluster")
#'
#' }
NULL


#' Delete an Azure Kubernetes Service (AKS)
#'
#' Method for the [AzureRMR::az_resource_group] class.
#'
#' @rdname delete_aks
#' @name delete_aks
#' @aliases delete_aks
#'
#' @section Usage:
#' ```
#' delete_aks(name, confirm=TRUE, wait=FALSE)
#' ```
#' @section Arguments:
#' - `name`: The name of the Kubernetes service.
#' - `confirm`: Whether to ask for confirmation before deleting.
#' - `wait`: Whether to wait until the deletion is complete.
#'
#' @section Value:
#' NULL on successful deletion.
#'
#' @seealso
#' [create_aks], [get_aks]
#'
#' [az_kubernetes_service]
#'
#' [kubernetes_cluster] for the cluster endpoint
#'
#' [AKS documentation](https://docs.microsoft.com/en-us/azure/aks/) and
#' [API reference](https://docs.microsoft.com/en-us/rest/api/aks/)
#'
#' [Kubernetes reference](https://kubernetes.io/docs/reference/)
#'
#' @examples
#' \dontrun{
#'
#' rg <- AzureRMR::get_azure_login()$
#'     get_subscription("subscription_id")$
#'     get_resource_group("rgname")
#'
#' rg$delete_aks("mycluster")
#'
#' }
NULL


#' List available Kubernetes versions
#'
#' Method for the [AzureRMR::az_subscription] and [AzureRMR::az_resource_group] classes.
#'
#' @rdname list_kubernetes_versions
#' @name list_kubernetes_versions
#' @aliases list_kubernetes_versions
#'
#' @section Usage:
#' ```
#' ## R6 method for class 'az_subscription'
#' list_kubernetes_versions(location)
#'
#' ## R6 method for class 'az_resource_group'
#' list_kubernetes_versions()
#' ```
#' @section Arguments:
#' - `location`: For the az_subscription class method, the location for which to obtain available Kubernetes versions.
#'
#' @section Value:
#' A vector of strings, which are the Kubernetes versions that can be used when creating a cluster.
#' @seealso
#' [create_aks]
#'
#' [Kubernetes reference](https://kubernetes.io/docs/reference/)
#'
#' @examples
#' \dontrun{
#'
#' rg <- AzureRMR::get_azure_login()$
#'     get_subscription("subscription_id")$
#'     get_resource_group("rgname")
#'
#' rg$list_kubernetes_versions()
#'
#' }
NULL


add_aks_methods <- function()
{
    az_resource_group$set("public", "create_aks", overwrite=TRUE,
    function(name, location=self$location,
             dns_prefix=name, kubernetes_version=NULL,
             login_user="", login_passkey="",
             enable_rbac=FALSE, agent_pools=list(),
             cluster_service_principal=NULL,
             managed_identity=FALSE,
             properties=list(), ..., wait=TRUE)
    {
        if(is_empty(kubernetes_version))
            kubernetes_version <- tail(self$list_kubernetes_versions(), 1)

        # hide from CRAN check
        find_app_creds <- get("find_app_creds", getNamespace("AzureContainers"))
        cluster_service_principal <- find_app_creds(cluster_service_principal, name, location, self$token)

        props <- list(
            kubernetesVersion=kubernetes_version,
            dnsPrefix=dns_prefix,
            agentPoolProfiles=agent_pools,
            enableRBAC=enable_rbac,
            servicePrincipalProfile=list(
                clientId=cluster_service_principal[[1]],
                secret=cluster_service_principal[[2]]
            )
        )

        if(is.null(props$servicePrincipalProfile$secret))
            stop("Must provide a service principal with a secret password", call.=FALSE)

        identity <- if(managed_identity)
            list(type="systemAssigned")
        else NULL

        if(login_user != "" && login_passkey != "")
            props$linuxProfile <- list(
                adminUsername=login_user,
                ssh=list(publicKeys=list(list(Keydata=login_passkey)))
            )

        props <- utils::modifyList(props, properties)

        # if service principal was created here, must try repeatedly until it shows up in ARM
        for(i in 1:20)
        {
            res <- tryCatch(AzureContainers::aks$new(self$token, self$subscription, self$name,
                type="Microsoft.ContainerService/managedClusters", name=name, location=location,
                properties=props, identity=identity, ..., wait=wait), error=function(e) e)
            if(!(inherits(res, "error") &&
                 grepl("Service principal|ServicePrincipal", res$message)))
                break
            Sys.sleep(5)
        }
        if(inherits(res, "error"))
        {
            # fix printed output from httr errors
            class(res) <- c("simpleError", "error", "condition")
            stop(res)
        }
        res
    })

    az_resource_group$set("public", "get_aks", overwrite=TRUE,
    function(name)
    {
        AzureContainers::aks$new(self$token, self$subscription, self$name,
            type="Microsoft.ContainerService/managedClusters", name=name)
    })

    az_resource_group$set("public", "delete_aks", overwrite=TRUE,
    function(name, confirm=TRUE, wait=FALSE)
    {
        self$get_aks(name)$delete(confirm=confirm, wait=wait)
    })

    az_resource_group$set("public", "list_aks", overwrite=TRUE,
    function()
    {
        provider <- "Microsoft.ContainerService"
        path <- "managedClusters"
        api_version <- az_subscription$
            new(self$token, self$subscription)$
            get_provider_api_version(provider, path)

        op <- file.path("resourceGroups", self$name, "providers", provider, path)

        cont <- call_azure_rm(self$token, self$subscription, op, api_version=api_version)
        lst <- lapply(cont$value,
            function(parms) AzureContainers::aks$new(self$token, self$subscription, deployed_properties=parms))

        # keep going until paging is complete
        while(!is_empty(cont$nextLink))
        {
            cont <- call_azure_url(self$token, cont$nextLink)
            lst <- lapply(cont$value,
                function(parms) AzureContainers::aks$new(self$token, self$subscription, deployed_properties=parms))
        }
        named_list(lst)
    })

    az_resource_group$set("public", "list_kubernetes_versions", overwrite=TRUE,
    function()
    {
        az_subscription$
            new(self$token, self$subscription)$
            list_kubernetes_versions(self$location)
    })

    az_subscription$set("public", "list_aks", overwrite=TRUE,
    function()
    {
        provider <- "Microsoft.ContainerService"
        path <- "managedClusters"
        api_version <- self$get_provider_api_version(provider, path)

        op <- file.path("providers", provider, path)

        cont <- call_azure_rm(self$token, self$id, op, api_version=api_version)
        lst <- lapply(cont$value,
            function(parms) AzureContainers::aks$new(self$token, self$id, deployed_properties=parms))

        # keep going until paging is complete
        while(!is_empty(cont$nextLink))
        {
            cont <- call_azure_url(self$token, cont$nextLink)
            lst <- lapply(cont$value,
                function(parms) AzureContainers::aks$new(self$token, self$id, deployed_properties=parms))
        }
        named_list(lst)
    })

    az_subscription$set("public", "list_kubernetes_versions", overwrite=TRUE,
    function(location)
    {
        api_version <- self$get_provider_api_version("Microsoft.ContainerService", "locations/orchestrators")
        op <- file.path("providers/Microsoft.ContainerService/locations", location, "orchestrators")

        res <- call_azure_rm(self$token, self$id, op,
                             options=list(`resource-type`="managedClusters"),
                             api_version=api_version)

        sapply(res$properties$orchestrators, `[[`, "orchestratorVersion")
    })
}


find_app_creds <- function(credlist, name, location, token)
{
    creds <- if(is.null(credlist))
    {
        gr <- graph_login(token$tenant)

        message("Creating cluster service principal")
        appname <- paste("RAKSapp", name, location, sep="-")
        app <- gr$create_app(appname)

        message("Waiting for Resource Manager to sync with Graph")
        list(app$properties$appId, app$password)
    }
    else if(inherits(credlist, "az_app"))
        list(credlist$properties$appId, credlist$password)
    else if(length(credlist) == 2)
        list(credlist[[1]], credlist[[2]])

    if(is_empty(creds) || length(creds) < 2 || is_empty(creds[[2]]))
        stop("Invalid service principal credentials: must supply app ID and password")
    creds
}
