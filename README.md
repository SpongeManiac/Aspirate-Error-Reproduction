### 🔥 Bug Description for https://github.com/prom3theu5/aspirational-manifests/issues/336
When trying to apply my generated config with `aspirate apply`, I receive the following error:
```
── Handle Deployment to Cluster ───────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────
Would you like to deploy the generated manifests to a kubernetes cluster defined in your kubeconfig file? [y/n] (y): y
(?) Done: Successfully set the Active Kubernetes Context to 'kubernetes-admin@desktop'
(!) Failed to apply manifests to cluster.
(!) Error: Value cannot be null. (Parameter 'path1')
```

### Error Reproduction Repo: 
[Aspirate-Error-Reproduction](https://github.com/SpongeManiac/Aspirate-Error-Reproduction/tree/master)

 Pre-reqs:
- Have a valid kubectl config

### Steps:
1. Clone reproduction repo: `https://github.com/SpongeManiac/Aspirate-Error-Reproduction/tree/master`
2. Open command line in `K8STest.AppHost` folder
3. Run the command `aspirate apply`
4. Type `n` to not use previous settings
5. Use `pass` for secrets password
6. Press enter to accept default and deploy generated manifests
7. Select k8s context for deployment
8. Error should appear

### 🧯 Possible Solution
It does not seem like the StackTrace is recorded or output anywhere. I suggest adding the StackTrace to the log output, specifically here: [ApplyManifestsToClusterAction.cs#L34](https://github.com/prom3theu5/aspirational-manifests/blob/6ad05c192db3926c85b60dc066d0fa7e388751ef/src/Aspirate.Commands/Actions/Manifests/ApplyManifestsToClusterAction.cs#L34) and any other place you do error handling.


