{{/*
Expand the name of the chart.
*/}}
{{- define "reviews.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "reviews.fullname" -}}
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
{{- define "reviews.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels_01
*/}}
{{- define "reviews.labels_01" -}}
{{ include "reviews.selectorLabels_01" . }}
{{- end }}

{{/*
Common labels_02
*/}}
{{- define "reviews.labels_02" -}}
{{ include "reviews.selectorLabels_02" . }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "reviews.selectorLabels_01" -}}
app.kubernetes.io/name: {{ include "reviews.name" . }}-v1 
version: v1
{{- end }}

{{/*
Selector labels
*/}}
{{- define "reviews.selectorLabels_02" -}}
app.kubernetes.io/name: {{ include "reviews.name" . }}-v2
version: v2
{{- end }}
{{/*
Create the name of the service account to use
*/}}
{{- define "reviews.serviceAccountName" -}}
{{- if .Values.serviceAccount.create }}
{{- default (include "reviews.fullname" .) .Values.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.serviceAccount.name }}
{{- end }}
{{- end }}
