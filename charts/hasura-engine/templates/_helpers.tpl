{{- define "hasura.fullname" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end }}

# Define a template for standard labels.
{{/*
Common labels
*/}}
{{- define "hasura.labels" -}}
helm.sh/chart: {{ include "hasura.chart" . }}
app.kubernetes.io/name: {{ include "hasura.fullname" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
app.kubernetes.io/version: {{ .Chart.Version | quote }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

# Define a template for the chart name and version.
{{/*
Generate basic labels
*/}}
{{- define "hasura.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" -}}
{{- end }}

# Optionally, add more helper templates as needed.
