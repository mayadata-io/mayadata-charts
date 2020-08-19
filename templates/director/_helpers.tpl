{{/* vim: set filetype=mustache: */}}
{{/*
Mysql Image to use
*/}}
{{- define "mysqlImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s" .Values.imageRegistry "mysql:5.7" -}}
{{- else -}}
    {{ default "default" "mysql:5.7" -}}
{{- end -}}
{{- end -}}
{{- define "xtraBakupImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s" .Values.imageRegistry "xtrabackup:1.0" -}}
{{- else -}}
    {{ default "default" "gcr.io/google-samples/xtrabackup:1.0" -}}
{{- end -}}
{{- end -}}
{{/*
Cassandra Image to use
*/}}
{{- define "cassandraImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s" .Values.imageRegistry "cassandra:v13" -}}
{{- else -}}
    {{ default "default" "gcr.io/google-samples/cassandra:v13" -}}
{{- end -}}
{{- end -}}
{{/*
Elasticsearch Image to use
*/}}
{{- define "elasticsearchImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s" .Values.imageRegistry "opendistro-for-elasticsearch:1.1.0" -}}
{{- else -}}
    {{ default "default" "amazon/opendistro-for-elasticsearch:1.1.0" -}}
{{- end -}}
{{- end -}}
{{- define "elasticsearchInitImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s" .Values.imageRegistry "alpine:3.6" -}}
{{- else -}}
    {{ default "default" "alpine:3.6" -}}
{{- end -}}
{{- end -}}
{{/*
Cortex Image to use
*/}}
{{- define "distributorImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s" .Values.imageRegistry "distributor:master-590e72c6" -}}
{{- else -}}
    {{ default "default" "quay.io/cortexproject/distributor:master-590e72c6" -}}
{{- end -}}
{{- end -}}
{{- define "ingesterImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s" .Values.imageRegistry "ingester:master-590e72c6" -}}
{{- else -}}
    {{ default "default" "quay.io/cortexproject/ingester:master-590e72c6" -}}
{{- end -}}
{{- end -}}
{{- define "consulImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s" .Values.imageRegistry "consul:0.7.1" -}}
{{- else -}}
    {{ default "default" "consul:0.7.1" -}}
{{- end -}}
{{- end -}}
{{- define "configs-dbImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s" .Values.imageRegistry "postgres:9.6" -}}
{{- else -}}
    {{ default "default" "postgres:9.6" -}}
{{- end -}}
{{- end -}}
{{- define "memcachedImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s" .Values.imageRegistry "memcached:1.4.25" -}}
{{- else -}}
    {{ default "default" "memcached:1.4.25" -}}
{{- end -}}
{{- end -}}
{{- define "querierImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s" .Values.imageRegistry "querier:master-590e72c6" -}}
{{- else -}}
    {{ default "default" "quay.io/cortexproject/querier:master-590e72c6" -}}
{{- end -}}
{{- end -}}
{{- define "rulerImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s" .Values.imageRegistry "ruler:master-590e72c6" -}}
{{- else -}}
    {{ default "default" "quay.io/cortexproject/ruler:master-590e72c6" -}}
{{- end -}}
{{- end -}}
{{- define "table-manager" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s/%s" .Values.imageRegistry "table-manager:master-590e72c6" -}}
{{- else -}}
    {{ default "default" "quay.io/cortexproject/table-manager:master-590e72c6" -}}
{{- end -}}
{{- end -}}
{{/*
Client Image to use
*/}}
{{- define "clientImage" -}}
{{- if .Values.useCustomRegistry -}}
    {{- printf "%s" .Values.imageRegistry -}}
{{- else -}}
    {{ default "" -}}
{{- end -}}
{{- end -}}
