return {
	settings = {
		yaml = {
			schemas = {
				["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
				["https://kubernetesjsonschema.dev/v1.18.1-standalone-strict/all.json"] = "*",
				["http://json.schemastore.org/kustomization"] = "kustomization.yaml",
				["https://raw.githubusercontent.com/GoogleContainerTools/skaffold/master/docs/content/en/schemas/v2beta8.json"] = "skaffold.yaml",
			},
		},
	},
}
