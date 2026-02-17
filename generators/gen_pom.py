#!/usr/bin/env python3
"""Generate pom.xml with ~500 dependencies."""
import os
BASE = os.path.dirname(os.path.abspath(__file__))

deps = []
# Existing
deps += [('org.springframework.boot','spring-boot-starter-web','2.7.11'),('com.fasterxml.jackson.core','jackson-databind','2.14.2'),('org.apache.struts','struts2-core','2.5.26'),('org.springframework','spring-beans','5.2.0.RELEASE'),('org.apache.commons','commons-lang3','3.20.0'),('org.hibernate','hibernate-core','5.6.15.Final'),('org.junit.jupiter','junit-jupiter-api','5.9.3'),('org.projectlombok','lombok','1.18.42')]

# Spring
for a in ['spring-core','spring-context','spring-aop','spring-jdbc','spring-tx','spring-web','spring-webmvc','spring-orm','spring-expression','spring-messaging','spring-websocket','spring-test','spring-jms','spring-oxm','spring-aspects']:
    deps.append(('org.springframework', a, '5.3.27'))
for a in ['spring-boot-starter','spring-boot-starter-data-jpa','spring-boot-starter-security','spring-boot-starter-actuator','spring-boot-starter-test','spring-boot-starter-mail','spring-boot-starter-cache','spring-boot-starter-validation','spring-boot-starter-websocket','spring-boot-starter-amqp','spring-boot-starter-data-redis','spring-boot-starter-data-mongodb','spring-boot-starter-thymeleaf','spring-boot-starter-webflux','spring-boot-starter-oauth2-client','spring-boot-starter-oauth2-resource-server','spring-boot-starter-batch','spring-boot-starter-integration','spring-boot-starter-quartz','spring-boot-starter-graphql']:
    deps.append(('org.springframework.boot', a, '2.7.11'))
for a in ['spring-security-core','spring-security-web','spring-security-config','spring-security-oauth2-core','spring-security-oauth2-jose','spring-security-oauth2-client','spring-security-oauth2-resource-server','spring-security-crypto','spring-security-test','spring-security-cas','spring-security-ldap','spring-security-acl']:
    deps.append(('org.springframework.security', a, '5.8.3'))
for a in ['spring-data-jpa','spring-data-commons','spring-data-mongodb','spring-data-redis','spring-data-elasticsearch','spring-data-cassandra','spring-data-neo4j','spring-data-rest-core','spring-data-rest-webmvc','spring-data-jdbc','spring-data-r2dbc','spring-data-ldap']:
    deps.append(('org.springframework.data', a, '3.0.5'))

# Jackson
for a in ['jackson-core','jackson-annotations']: deps.append(('com.fasterxml.jackson.core',a,'2.14.2'))
for a in ['jackson-dataformat-xml','jackson-dataformat-yaml','jackson-dataformat-csv','jackson-dataformat-cbor']: deps.append(('com.fasterxml.jackson.dataformat',a,'2.14.2'))
for a in ['jackson-datatype-jsr310','jackson-datatype-jdk8','jackson-datatype-guava']: deps.append(('com.fasterxml.jackson.datatype',a,'2.14.2'))
for a in ['jackson-module-kotlin','jackson-module-parameter-names','jackson-module-afterburner']: deps.append(('com.fasterxml.jackson.module',a,'2.14.2'))

# Google
deps += [('com.google.guava','guava','31.1-jre'),('com.google.code.gson','gson','2.10.1'),('com.google.protobuf','protobuf-java','3.22.3'),('com.google.protobuf','protobuf-java-util','3.22.3'),('com.google.errorprone','error_prone_annotations','2.18.0'),('com.google.auto.value','auto-value','1.10.1'),('com.google.inject','guice','5.1.0'),('com.google.truth','truth','1.1.3'),('com.google.code.findbugs','jsr305','3.0.2'),('com.google.http-client','google-http-client','1.43.1'),('com.google.api-client','google-api-client','2.2.0')]
for s in ['storage','bigquery','pubsub','datastore','spanner','logging','firestore','kms','bigtable','tasks','vision','speech','language','monitoring','trace','secretmanager','container','compute','dns']:
    deps.append(('com.google.cloud',f'google-cloud-{s}','2.22.0'))

