A simple Helm chart example to show how [`semverCompare`](https://helm.sh/docs/chart_template_guide/function_list/#semvercompare) function works.

`_helpers.tpl` file contains two partials:
- `nginx.versionValidation` to validate version against a minimum value
- `nginx.versionRangeValidation` to validate version in a range of values

## How to test

1. Update `values.yaml` file with the `version` value you would like to test
2. At line 19 of `deployment.yaml` include the partial you would like to test (currently it is set to include `nginx.versionValidation` partial)
3. Run the `helm template .` command and look for the output: if the version is valid, it should print a k8s manifest, otherwise it should print an error