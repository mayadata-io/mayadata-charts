{{/* vim: set filetype=mustache: */}}
{{/*
Expand the name of the chart.
*/}}
{{- define "openebs.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "openebs.fullname" -}}
{{- if .Values.fullnameOverride -}}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .Chart.Name .Values.nameOverride -}}
{{- if contains $name .Release.Name -}}
{{- .Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "openebs.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/*
Create the name of the service account to use
*/}}
{{- define "openebs.serviceAccountName" -}}
{{- if .Values.serviceAccount.create -}}
    {{ default (include "openebs.fullname" .) .Values.serviceAccount.name }}
{{- else -}}
    {{ default "default" .Values.serviceAccount.name }}
{{- end -}}
{{- end -}}
{{/*
Custom docker repositry to use in image.
*/}}
{{- define "ndmImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s:%s" .Values.imageRegistry "node-disk-manager-amd64" .Values.ndm.imageTag -}}
{{- end -}}
{{- end -}}
{{- define "admission-webhookImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s:%s" .Values.imageRegistry "admission-server" .Values.webhook.imageTag -}}
{{- end -}}
{{- end -}}
{{- define "localprovisionerImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s:%s" .Values.imageRegistry "provisioner-localpv" .Values.localprovisioner.imageTag -}}
{{- end -}}
{{- end -}}
{{- define "maya-apiserverImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s:%s" .Values.imageRegistry "m-apiserver" .Values.apiserver.imageTag -}}
{{- end -}}
{{- end -}}
{{- define "openebs-provisionerImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s:%s" .Values.imageRegistry "openebs-k8s-provisioner" .Values.provisioner.imageTag -}}
{{- end -}}
{{- end -}}
{{- define "snapshot-operatorImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s:%s" .Values.imageRegistry "snapshot-controller" .Values.snapshotOperator.controller.imageTag -}}
{{- end -}}
{{- end -}}
{{- define "snapshot-provisionerImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s:%s" .Values.imageRegistry "snapshot-provisioner" .Values.snapshotOperator.provisioner.imageTag -}}
{{- end -}}
{{- end -}}
{{- define "ndm-operatorImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s:%s" .Values.imageRegistry "node-disk-operator-amd64" .Values.ndmOperator.imageTag -}}
{{- end -}}
{{- end -}}
{{- define "helperImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s:%s" .Values.imageRegistry "linux-utils" .Values.helper.imageTag -}}
{{- end -}}
{{- end -}}
{{- define "jivaImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s:%s" .Values.imageRegistry "jiva" .Values.jiva.imageTag -}}
{{- end -}}
{{- end -}}
{{- define "cstorTargetImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s:%s" .Values.imageRegistry "cstor-istgt" .Values.cstor.target.imageTag -}}
{{- end -}}
{{- end -}}
{{- define "cstorPoolImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s:%s" .Values.imageRegistry "cstor-pool" .Values.cstor.pool.imageTag -}}
{{- end -}}
{{- end -}}
{{- define "cstorPoolMgmtImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s:%s" .Values.imageRegistry "cstor-pool-mgmt" .Values.cstor.poolMgmt.imageTag -}}
{{- end -}}
{{- end -}}
{{- define "cstorVolumeMgmtImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s:%s" .Values.imageRegistry "cstor-volume-mgmt" .Values.cstor.volumeMgmt.imageTag -}}
{{- end -}}
{{- end -}}
{{- define "monitoringImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s:%s" .Values.imageRegistry "m-exporter" .Values.policies.monitoring.imageTag -}}
{{- end -}}
{{- end -}}