# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this project adheres
to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [3.0.1] - 2025-04-22

### Added

- ssd-cloud-config: fix default value `get-user-data` URL of core-data


## [3.0.0] - 2025-04-21

### Changed

- ssd-cloud-config: add all config props, related to `release/1.14`

### Removed

- ssd-infra: remove all containerized system-required software


## [2.6.1] - 2025-04-17

### Changed

- app: `ssd-proxy-ws`: add label with config-checksum (for auto-recreate Pod, if config changed)

## [2.6.0] - 2025-03-21

### Changed

- cm: `ssd-cloud-config`: add endpoints.web.exposure: include & exclude
- cm: `ssd-proxy-ws`: change URLs template for Jenkins/CID

## [2.5.0] - 2024-12-16

### Added

- app: `*`: allow specifying defaultMode for CM and Secrets, default to 0400 (256)
- cm: `ssd-cloud-config`: SSL support for internal Kafka
- cm: `ssd-proxy-ws`: add template for SWTR routes
- secrets: `ssd-kafka-*`: SSL support for internal Kafka - configuration template

### Changed

- cm: `ssd-proxy-ws`: change template for Artifactory routes
- cm: `ssd-proxy-ws`: change template for `.git`-containing routes of SC

## [2.4.0] - 2024-11-15

### Added
- app: `ssd-demo-ui`: demo application for side-menu V4
- cm: `ssd-cloud-config`: new properties for application features
  - extend traceable headers list
  - CloudBus disabling
  - Kafka security-related configuration
  - audit process - write entries as JSON entries to text file

### Changed
- app: `ssd-message-broker`: allow overriding replicas via values file
- app: `ssd-proxy-ws`:
  - configuring auth_block at OneWork routes separately from other products (for storage privileges mode support)
  - configure `ssd-ui` proxy target via values

## [2.3.1] - 2024-11-12

### Added
- cm: `ssd-proxy-ws`: specific routes for CodeScanner and Artifactory URL-decoding cases

## [2.3.0] - 2024-10-14

### Added
- app: `ssd-ai-service`: new service for AI-tasks processing
- app: `ssd-*`: allow configuring target image with `@sha256`

### Changed
- app: `ssd-role-manager`: allow base role model overriding via ConfigMap mounting
- app: `ssd-proxy-ws`: reading secret values from JSON instead of environment variables
- app: `ssd-ui`: mounting nginx config from ConfigMap making `readOnlyRootFilesystem=true` possible
- app: `ssd-adapter-source-control`: allow running multiple instances
- app: `ssd-side-menu-backend`: allow overriding Liquibase configuration

### Removed
- app + ing: `ssd-cloud-admin`: remove separate Ingress manifest

## [2.2.0] - 2024-09-25

### Added
- app: `ssd-kafka-integration-adapter`: separate gateway service for processing Kafka requests from external master systems
- app: `ssd-privileges-service`: platform-level service for privileges management
- app: `ssd-side-menu-backend`:  service for projects' context building in a new side-menu component
- app: `ssd-adapter-dataspace`: adapter for DataSpace Lab

## [2.1.0] - 2024-09-23

### Added
- app: `ssd-proxy-ws`: allow configuring body size limits for DPM and FOSE API routes

## [2.0.0] - 2024-08-05

### Added
- app: `ssd-kafka-ui`: helper for testing and debugging broker state

### Changed
- app: Java apps: fix STD-22 violations: add `ssd-adapters-files.yaml`, `ssd-common-props.yaml`, `ssd-db-props.yaml`,
  `ssd-rm-props.yaml` for mounting secret properties as a file
- app: ssd-adapters: replaced service-specific manifests (`app-ssd-adapter-*.yaml`) with a unified manifest
  `app-ssd-adapter.yaml` allowing  creation of arbitrary number of adapters
- cm: ssd-common: move to `ssd-infra`
- cm: ssd-adapters: add `ssdAdaptersConfig` and `ssdAdapters.files` sections allowing configuration for arbitrary
  number of adapters

## [1.4.0] - 2024-06-27

### Added
- app: `ssd-adapter-nexus`: configuring rewrite policies
- cm: `ssd-cloud-config`: logging profiles (`default` and `platform`)
- cm: `ssd-ui`: allow overriding content via values file
- cm: `ssd-proxy-ws`:
  - allow custom routes
  - accessing `ssd-cloud-admin`

### Removed
- app + ing: `ssd-cloud-admin`: remove separate Ingress

## [1.3.1] - 2024-06-26

### Added
- cm: `ssd-ui`
  - add `room` element to side-menu structure exposing Jazz functionality for environments with side-menu overriding

## [1.3] - 2024-04-18

### Added
- app: `ssd-proxy-ws`: token encryptors' configuration via secret
- app: `ssd-transaction-manager`: allow configuring scheduled tasks' cron
- app: `ssd-ui`: allow configuring `nginx` via HELM values
- cm: `ssd-proxy-ws`
  - allow configuring integration with arbitrary number of Nexus instances
  - allow configuring integration with arbitrary number of Jenkins instances

### Changed
- app: `ssd-proxy-ws` + `ssd-ui-admin`: use cm `ssd-common` as a single source for the session cookie name

### Removed
- app + ing: `ssd-iam-proxy` is not used since `0.4.0` and its functions are provided by `ssd-proxy-ws`

