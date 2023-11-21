# WordPress Project Infrastructure with Terraform

This Terraform project sets up the infrastructure for a WordPress project, including necessary GCP resources.

## Table of Contents

- [WordPress Project Infrastructure with Terraform](#wordpress-project-infrastructure-with-terraform)
  - [Description](#description)
  - [Prerequisites](#prerequisites)
  - [Getting Started](#getting-started)
  - [Folder Structure](#folder-structure)
  - [Usage](#usage)
  - [Variables](#variables)
  - [Outputs](#outputs)

## Description

This Terraform project automates the provisioning of GCP resources needed for a WordPress project. It includes the setup of networking, GKE cluster and MySQL database instance.

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

3. Customize the `locals.tf` file with your desired configurations if you are working on dev/qa/production stages. If you have to work on "manage" stage, then you can customize `vars.tf`.

4. Apply the Terraform configuration:

    ```bash
    terraform apply
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
    ├── sql/
    │   ├── vars.tf
    │   └── wp_mysql.tf
    └── vpc/
        ├── outputs.tf
        ├── vars.tf
        └── vpc.tf
```

## Usage

To use this Terraform configuration, follow the steps outlined in the Getting Started section. Customize variables as needed for your WordPress project.

## Variables

environment: "dev" #The environment where you would like to deploy the resources

project_name: "wp-project" #Project name from GCP
project_id: "wp-project-404313" #Project ID from GCP
project_zone: "europe-west1-c" #The GCP zone of the project
project_region: "europe-west1" #The GCP region of the project

gke_nodes_number: "1" #Number of GKE nodes to deploy

## Outputs

example_output: Description of the output and its significance.