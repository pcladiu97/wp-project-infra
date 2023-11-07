{{- define "labels" -}}
helm.sh/chart: {{ .Chart.Name }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{- define "env-stage" -}}
{{- range $varName, $varValue := .Values.env }}
- name: {{ $varName }}
    value: {{ $varValue | quote }}
{{- end }}
{{- range $secretName, $secretData := .Values.envFromSecrets }}
{{- range $secretEnvName, $secretEnvValue := $secretData }}
- name: {{ $secretEnvName }}
    valueFrom:
    secretKeyRef:
        name: {{ $secretName }}
        key: {{ $secretEnvValue }}
{{- end }}
{{- end }}
{{- range $configMapName, $configMapData := .Values.envFromConfigMap }}
{{- range $configMapEnvName, $configMapEnvValue := $configMapData }}
- name: {{ $configMapEnvName }}
    valueFrom:
    secretKeyRef:
        name: {{ $configMapName }}
        key: {{ $configMapEnvValue }}
{{- end }}
{{- end }}
{{- end }}