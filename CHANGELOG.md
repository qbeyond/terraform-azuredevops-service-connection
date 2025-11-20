# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

## [2.0.2] - 2025-11.20

### Fixed

- application output value.

## [2.0.1] - 2025-10.23

### Fixed

- Already existing datasources can be handled with

## [2.0.0] - 2025-10.22

### Changed

- Replaced authentication via **Secrets** with **Workload Identity Federation (WIF)**.
- Updated provider versions to current newest

### Added

- Added `Storage Blob Data Contributor` as a default role assignment

## [1.0.1] - 2024-10.11

### Fixed

- [Issue with provider registration of Microsoft.TimeSeriesInsights in AzureRm Version >3.90.0 ](https://github.com/hashicorp/terraform-provider-azurerm/issues/27466)