# HTTP
deps += [('org.apache.httpcomponents','httpclient','4.5.14'),('org.apache.httpcomponents','httpcore','4.4.16'),('org.apache.httpcomponents','httpmime','4.5.14'),('org.apache.httpcomponents.client5','httpclient5','5.2.1'),('org.apache.httpcomponents.core5','httpcore5','5.2.1')]

# Logging
deps += [('org.slf4j','slf4j-api','2.0.7'),('org.slf4j','slf4j-simple','2.0.7'),('org.slf4j','jcl-over-slf4j','2.0.7'),('org.slf4j','jul-to-slf4j','2.0.7'),('ch.qos.logback','logback-classic','1.4.7'),('ch.qos.logback','logback-core','1.4.7'),('org.apache.logging.log4j','log4j-core','2.20.0'),('org.apache.logging.log4j','log4j-api','2.20.0'),('org.apache.logging.log4j','log4j-slf4j2-impl','2.20.0'),('org.apache.logging.log4j','log4j-web','2.20.0')]

# DB
deps += [('mysql','mysql-connector-java','8.0.33'),('org.postgresql','postgresql','42.6.0'),('com.h2database','h2','2.1.214'),('org.hsqldb','hsqldb','2.7.1'),('org.xerial','sqlite-jdbc','3.41.2.1'),('com.oracle.database.jdbc','ojdbc11','23.2.0.0'),('com.microsoft.sqlserver','mssql-jdbc','12.2.0.jre11'),('org.mariadb.jdbc','mariadb-java-client','3.1.4'),('org.flywaydb','flyway-core','9.16.3'),('org.liquibase','liquibase-core','4.21.1'),('com.zaxxer','HikariCP','5.0.1'),('org.mybatis','mybatis','3.5.13'),('org.mybatis','mybatis-spring','3.0.1'),('org.jooq','jooq','3.18.4'),('org.jooq','jooq-meta','3.18.4'),('org.hibernate.validator','hibernate-validator','8.0.0.Final'),('org.hibernate','hibernate-envers','5.6.15.Final'),('org.hibernate','hibernate-c3p0','5.6.15.Final'),('redis.clients','jedis','4.4.1'),('io.lettuce','lettuce-core','6.2.4.RELEASE'),('org.mongodb','mongodb-driver-sync','4.9.1'),('org.mongodb','bson','4.9.1'),('org.neo4j.driver','neo4j-java-driver','5.7.0'),('com.datastax.oss','java-driver-core','4.15.0'),('co.elastic.clients','elasticsearch-java','8.7.1')]

# Testing
deps += [('org.junit.jupiter','junit-jupiter-engine','5.9.3'),('org.junit.jupiter','junit-jupiter-params','5.9.3'),('org.junit.platform','junit-platform-launcher','1.9.3'),('org.mockito','mockito-core','5.3.1'),('org.mockito','mockito-junit-jupiter','5.3.1'),('org.assertj','assertj-core','3.24.2'),('org.hamcrest','hamcrest','2.2'),('io.rest-assured','rest-assured','5.3.0'),('org.testcontainers','testcontainers','1.18.1'),('org.testcontainers','junit-jupiter','1.18.1'),('org.testcontainers','postgresql','1.18.1'),('org.testcontainers','mysql','1.18.1'),('org.testcontainers','mongodb','1.18.1'),('org.testcontainers','kafka','1.18.1'),('com.github.tomakehurst','wiremock-jre8','2.35.0'),('org.awaitility','awaitility','4.2.0'),('org.openjdk.jmh','jmh-core','1.36'),('com.tngtech.archunit','archunit-junit5','1.0.1'),('io.cucumber','cucumber-java','7.12.0'),('io.cucumber','cucumber-junit-platform-engine','7.12.0'),('org.seleniumhq.selenium','selenium-java','4.9.1'),('io.github.bonigarcia','webdrivermanager','5.3.2')]

# Messaging
deps += [('org.apache.kafka','kafka-clients','3.4.0'),('org.apache.kafka','kafka-streams','3.4.0'),('org.springframework.kafka','spring-kafka','2.9.8'),('com.rabbitmq','amqp-client','5.17.0'),('org.apache.activemq','activemq-client','5.18.1'),('org.apache.pulsar','pulsar-client','3.0.0'),('io.nats','jnats','2.16.11')]

