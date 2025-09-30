{{/*
Expand the name of the chart.
*/}}
{{- define "ssd.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "ssd.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "ssd.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "ssd.labels" -}}
helm.sh/chart: {{ include "ssd.chart" . }}
{{ include "ssd.selectorLabels" . }}
{{- if not .Values.selectorLabelsWithInstance }}
app.kubernetes.io/instance: {{ .Release.Name }}{{ end }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "ssd.selectorLabels" -}}
{{- if .Values.envName -}}
env: {{ .Values.envName }}{{ end }}
app.kubernetes.io/name: {{ include "ssd.name" . }}
{{- if .Values.selectorLabelsWithInstance }}
app.kubernetes.io/instance: {{ .Release.Name }}{{ end }}
{{- end }}
