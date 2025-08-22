# Default namespace

Here we override the pod admission policy to allow testing things with
`kubectl run`.

This namespace also contains the fluxcd resources needed to keep the cluster in
sync with the git repository.