# Web/gRPC
deps += [('javax.servlet','javax.servlet-api','4.0.1'),('jakarta.servlet','jakarta.servlet-api','6.0.0'),('javax.ws.rs','javax.ws.rs-api','2.1.1'),('jakarta.ws.rs','jakarta.ws.rs-api','3.1.0'),('org.glassfish.jersey.core','jersey-server','3.1.1'),('org.glassfish.jersey.core','jersey-client','3.1.1'),('org.glassfish.jersey.containers','jersey-container-servlet','3.1.1'),('org.glassfish.jersey.inject','jersey-hk2','3.1.1'),('org.glassfish.jersey.media','jersey-media-json-jackson','3.1.1'),('io.grpc','grpc-netty-shaded','1.54.1'),('io.grpc','grpc-protobuf','1.54.1'),('io.grpc','grpc-stub','1.54.1'),('io.grpc','grpc-core','1.54.1'),('io.grpc','grpc-services','1.54.1'),('io.grpc','grpc-testing','1.54.1'),('javax.annotation','javax.annotation-api','1.3.2'),('jakarta.annotation','jakarta.annotation-api','2.1.1'),('io.swagger.core.v3','swagger-core','2.2.9'),('io.swagger.core.v3','swagger-annotations','2.2.9'),('org.springdoc','springdoc-openapi-ui','1.7.0'),('org.springdoc','springdoc-openapi-starter-webmvc-ui','2.1.0')]

# Netty
for a in ['netty-all','netty-buffer','netty-codec','netty-codec-http','netty-codec-http2','netty-common','netty-handler','netty-transport','netty-transport-native-epoll','netty-resolver']:
    deps.append(('io.netty',a,'4.1.92.Final'))

# Reactive
deps += [('io.projectreactor','reactor-core','3.5.6'),('io.projectreactor','reactor-test','3.5.6'),('io.projectreactor.netty','reactor-netty','1.1.7'),('io.reactivex.rxjava3','rxjava','3.1.6'),('io.vertx','vertx-core','4.4.2'),('io.vertx','vertx-web','4.4.2'),('io.vertx','vertx-web-client','4.4.2'),('io.vertx','vertx-pg-client','4.4.2')]

# Security
deps += [('org.bouncycastle','bcprov-jdk18on','1.73'),('org.bouncycastle','bcpkix-jdk18on','1.73'),('com.nimbusds','nimbus-jose-jwt','9.31'),('io.jsonwebtoken','jjwt-api','0.11.5'),('io.jsonwebtoken','jjwt-impl','0.11.5'),('io.jsonwebtoken','jjwt-jackson','0.11.5'),('org.keycloak','keycloak-spring-boot-starter','21.1.1'),('org.apache.shiro','shiro-core','1.11.0'),('org.apache.shiro','shiro-web','1.11.0')]

# Caching
deps += [('org.ehcache','ehcache','3.10.8'),('com.github.ben-manes.caffeine','caffeine','3.1.6'),('javax.cache','cache-api','1.1.1'),('com.hazelcast','hazelcast','5.3.0')]

# Serialization
deps += [('org.apache.avro','avro','1.11.1'),('com.esotericsoftware','kryo','5.5.0'),('org.msgpack','msgpack-core','0.9.3'),('org.yaml','snakeyaml','2.0'),('com.thoughtworks.xstream','xstream','1.4.20'),('javax.xml.bind','jaxb-api','2.3.1'),('org.glassfish.jaxb','jaxb-runtime','4.0.2'),('com.opencsv','opencsv','5.7.1'),('org.apache.poi','poi','5.2.3'),('org.apache.poi','poi-ooxml','5.2.3')]

# Monitoring
for a in ['micrometer-core','micrometer-registry-prometheus','micrometer-registry-datadog','micrometer-registry-graphite','micrometer-registry-influx','micrometer-registry-jmx','micrometer-registry-new-relic','micrometer-registry-statsd','micrometer-tracing','micrometer-tracing-bridge-brave','micrometer-tracing-bridge-otel']:
    deps.append(('io.micrometer',a,'1.11.0'))
