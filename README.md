# Infrastructure with Terraform

This Terraform project sets up the infrastructure for a WordPress instance, a simple ASP.NET application and a SonarQube instance, including necessary GCP resources.

## Table of Contents

- [Infrastructure with Terraform](#infrastructure-with-terraform)
  - [Description](#description)
  - [Prerequisites](#prerequisites)
  - [Getting Started](#getting-started)
  - [Usage](#usage)
  - [Variables](#variables)
  - [Folder Structure](#folder-structure)

## Description

This Terraform project automates the provisioning of GCP resources needed for this project. It includes the setup of networking, GKE clusters and two database instance(One MySQL and one PostgreSQL).

## Prerequisites

Before you begin, ensure you have the following prerequisites:

- [Terraform](https://www.terraform.io/downloads.html) installed.
- GCP project and credentials configured.

## Getting Started

1. Clone this repository:

    ```bash
    git clone https://github.com/pcladiu97/wp-project-infra.git
    cd wp-project-infra
    cd manange/dev/qa/prod # depending on where you need to work
    ```

2. Initialize the Terraform working directory:

    ```bash
    terraform init
    ```

3. Customize the `locals.tf` file with your desired configurations.

4. Apply the Terraform configuration:

    ```bash
    terraform apply
    ```

## Usage

To use this Terraform configuration, follow the steps outlined in the Getting Started section. Customize variables as needed for your WordPress project.

## Variables

The following variables can be customized in the respective `locals.tf` file:

```plaintext
environment: "dev" #The environment where you would like to deploy the resources

project_name: "wp-project" -> Project name from GCP
project_id: "wp-project-404313" -> Project ID from GCP
project_zone: "europe-west1-c" -> The GCP zone of the project
project_region: "europe-west1" -> The GCP region of the project

gke_nodes_number: "1" -> Number of GKE nodes to deploy
```

## Folder Structure

```plaintext
wp-project-infra/
│
├── dev/
│   ├── files/
│   ├── locals.tf
│   ├── main.tf
│   ├── output.tf
│   └── providers.tf
├── manage/
│   ├── files/
│   ├── bucket.tf
│   ├── main.tf
│   ├── registry.tf
│   └── vars.tf
├── production/
│   ├── files/
│   ├── locals.tf
│   ├── main.tf
│   ├── output.tf
│   └── providers.tf
├── qa/
│   ├── files/
│   ├── locals.tf
│   ├── main.tf
│   ├── output.tf
│   └── providers.tf
└── tf-modules/
    ├── bucket/
    │   ├── bucket.tf
    │   ├── output.tf
    │   └── vars.tf
    ├── kubernetes/
    │   ├── gke.tf
    │   ├── namespace.tf
    │   ├── secrets.tf
    │   └── vars.tf
    ├── registry/
    │   ├── registry.tf
    │   ├── output.tf
    │   └── vars.tf
    ├── sql/
    │   ├── vars.tf
    │   └── wp_mysql.tf
    └── vpc/
        ├── outputs.tf
        ├── vars.tf
        └── vpc.tf
```