{{/*
Returns the chart name.
*/}}
{{- define "redisinsight.name" -}}
{{ .Chart.Name }}
{{- end }}

{{/*
Returns the full name.
*/}}
{{- define "redisinsight.fullname" -}}
{{ .Release.Name }}
{{- end }}