deps += [('io.opentelemetry','opentelemetry-api','1.26.0'),('io.opentelemetry','opentelemetry-sdk','1.26.0'),('io.opentelemetry','opentelemetry-exporter-otlp','1.26.0'),('io.opentelemetry','opentelemetry-exporter-jaeger','1.26.0'),('io.zipkin.brave','brave','5.15.1'),('io.prometheus','simpleclient','0.16.0'),('io.prometheus','simpleclient_hotspot','0.16.0'),('io.prometheus','simpleclient_httpserver','0.16.0'),('io.sentry','sentry','6.19.0'),('io.sentry','sentry-spring-boot-starter','6.19.0')]

# Utility
deps += [('commons-io','commons-io','2.12.0'),('commons-codec','commons-codec','1.15'),('commons-beanutils','commons-beanutils','1.9.4'),('commons-fileupload','commons-fileupload','1.5'),('org.apache.commons','commons-compress','1.23.0'),('org.apache.commons','commons-csv','1.10.0'),('org.apache.commons','commons-math3','3.6.1'),('org.apache.commons','commons-pool2','2.11.1'),('org.apache.commons','commons-text','1.10.0'),('org.apache.commons','commons-collections4','4.4'),('joda-time','joda-time','2.12.5'),('org.modelmapper','modelmapper','3.1.1'),('org.mapstruct','mapstruct','1.5.5.Final'),('org.mapstruct','mapstruct-processor','1.5.5.Final'),('com.github.javafaker','javafaker','1.0.2'),('org.apache.tika','tika-core','2.7.0'),('net.lingala.zip4j','zip4j','2.11.5'),('com.squareup.okhttp3','okhttp','4.11.0'),('com.squareup.okhttp3','logging-interceptor','4.11.0'),('com.squareup.retrofit2','retrofit','2.9.0'),('com.squareup.retrofit2','converter-jackson','2.9.0'),('com.squareup.retrofit2','converter-gson','2.9.0'),('org.jsoup','jsoup','1.16.1'),('com.jayway.jsonpath','json-path','2.8.0'),('org.json','json','20230227'),('com.google.zxing','core','3.5.1'),('org.quartz-scheduler','quartz','2.3.2'),('net.javacrumbs.shedlock','shedlock-core','5.3.0'),('net.javacrumbs.shedlock','shedlock-spring','5.3.0')]

# AWS v2
for svc in ['s3','sqs','sns','dynamodb','lambda','iam','sts','kms','ses','cloudwatch','ec2','rds','secretsmanager','ssm','kinesis','cloudformation','elasticache','ecs','eks','route53','cognitoidentityprovider','eventbridge','stepfunctions','athena','glue','redshift','emr','sagemaker','comprehend','rekognition','textract','translate','polly','transcribe','apigateway','appsync','codecommit','codebuild','codedeploy','codepipeline']:
    deps.append(('software.amazon.awssdk',svc,'2.20.68'))

# AWS v1
deps += [('com.amazonaws','aws-lambda-java-core','1.2.2'),('com.amazonaws','aws-java-sdk-s3','1.12.470'),('com.amazonaws','aws-java-sdk-sqs','1.12.470'),('com.amazonaws','aws-java-sdk-dynamodb','1.12.470'),('com.amazonaws','aws-java-sdk-core','1.12.470'),('com.amazonaws','aws-java-sdk-sns','1.12.470'),('com.amazonaws','aws-java-sdk-lambda','1.12.470'),('com.amazonaws','aws-java-sdk-ec2','1.12.470'),('com.amazonaws','aws-java-sdk-sts','1.12.470'),('com.amazonaws','aws-java-sdk-kms','1.12.470')]

