module github.com/amir20/dozzle

replace github.com/docker/docker v0.0.0-20170601211448-f5ec1e2936dc => github.com/docker/engine v0.0.0-20180718150940-a3ef7e9a9bda

require (
	github.com/Azure/go-ansiterm v0.0.0-20170929234023-d6e3b3328b78 // indirect
	github.com/Microsoft/go-winio v0.4.11 // indirect
	github.com/Nvveen/Gotty v0.0.0-20120604004816-cd527374f1e5 // indirect
	github.com/beme/abide v0.0.0-20181227202223-4c487ef9d895
	github.com/coreos/etcd v3.3.11+incompatible // indirect
	github.com/docker/distribution v2.7.0+incompatible // indirect
	github.com/docker/docker v1.13.1
	github.com/docker/go-connections v0.4.0 // indirect
	github.com/docker/go-units v0.3.3 // indirect
	github.com/gobuffalo/buffalo-plugins v1.11.0 // indirect
	github.com/gobuffalo/flect v0.0.0-20190117212819-a62e61d96794 // indirect
	github.com/gobuffalo/packr v1.21.9
	github.com/gobuffalo/plush v3.7.33+incompatible // indirect
	github.com/gogo/protobuf v1.2.0 // indirect
	github.com/google/go-cmp v0.2.0 // indirect
	github.com/gorilla/context v1.1.1 // indirect
	github.com/gorilla/mux v1.6.2
	github.com/magiconair/properties v1.8.0
	github.com/opencontainers/go-digest v1.0.0-rc1 // indirect
	github.com/opencontainers/image-spec v1.0.1 // indirect
	github.com/rogpeppe/go-internal v1.1.0 // indirect
	github.com/sirupsen/logrus v1.3.0
	github.com/spf13/pflag v1.0.3
	github.com/stretchr/testify v1.3.0
	github.com/ugorji/go/codec v0.0.0-20181209151446-772ced7fd4c2 // indirect
	golang.org/x/net v0.0.0-20190119204137-ed066c81e75e // indirect
	golang.org/x/sys v0.0.0-20190116161447-11f53e031339 // indirect
	golang.org/x/time v0.0.0-20181108054448-85acf8d2951c // indirect
	golang.org/x/tools v0.0.0-20190118193359-16909d206f00 // indirect
	google.golang.org/appengine v1.2.0 // indirect
	google.golang.org/genproto v0.0.0-20181221175505-bd9b4fb69e2f // indirect
	google.golang.org/grpc v1.17.0 // indirect
	gotest.tools v2.2.0+incompatible // indirect
)

// github.com/docker/engine v18.06.1-ce
replace github.com/docker/docker => github.com/docker/engine v0.0.0-20180816081446-320063a2ad06

// github.com/docker/distribution master
// a proper tagged release is expected in early fall(September 2018)
// see; https://github.com/docker/distribution/issues/2693
replace github.com/docker/distribution => github.com/docker/distribution v2.6.0-rc.1.0.20180820212402-02bf4a2887a4+incompatible
