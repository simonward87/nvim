-- Custom build tags cause gopls to malfunction by default. Flags can
-- be used as a work-around: https://github.com/golang/go/issues/29202
--
-- More about GOFLAGS: https://pkg.go.dev/cmd/go#hdr-Environment_variables

local custom_build_tags = {
	"inmemory",
	"integration",
	"linux",
	"test",
	"unittest",
	"windows"
}

return {
	settings = {
		gopls = {
			env = {
				GOFLAGS = "-tags=" .. table.concat(custom_build_tags, ",")
			},
		},
	},
}