# Misc
deps += [('org.aspectj','aspectjrt','1.9.19'),('org.aspectj','aspectjweaver','1.9.19'),('cglib','cglib','3.3.0'),('org.javassist','javassist','3.29.2-GA'),('org.ow2.asm','asm','9.5'),('net.bytebuddy','byte-buddy','1.14.4'),('net.bytebuddy','byte-buddy-agent','1.14.4'),('org.objenesis','objenesis','3.3'),('javax.validation','validation-api','2.0.1.Final'),('jakarta.validation','jakarta.validation-api','3.0.2'),('javax.persistence','javax.persistence-api','2.2'),('jakarta.persistence','jakarta.persistence-api','3.1.0'),('javax.transaction','javax.transaction-api','1.3'),('jakarta.transaction','jakarta.transaction-api','2.0.1'),('javax.inject','javax.inject','1'),('jakarta.inject','jakarta.inject-api','2.0.1'),('javax.mail','javax.mail-api','1.6.2'),('jakarta.mail','jakarta.mail-api','2.1.1'),('org.freemarker','freemarker','2.3.32'),('org.thymeleaf','thymeleaf','3.1.1.RELEASE'),('org.thymeleaf','thymeleaf-spring5','3.1.1.RELEASE'),('org.apache.velocity','velocity-engine-core','2.3')]
deps += [('org.eclipse.jetty','jetty-server','11.0.15'),('org.eclipse.jetty','jetty-servlet','11.0.15'),('org.eclipse.jetty','jetty-webapp','11.0.15'),('org.eclipse.jetty','jetty-client','11.0.15'),('org.eclipse.jetty','jetty-http','11.0.15'),('org.eclipse.jetty','jetty-io','11.0.15'),('org.eclipse.jetty','jetty-util','11.0.15'),('org.eclipse.jetty','jetty-security','11.0.15')]
deps += [('org.apache.tomcat.embed','tomcat-embed-core','10.1.8'),('org.apache.tomcat.embed','tomcat-embed-jasper','10.1.8'),('org.apache.tomcat.embed','tomcat-embed-websocket','10.1.8'),('io.undertow','undertow-core','2.3.5.Final'),('io.undertow','undertow-servlet','2.3.5.Final')]
deps += [('org.apache.camel','camel-core','4.0.0-M3'),('org.apache.camel','camel-spring-boot-starter','4.0.0-M3'),('org.apache.camel','camel-kafka','4.0.0-M3'),('org.apache.camel','camel-http','4.0.0-M3'),('org.apache.camel','camel-jackson','4.0.0-M3'),('org.apache.camel','camel-jms','4.0.0-M3'),('org.apache.camel','camel-sql','4.0.0-M3'),('org.apache.camel','camel-file','4.0.0-M3'),('org.apache.camel','camel-ftp','4.0.0-M3'),('org.apache.camel','camel-mail','4.0.0-M3')]
deps += [('io.github.resilience4j','resilience4j-spring-boot2','2.0.2'),('io.github.resilience4j','resilience4j-circuitbreaker','2.0.2'),('io.github.resilience4j','resilience4j-ratelimiter','2.0.2'),('io.github.resilience4j','resilience4j-retry','2.0.2'),('io.github.resilience4j','resilience4j-bulkhead','2.0.2'),('io.github.resilience4j','resilience4j-timelimiter','2.0.2'),('io.github.resilience4j','resilience4j-cache','2.0.2')]
deps += [('com.graphql-java','graphql-java','20.2'),('com.netflix.graphql.dgs','graphql-dgs-spring-boot-starter','6.0.5')]
deps += [('org.apache.lucene','lucene-core','9.6.0'),('org.apache.lucene','lucene-queryparser','9.6.0'),('org.apache.solr','solr-solrj','9.2.1')]
deps += [('io.fabric8','kubernetes-client','6.6.2'),('io.kubernetes','client-java','18.0.0'),('org.apache.zookeeper','zookeeper','3.8.1'),('org.apache.curator','curator-framework','5.5.0'),('org.apache.curator','curator-recipes','5.5.0')]
deps += [('com.google.dagger','dagger','2.46.1'),('org.checkerframework','checker-qual','3.33.0')]
deps += [('org.codehaus.groovy','groovy','3.0.17'),('org.codehaus.groovy','groovy-json','3.0.17'),('org.codehaus.groovy','groovy-xml','3.0.17')]
deps += [('org.scala-lang','scala-library','2.13.10'),('org.jetbrains.kotlin','kotlin-stdlib','1.8.21'),('org.jetbrains.kotlin','kotlin-reflect','1.8.21'),('org.jetbrains.kotlinx','kotlinx-coroutines-core','1.7.1'),('org.jetbrains.kotlinx','kotlinx-serialization-json','1.5.1'),('org.jetbrains','annotations','24.0.1')]
deps += [('org.apache.pdfbox','pdfbox','2.0.28'),('org.jfree','jfreechart','1.5.4'),('com.twilio.sdk','twilio','9.6.1'),('com.sendgrid','sendgrid-java','4.9.3'),('com.stripe','stripe-java','22.16.0')]

