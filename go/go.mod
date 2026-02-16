module sbom-test-go

go 1.20

require (
	github.com/gin-gonic/gin v1.7.0
	github.com/go-sql-driver/mysql v1.7.1
	github.com/prometheus/client_golang v1.15.1
	github.com/sirupsen/logrus v1.9.2
	github.com/spf13/viper v1.15.0
	go.uber.org/zap v1.24.0
	github.com/gorilla/mux v1.8.0
	github.com/gorilla/websocket v1.5.0
	github.com/gorilla/handlers v1.5.1
	github.com/gorilla/sessions v1.2.1
	github.com/gorilla/csrf v1.7.1
	github.com/labstack/echo/v4 v4.10.2
	github.com/gofiber/fiber/v2 v2.46.0
	github.com/go-chi/chi/v5 v5.0.8
	github.com/julienschmidt/httprouter v1.3.0
	github.com/valyala/fasthttp v1.47.0
	github.com/go-resty/resty/v2 v2.7.0
	github.com/hashicorp/consul/api v1.22.0
	github.com/hashicorp/vault/api v1.9.2
	github.com/hashicorp/go-multierror v1.1.1
	github.com/hashicorp/go-retryablehttp v0.7.4
	github.com/aws/aws-sdk-go-v2 v1.18.0
	github.com/aws/aws-sdk-go-v2/service/s3 v1.33.1
	github.com/aws/aws-sdk-go-v2/service/dynamodb v1.19.7
	github.com/aws/aws-sdk-go-v2/service/sqs v1.22.0
	github.com/aws/aws-sdk-go-v2/service/sns v1.20.11
	github.com/aws/aws-sdk-go-v2/service/lambda v1.35.0
	github.com/aws/aws-sdk-go-v2/service/iam v1.20.0
	github.com/aws/aws-sdk-go-v2/service/sts v1.19.0
	github.com/aws/aws-sdk-go-v2/service/kms v1.22.0
	github.com/aws/aws-sdk-go-v2/service/ses v1.15.0
	github.com/aws/aws-sdk-go-v2/service/cloudwatch v1.26.0
	github.com/aws/aws-sdk-go-v2/service/ec2 v1.98.0
	github.com/aws/aws-sdk-go-v2/service/rds v1.44.0
	github.com/aws/aws-sdk-go-v2/service/secretsmanager v1.19.8
	github.com/aws/aws-sdk-go-v2/config v1.18.25
	github.com/aws/aws-sdk-go-v2/credentials v1.13.24
	google.golang.org/grpc v1.55.0
	google.golang.org/api v0.126.0
	cloud.google.com/go/storage v1.30.1
	cloud.google.com/go/bigquery v1.52.0
	cloud.google.com/go/pubsub v1.31.0
	cloud.google.com/go/firestore v1.10.0
	cloud.google.com/go/spanner v1.46.0
	cloud.google.com/go/logging v1.7.0
	cloud.google.com/go/secretmanager v1.11.1
	github.com/jmoiron/sqlx v1.3.5
	github.com/lib/pq v1.10.9
	github.com/jackc/pgx/v5 v5.3.1
	github.com/mattn/go-sqlite3 v1.14.17
	github.com/go-redis/redis/v9 v9.0.5
	go.mongodb.org/mongo-driver v1.11.6
	github.com/elastic/go-elasticsearch/v8 v8.8.0
	github.com/olivere/elastic/v7 v7.0.32
	github.com/neo4j/neo4j-go-driver/v5 v5.9.0
	github.com/gocql/gocql v1.5.2
	github.com/influxdata/influxdb-client-go/v2 v2.12.3
	github.com/golang-migrate/migrate/v4 v4.16.0
	github.com/pressly/goose/v3 v3.11.2
	gorm.io/gorm v1.25.1
	gorm.io/driver/postgres v1.5.2
	gorm.io/driver/mysql v1.5.1
	gorm.io/driver/sqlite v1.5.1
	entgo.io/ent v0.12.3
	github.com/Masterminds/squirrel v1.5.4
	github.com/segmentio/kafka-go v0.4.40
	github.com/streadway/amqp v1.1.0
	github.com/nats-io/nats.go v1.27.0
	github.com/nsqio/go-nsq v1.1.0
	github.com/go-playground/validator/v10 v10.14.0
	github.com/stretchr/testify v1.8.4
	github.com/onsi/ginkgo/v2 v2.11.0
	github.com/onsi/gomega v1.27.8
	github.com/golang/mock v1.6.0
	github.com/jarcoal/httpmock v1.3.0
	github.com/DATA-DOG/go-sqlmock v1.5.0
	github.com/alicebob/miniredis/v2 v2.30.3
	github.com/testcontainers/testcontainers-go v0.20.1
	github.com/PuerkitoBio/goquery v1.8.1
	github.com/gocolly/colly/v2 v2.1.0
	github.com/spf13/cobra v1.7.0
	github.com/urfave/cli/v2 v2.25.5
	github.com/fatih/color v1.15.0
	github.com/charmbracelet/bubbletea v0.24.1
	github.com/charmbracelet/lipgloss v0.7.1
	github.com/schollz/progressbar/v3 v3.13.1
	github.com/golang-jwt/jwt/v5 v5.0.0
	github.com/casbin/casbin/v2 v2.71.1
	golang.org/x/crypto v0.9.0
	golang.org/x/oauth2 v0.8.0
	github.com/coreos/go-oidc/v3 v3.6.0
	github.com/robfig/cron/v3 v3.0.1
	github.com/hibiken/asynq v0.24.1
	github.com/cenkalti/backoff/v4 v4.2.1
	github.com/sony/gobreaker v0.5.0
	github.com/patrickmn/go-cache v2.1.0+incompatible
	github.com/allegro/bigcache/v3 v3.1.0
	github.com/dgraph-io/ristretto v0.1.1
	github.com/mitchellh/mapstructure v1.5.0
	github.com/spf13/cast v1.5.1
	github.com/google/uuid v1.3.0
	github.com/rs/xid v1.5.0
	github.com/shopspring/decimal v1.3.1
	github.com/dustin/go-humanize v1.0.1
	github.com/yuin/goldmark v1.5.4
	github.com/pelletier/go-toml/v2 v2.0.8
	gopkg.in/yaml.v3 v3.0.1
	github.com/BurntSushi/toml v1.3.2
	github.com/tidwall/gjson v1.14.4
	github.com/tidwall/sjson v1.2.5
	github.com/goccy/go-json v0.10.2
	github.com/vmihailenco/msgpack/v5 v5.3.5
	google.golang.org/protobuf v1.30.0
	github.com/grpc-ecosystem/grpc-gateway/v2 v2.16.0
	github.com/grpc-ecosystem/go-grpc-middleware v1.4.0
	go.opentelemetry.io/otel v1.16.0
	go.opentelemetry.io/otel/sdk v1.16.0
	github.com/getsentry/sentry-go v0.22.0
	github.com/rs/zerolog v1.29.1
	go.uber.org/fx v1.19.3
	github.com/google/wire v0.5.0
	github.com/samber/lo v1.38.1
	golang.org/x/sync v0.3.0
	golang.org/x/net v0.10.0
	golang.org/x/sys v0.8.0
	golang.org/x/text v0.9.0
	golang.org/x/time v0.3.0
	golang.org/x/tools v0.9.3
)

