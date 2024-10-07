# fail if nginx version set in values.yaml is lower than minimumVersion
{{- define "nginx.versionValidation" }}
{{- $selectedVersion := . }}
{{- $minimumVersion := "1.16.0" }}
{{- $semverCompareCondition := printf ">= %s" $minimumVersion }}
{{- if not (semverCompare $semverCompareCondition $selectedVersion) }}
{{- fail (printf "Nginx version must be greater or equal than %s" $minimumVersion) }}
{{- end }}
{{- $selectedVersion }}
{{- end }}


# fail if nginx version set in values.yaml is not in the expected range
{{- define "nginx.versionRangeValidation" }}
{{- $selectedVersion := . }}
{{- $minimumVersion := "1.16.0" }}
{{- $maximumVersion := "2.0.0" }}
{{- $semverCompareCondition := printf "%s - %s" $minimumVersion $maximumVersion }}
{{- if not (semverCompare $semverCompareCondition $selectedVersion) }}
{{- fail (printf "Nginx version must be in the range between %s and %s" $minimumVersion $maximumVersion ) }}
{{- end }}
{{- $selectedVersion }}
{{- end }}
