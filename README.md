# Infrastructure as code manifests

These files describe the things that I deploy on my homelab.

The `kubernetes` folder contains the manifests for the kubernetes cluster. This
is the method that I currently use to deploy my applications.

The `docker-compose` folder contains the manifests for applications that I used
to deploy. While they should continue to work, the images are not updated
anymore.

## Kubernetes deployment

All the manifests in the `kubernetes` folder are kept in sync with fluxcd. To
get started look at how to generate a secret key for your secrets inside
`kubernetes/default/kustomizations/github-iac-manifests.yaml`.