require (
	github.com/beorn7/perks v1.0.1 // indirect
	github.com/cespare/xxhash/v2 v2.2.0 // indirect
	github.com/fsnotify/fsnotify v1.6.0 // indirect
	github.com/gin-contrib/sse v0.1.0 // indirect
	github.com/go-playground/locales v0.14.1 // indirect
	github.com/go-playground/universal-translator v0.18.1 // indirect
	github.com/golang/protobuf v1.5.3 // indirect
	github.com/hashicorp/hcl v1.0.0 // indirect
	github.com/json-iterator/go v1.1.12 // indirect
	github.com/leodido/go-urn v1.2.4 // indirect
	github.com/magiconair/properties v1.8.7 // indirect
	github.com/mattn/go-isatty v0.0.19 // indirect
	github.com/matttproud/golang_protobuf_extensions v1.0.4 // indirect
	github.com/modern-go/concurrent v0.0.0-20180306012644-bacd9c7ef1dd // indirect
	github.com/modern-go/reflect2 v1.0.2 // indirect
	github.com/prometheus/client_model v0.4.0 // indirect
	github.com/prometheus/common v0.44.0 // indirect
	github.com/prometheus/procfs v0.10.1 // indirect
	github.com/spf13/afero v1.9.5 // indirect
	github.com/spf13/jwalterweatherman v1.1.0 // indirect
	github.com/spf13/pflag v1.0.5 // indirect
	github.com/subosito/gotenv v1.4.2 // indirect
	github.com/ugorji/go/codec v1.2.11 // indirect
	go.uber.org/atomic v1.11.0 // indirect
	go.uber.org/multierr v1.11.0 // indirect
	gopkg.in/ini.v1 v1.67.0 // indirect
	gopkg.in/yaml.v2 v2.4.0 // indirect
	github.com/davecgh/go-spew v1.1.1 // indirect
	github.com/pmezard/go-difflib v1.0.0 // indirect
	github.com/klauspost/compress v1.16.5 // indirect
	github.com/valyala/bytebufferpool v1.0.0 // indirect
	github.com/andybalholm/brotli v1.0.5 // indirect
	github.com/mattn/go-colorable v0.1.13 // indirect
	github.com/mattn/go-runewidth v0.0.14 // indirect
	github.com/muesli/termenv v0.15.1 // indirect
	github.com/muesli/reflow v0.3.0 // indirect
	github.com/lucasb-eyer/go-colorful v1.2.0 // indirect
	github.com/containerd/console v1.0.4 // indirect
	github.com/jackc/pgpassfile v1.0.0 // indirect
	github.com/jinzhu/inflection v1.0.0 // indirect
	github.com/jinzhu/now v1.1.5 // indirect
	github.com/golang/snappy v0.0.4 // indirect
	github.com/xdg-go/pbkdf2 v1.0.0 // indirect
	github.com/xdg-go/scram v1.1.2 // indirect
	github.com/montanaflynn/stats v0.7.1 // indirect
)
