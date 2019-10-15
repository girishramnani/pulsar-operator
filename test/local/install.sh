#!/usr/bin/env bash

export WORK_DIR=$(cd `dirname $0`; cd ../..; pwd)

# create pulsar cluster crd
kubectl create -f ${WORK_DIR}/deploy/crds/pulsar_v1alpha1_pulsarcluster_crd.yaml

# create pulsar cluster operator account and role
kubectl create -f ${WORK_DIR}/deploy/role.yaml
kubectl create -f ${WORK_DIR}/deploy/role_binding.yaml
kubectl create -f ${WORK_DIR}/deploy/service_account.yaml

# create one example pulsar cluster
kubectl create -f ${WORK_DIR}/deploy/crds/pulsar_v1alpha1_pulsarcluster_cr.yaml

# start pulsar operator local
cd ${WORK_DIR}/..
operator-sdk up local