# Additional to reach 500+
deps += [('com.braintreepayments.gateway','braintree-java','3.22.0'),('com.paypal.sdk','rest-api-sdk','1.14.0'),('com.github.oshi','oshi-core','6.4.2'),('com.itextpdf','itext7-core','7.2.5'),('net.sf.jasperreports','jasperreports','6.20.1')]
deps += [('org.apache.commons','commons-exec','1.4.0'),('org.apache.commons','commons-configuration2','2.9.0'),('org.apache.commons','commons-dbcp2','2.9.0'),('org.apache.commons','commons-email','1.5'),('org.apache.commons','commons-net','3.9.0'),('org.apache.commons','commons-validator','1.7')]
deps += [('io.dropwizard','dropwizard-core','4.0.0'),('io.dropwizard','dropwizard-jersey','4.0.0'),('io.dropwizard','dropwizard-jackson','4.0.0'),('io.dropwizard','dropwizard-validation','4.0.0'),('io.dropwizard','dropwizard-configuration','4.0.0'),('io.dropwizard','dropwizard-logging','4.0.0'),('io.dropwizard','dropwizard-metrics','4.0.0'),('io.dropwizard','dropwizard-auth','4.0.0'),('io.dropwizard','dropwizard-db','4.0.0'),('io.dropwizard','dropwizard-migrations','4.0.0')]
deps += [('io.dropwizard.metrics','metrics-core','4.2.18'),('io.dropwizard.metrics','metrics-jvm','4.2.18'),('io.dropwizard.metrics','metrics-healthchecks','4.2.18'),('io.dropwizard.metrics','metrics-json','4.2.18'),('io.dropwizard.metrics','metrics-servlets','4.2.18')]
deps += [('org.apache.spark','spark-core_2.13','3.4.0'),('org.apache.spark','spark-sql_2.13','3.4.0'),('org.apache.spark','spark-streaming_2.13','3.4.0'),('org.apache.spark','spark-mllib_2.13','3.4.0')]
deps += [('org.apache.flink','flink-java','1.17.1'),('org.apache.flink','flink-streaming-java','1.17.1'),('org.apache.flink','flink-clients','1.17.1'),('org.apache.flink','flink-connector-kafka','1.17.1')]
deps += [('org.apache.hadoop','hadoop-common','3.3.5'),('org.apache.hadoop','hadoop-hdfs','3.3.5'),('org.apache.hadoop','hadoop-mapreduce-client-core','3.3.5'),('org.apache.hadoop','hadoop-yarn-client','3.3.5')]
deps += [('org.apache.hive','hive-jdbc','3.1.3'),('org.apache.hbase','hbase-client','2.5.4')]
deps += [('com.github.spullara.mustache.java','compiler','0.9.10'),('ma.glasnost.orika','orika-core','1.5.4')]
deps += [('net.minidev','json-smart','2.4.10'),('com.google.zxing','javase','3.5.1')]
deps += [('org.ow2.asm','asm-commons','9.5'),('org.ow2.asm','asm-util','9.5')]
deps += [('jakarta.el','jakarta.el-api','5.0.1'),('com.sun.mail','jakarta.mail','2.0.1')]
deps += [('org.infinispan','infinispan-core','14.0.8.Final'),('com.hazelcast','hazelcast-spring','5.3.0'),('net.sf.ehcache','ehcache','2.10.9.2')]
deps += [('org.hibernate','hibernate-ehcache','5.6.15.Final'),('org.jooq','jooq-codegen','3.18.4')]
deps += [('org.elasticsearch.client','elasticsearch-rest-high-level-client','7.17.9'),('org.mongodb','mongodb-driver-core','4.9.1')]
deps += [('org.mockito','mockito-inline','5.2.0'),('org.hamcrest','hamcrest-core','2.2'),('nl.jqno.equalsverifier','equalsverifier','3.14.1'),('org.openjdk.jmh','jmh-generator-annprocess','1.36'),('com.tngtech.archunit','archunit','1.0.1'),('io.cucumber','cucumber-spring','7.12.0'),('org.seleniumhq.selenium','selenium-chrome-driver','4.9.1')]
deps += [('org.apache.activemq','artemis-jms-client','2.28.0')]
deps += [('io.springfox','springfox-boot-starter','3.0.0'),('io.springfox','springfox-swagger2','3.0.0'),('io.springfox','springfox-swagger-ui','3.0.0')]
deps += [('io.reactivex.rxjava2','rxjava','2.2.21'),('io.vertx','vertx-auth-jwt','4.4.2')]
deps += [('org.bouncycastle','bcutil-jdk18on','1.73'),('org.keycloak','keycloak-admin-client','21.1.1'),('org.apache.shiro','shiro-spring','1.11.0')]
deps += [('io.opentelemetry','opentelemetry-exporter-zipkin','1.26.0'),('io.zipkin.reporter2','zipkin-reporter','2.16.4'),('io.prometheus','simpleclient_pushgateway','0.16.0'),('io.sentry','sentry-logback','6.19.0')]
deps += [('com.squareup.okhttp3','mockwebserver','4.11.0'),('com.squareup.retrofit2','adapter-rxjava3','2.9.0'),('org.apache.tika','tika-parsers-standard-package','2.7.0'),('net.javacrumbs.shedlock','shedlock-provider-jdbc-template','5.3.0')]
deps += [('com.graphql-java-kickstart','graphql-spring-boot-starter','15.0.0'),('org.apache.lucene','lucene-analyzers-common','8.11.2')]
deps += [('com.amazonaws','aws-lambda-java-events','3.11.1'),('com.amazonaws','aws-java-sdk-iam','1.12.470')]
deps += [('io.fabric8','kubernetes-model-core','6.6.2'),('org.apache.curator','curator-client','5.5.0'),('com.google.dagger','dagger-compiler','2.46.1'),('com.google.j2objc','j2objc-annotations','2.8')]
deps += [('org.codehaus.groovy','groovy-sql','3.0.17'),('org.jetbrains.kotlin','kotlin-stdlib-jdk8','1.8.21'),('org.jetbrains.kotlinx','kotlinx-coroutines-reactor','1.7.1')]
deps += [('io.undertow','undertow-websockets-jsr','2.3.5.Final')]
deps += [('org.apache.httpcomponents','httpasyncclient','4.1.5'),('org.slf4j','log4j-over-slf4j','2.0.7'),('org.apache.logging.log4j','log4j-1.2-api','2.20.0')]
deps += [('org.junit.vintage','junit-vintage-engine','5.9.3'),('org.junit.platform','junit-platform-commons','1.9.3')]
deps += [('com.google.errorprone','error_prone_core','2.18.0'),('com.google.auto.value','auto-value-annotations','1.10.1'),('com.google.jimfs','jimfs','1.2'),('com.google.re2j','re2j','1.7'),('com.google.http-client','google-http-client-jackson2','1.43.1')]
deps += [('org.glassfish.jersey.core','jersey-common','3.1.1'),('io.grpc','grpc-api','1.54.1')]
deps += [('io.swagger.core.v3','swagger-models','2.2.9')]

