Title: Google Cloud

"Google Cloud SDK is a set of tools that you can use to manage resources and applications hosted on Google Cloud Platform. These include the gcloud, gsutil, and bq command line tools. The gcloud command-line tool is downloaded along with the Cloud SDK" - <https://cloud.google.com/sdk/docs/>

# gcloud CLI Examples

## List google cloud projects

```
gcloud projects list
```

## Switch to a different project

```
gcloud config set project <project_name>
```

## Grant a user permission to a docker registry

```
gsutil iam ch 'user:user@example.com:objectViewer' 'gs://artifacts.example.appspot.com/'
```

## List google compute zones

`gcloud compute zones list`

## List images available in Google Container Registry

`gcloud container images list`

## Pull a docker container from Google Container Registry

`gcloud docker -- pull gcr.io/project-id/hello-world`

## Control access to registries

"Container Registry uses a Cloud Storage bucket as the backend for serving container images. You can control who has access to your Container Registry images by adjusting permissions for the Cloud Storage bucket.

Caution: Container Registry only recognizes permissions set on the Cloud Storage bucket. Container Registry will ignore permissions set on individual objects within the Cloud Storage bucket.

You manage access control in Cloud Storage by using the GCP Console or the `gsutil` command-line tool. Refer to the `gsutil acl` and `gsutil defacl` documentation for more information." - <https://cloud.google.com/container-registry/docs/access-control>

# Links

- <https://cloud.google.com/container-registry/docs/quickstart>
- <https://cloud.google.com/container-builder/docs/build-config>
- <https://cloud.google.com/container-builder/docs/create-custom-build-steps>
- <https://github.com/GoogleCloudPlatform/cloud-builders>
