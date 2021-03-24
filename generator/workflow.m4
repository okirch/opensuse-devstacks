define(`_GENERATOR_BASEDIR',regexp(__file__,`\(.*\)/[^/]*$',`\1'))dnl
dnl common.m4 redefines the quote characters to [ ]
include(_GENERATOR_BASEDIR`/common.m4')dnl
changequote
# vim: set expandtab:

#
# Github workflow to build container
#
# Dockerfile: expected in top-level directory
#
# Name of image: taken from the action name given below
#       We might just as well be able to take it from
#       $GITHUB_REPOSITORY (which is org_or_user/repo_name)
#
# Image version:
#       Currently a concatenation of the version of the principal package in
#       this image, concatenated with the run number of this action.
#       (This would create issues when deleting an action and recreating
#       it, or when trying to build the same image from another repo -
#       so handle with care).
#
# Registry to push to:
#       Currently ghcr.io, but other registries could be configured
#       as well.
#

name: _BASE_OS_ID-_IMAGE_ID
on:
  workflow_dispatch:
  release:
    types: [created]
  schedule:
    - cron: '0 6 * * *'
jobs:
  build:
    name: build-container
    runs-on: ubuntu-latest
    steps:
ifdef(_BASE_OS_SLE,`dnl
      - name: Create credentials for SLE
        env:
          SCC_CREDS: ${{ secrets.SCC_CREDENTIALS }}
        run: echo "$SCC_CREDS" > SCCcredentials
      - id: verify
        run: ls -l SCCcredentials
')dnl
      - uses: docker/setup-qemu-action@v1
      - id: buildx
        uses: docker/setup-buildx-action@v1
      - name: Login to ghcr.io
        uses: docker/login-action@v1
        with:
          registry: ghcr.io
          username: ${{ github.repository_owner }}
          password: ${{ secrets.CR_PAT }}
      - name: Login to DockerHub
        uses: docker/login-action@v1
        with:
          username: ${{ secrets.DOCKER_USER }}
          password: ${{ secrets.DOCKER_PAT }}
      - uses: docker/build-push-action@v2
        with:
          file: .genfiles/standalone/${{ github.workflow }}/Dockerfile
          push: true
ifdef(_BASE_OS_SLE,`dnl
          secret-files: |
            "scc_credentials=./SCCcredentials"
')dnl
          tags: |
            ghcr.io/${{ github.repository_owner }}/${{ github.workflow }}:latest
            ghcr.io/${{ github.repository_owner }}/${{ github.workflow }}:_IMAGE_VERSION-${{ github.run_number }}
            ${{ secrets.DOCKER_USER }}/${{ github.workflow }}:latest
            ${{ secrets.DOCKER_USER }}/${{ github.workflow }}:_IMAGE_VERSION-${{ github.run_number }}
          build-args: |
            BUILDID=${{ github.run_number }}