## [1.2.3] - 2024-04-22

### Changed
- cm: ssd-proxy-ws: allow configuring a mask for `deny all` behaviour

## [1.2.2] - 2024-04-02

### Changed
- cm: ssd-proxy-ws: fix `groups` requests proxying to TrackWork (RELS-3576)

## [1.2.1] - 2024-03-28

### Changed
- cm: ssd-proxy-ws: config template improvements (proxy calls to `filter/context` to `filter/context2end`)

## [1.2] - 2024-03-25

### Added

- app: ssd-adapter-jazz: new adapter for SberJazz integration
- app: ssd-proxy-ws: add HTTP probes

### Changed

- app: ssd-proxy-ws: add HTTP probes
- cm: ssd-proxy-ws: config template improvements
  - separate routes to OneWork backend services
  - separate routes to DPM services
  - specific auth schemes to Gitlab and Sonar routes
- cm: cloud-config: fix & improve components' config templates
- doc: getting `JWT_VERIFICATION_PUB_KEY` for ssd-router

## [1.1] - 2024-01-17

### Added

- app: event-processor to core-data

### Changed

- app: ssd-ui: Keep empty mount config in values.yaml
- cm: cloud-config: fix & improve openresty-template
- cm: proxy-ws: fix & improve openresty-template

## [1.0] - 2024-01-17

### Added

- app: works-basic-proxy

### Changed

- изменено название чарта, чтобы можно было его аплоадить в DZO Nexus-CD
- app version: 1.7.0
- app: defaults: добавлены/изменены Probes для Java-приложений (группы: infra, core, adapters)
- cm: ssd-cloud-config: rename ENV-var `ONEWORK_SESSIONID` -> `ONEWORK_IAM_SESSION`
- cm: ssd-proxy-ws: изменения шаблонов конфиг-файлов
- ing: экранирование hostname, если оно содержит звездочку, например "*.domain.name"

## [0.4.0] - 2023-11-13

Based on HELM-Chart **UNITS v1**

### Added

- app: `podSpec`
- app: volumes from `volFromConfigmap`, `volFromCustom` and `volFromPVC`
- helm: `selectorLabelsWithInstance`
- ssd-cloud-config: `masterSystemIntegration` - переменная для CM
- ssd-proxy-ws: роуты для интеграции адаптеров с Jenkins/Nexus в режиме Works
- ssd-proxy-ws: роут для интеграции с Keycloak SE в составе Platform V IAM

### Changed

- SSD version: 1.6.1
- cm: `cloud-config-component-configs` -> `cloud-config`
- ssd-proxy-ws: вобрал в себя функциональность `ssd-iam-proxy`
- ssd-cloud-config: secret `SSD_CLOUD_CONFIG_GIT_SOURCE_PASS` - перемещен в `common`
- ssd-role-manager: secret `SSD_ROLE_MANAGER_KC_*` - перемещены в `common`

### Removed

- sec: ssdCloudArgocdSshKey - более не требуется SSH-ключей
- sec: ssdCloudConfig (-> ssdCommon)
- sec: ssdRoleManager (-> ssdCommon)

## [0.3.3] - 2023-11-10

### Added

- ssd-proxy-ws: роуты для интеграции адаптеров с Jenkins/Nexus в режиме Works
- ssd-proxy-ws: роут для интеграции с Keycloak SE в составе Platform V IAM

### Changed

- ssd-proxy-ws: вобрал в себя функциональность `ssd-iam-proxy`

## [0.3.2] - 2023-11-08

### Added

- ssd-adapter-load

## [0.3.0] - 2023-07-28

### Added

- apps: `replicas: {{ .replicas | default 1 }}`
- apps: optional `.strategy`
- apps: optional `.command`
- apps: optional `.service.portName`
- apps: `service` - теперь опционален

### Changed

- ssd-adapters: секреты всех адаптеров перемещены в один секрет -> ssd-adapters
- apps: исправлен отступ для содержимого `.podSecurityContext`
- apps: исправлена проверка наличия `.service.enable` для Service
- cm: `ssd-proxy-ws-external-configs.yaml` -> `ssd-proxy-ws.yaml`
- cm: `ssd-ui-external-configs.yaml` -> `ssd-ui.yaml`

## [0.2.1] - 2023-06-22

### Added

- опциональные apps: `app-infra-db` , `app-infra-iam`
- apps: `app-ssd-message-broker`

## [0.2.0] - 2023-06-16

### Added

- Первый полноценный релиз HELM-Chart'a - SSD заработала в DEV-кластере из HELM-Chart'a
- ssd-cloud-1.4.7
- ssd-core-1.4.7
- ssd-router-1.4.7
- README.md: описал нюансы установки SSD "с нуля"

### Changed

- ssd-infra -> ssd-cloud

### Fixed

- Исправлены values-значения на актуальные

## [0.1.0] - 2023-06-15

### Added

- Первый релиз HELM-Chart'a.
- ssd-adapters-1.4.7
- Значительно повышена универсальность манифестов - Добавлено много циклов для обработки values-массивов переменных
- Значительно улучшено добавление ENV-переменных (.env, envFromConfigmap, .envFromSecret, .envFromSharedSecret)
- Генерация секретов - включается с помощью `.Values.createSecrets`
