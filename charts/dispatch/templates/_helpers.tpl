# Define a template for the chart's full name.
{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
*/}}
{{- define "dispatch.fullname" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

# Define a template for standard labels.
{{/*
Common labels
*/}}
{{- define "dispatch.labels" -}}
helm.sh/chart: {{ include "dispatch.chart" . }}
app.kubernetes.io/name: {{ include "dispatch.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.Version | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

# Define a template for the chart name and version.
{{/*
Generate basic labels
*/}}
{{- define "dispatch.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" -}}
{{- end }}

# Optionally, add more helper templates as needed.
