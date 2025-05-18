return {
	settings = {
		yaml = {
			schemas = {
				["http://json.schemastore.org/kustomization"] = "kustomization.yaml",
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://raw.githubusercontent.com/GoogleContainerTools/skaffold/master/docs/content/en/schemas/v2beta8.json"] = "skaffold.yaml",
				["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/refs/heads/master/v1.32.1-standalone-strict/all.json"] = "/*.k8s.yaml",
			},
		},
	},
}