# Dedup
seen = set(); unique = []
for g,a,v in deps:
    if (g,a) not in seen: seen.add((g,a)); unique.append((g,a,v))

lines = ['<?xml version="1.0" encoding="UTF-8"?>','<project xmlns="http://maven.apache.org/POM/4.0.0"','         xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"','         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">','    <modelVersion>4.0.0</modelVersion>','','    <groupId>com.example</groupId>','    <artifactId>sbom-test-java</artifactId>','    <version>1.0-SNAPSHOT</version>','','    <properties>','        <maven.compiler.source>11</maven.compiler.source>','        <maven.compiler.target>11</maven.compiler.target>','        <project.build.sourceEncoding>UTF-8</project.build.sourceEncoding>','    </properties>','','    <dependencies>']
for g,a,v in unique:
    lines += [f'        <dependency>',f'            <groupId>{g}</groupId>',f'            <artifactId>{a}</artifactId>',f'            <version>{v}</version>',f'        </dependency>']
lines += ['    </dependencies>','','    <build>','        <plugins>','            <plugin>','                <groupId>org.apache.maven.plugins</groupId>','                <artifactId>maven-compiler-plugin</artifactId>','                <version>3.11.0</version>','            </plugin>','        </plugins>','    </build>','</project>']

with open(os.path.join(BASE,'java','pom.xml'),'w') as f: f.write('\n'.join(lines)+'\n')
print(f"pom.xml: {len(unique)} dependencies")
