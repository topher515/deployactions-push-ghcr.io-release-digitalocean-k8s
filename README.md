# push-ghcr.io-release-digitalocean-k8s
Push a Docker image to ghcr.io; Deploy it to Digital Ocean Kubernetes

## Usage

You must have `doctl` present to use this. (See example below..)

```
# File .github/workflows/workflow.yml

...

jobs:
  build:

    ...
    steps:
    ...

    - name: '[Build] Install DigitalOcean cli'
      if: env.DEPLOY == 'true'
      uses: digitalocean/action-doctl@v2
      with:
        token: ${{ secrets.DIGITALOCEAN_ACCESS_TOKEN }}

    - name: '[Deploy] Push and deploy'
      uses: topher515/push-ghcr.io-release-digitalocean-k8s@v1.0.1
      with:
        image: ${{ env.IMAGE }}
        cluster-name: ${{ env.CLUSTER_NAME }}
        helm-chart-dir: "${{ env.HELM_DIR }}/base"
        tag: ${{ env.TAG }}
        release-name: "${{ env.APP_NAME }}-${{ env.ENV_NAME }}"
        release-values-file: "${{ env.HELM_DIR }}/${{ env.ENV_NAME }}/values.yaml"
        github-token: ${{ secrets.GITHUB_TOKEN }}
```

