![Architecture Diagram](architecture.png)
<h1 align="center">Terraform Modules AWS VPC</h1>
<p align="center">
    Create and Deploy Reusable Amazon VPC and NAT Gateway Module using Terraform Modules
</p>

## Project Date
- 20 September 2023

## Tech Stack
- Terraform
- Amazon VPC
- NAT gateways

## Video Demo
🔗 [The Complete Guide: Creating and Deploying Reusable Amazon VPC & NAT Gateway Modules with Terraform](https://www.youtube.com/watch?v=tb7a0QXUaOM)

## Introduction
Welcome to the GitHub repository that hosts the AWS CLI Commands used to configure a Terraform backend using S3 and DynamoDB, along with Terraform Resource Blocks for creating VPCs, and NAT gateway modules using Terraform Modules.

The video demonstration guides you through the entire process, starting from scratch. The hands-on experience will help you master the art of writing and managing Terraform code. The structured approach ensures you gain a comprehensive understanding of the process from start to finish. Please see overview of the demo below:

## Task 1: Prepare Your AWS Environment
Before proceeding, you will set up your AWS environment and project structure, enabling a streamlined and secure Terraform workflow.

#### <u>Verify AWS CLI and Terraform Installation:</u>
You will confirm that you have the AWS Command Line Interface (CLI) and Terraform installed on your local machine.

#### <u>Create a Project Folder Structure:</u>
To maintain a well-organized Terraform project, you will create a dedicated project folder. You will execute commands in your terminal to make directories for both the project and a specific project within your root directory. This structural hierarchy lays the foundation for structured and modular Terraform code.

#### <u>Create Terraform Configuration Files:</u>
Within the project folder, you will create the following essential Terraform files:
- `main.tf`: This file serves as the core configuration for your infrastructure, defining resources, modules, providers, and settings.
- `versions.tf`: Specifies the required minimum Terraform version for your project, promoting compatibility and documentation.
- `variables.tf`: Declares input variables, allowing parameterization of your Terraform configurations for flexibility and reusability.
- `terraform.tfvars`: This configuration file assigns actual values to the variables declared in `variables.tf`, segregating sensitive information and enhancing configuration management.

#### <u>Configure a Dedicated AWS CLI Profile for Terraform:</u>
To optimize security and responsibility separation when working with AWS resources via Terraform, you will create a dedicated AWS CLI profile named "terraform-user" using the `aws configure` command with a specific profile flag.

## Task 2: Configure Terraform Backend using S3 and DynamoDB with State Locking

Terraform state, known as `tfstate`, stores the current infrastructure state and can be customized in name and location.

#### <u>Configure an S3 Bucket for Storing Terraform State:</u>
You will create an S3 bucket using AWS CLI to store Terraform state files. This practice ensures organized management and prevents conflicts in collaborative or production environments.

#### <u>Set up a DynamoDB Table for State Locking:</u>
You will establish a DynamoDB table using AWS CLI for state locking, enhancing Terraform's consistency and security.

#### <u>Configure Terraform for State Management:</u>
You will create a `backend.tf` file in your project directory to define Terraform's backend configuration. You will specify the backend type (S3), S3 bucket name, key path, AWS region, profile, and the DynamoDB table for state locking. This configuration optimizes Terraform for state management.

#### <u>Initialize your Terraform Configuration:</u>
You will run the `terraform init` command in your project folder to prepare Terraform for infrastructure provisioning. Initialization includes setting up providers, configuring the backend, resolving dependencies, and ensuring Terraform's readiness for resource creation or modification.

With these steps completed, your Terraform environment is ready for VPC provisioning.

## Task 3: Create a Reusable VPC Module

You will create a Reusable VPC module in Terraform to enhance infrastructure management and promote best practices. This module includes `main`, `variables`, and `outputs` files.

#### <u>Create the Module Directory Structure and Generate Module Files:</u>
In your project's root directory, you will establish a new folder named `Modules`, then create a subfolder named `VPC` inside it. Inside the `VPC` folder, you will create `main.tf`, `variables.tf`, and `outputs.tf` files. These files define the core Terraform code, variables, and outputs for your VPC module, respectively.

#### <u>Create AWS VPC:</u>
To create a VPC, you will utilise the `aws_vpc` Terraform resource block within the `main.tf` file. This resource block allows you to specify VPC properties like the IP address range, DNS support, hostnames, and tags. It provides flexibility to customize your VPC according to your project's needs.

#### <u>Create Internet Gateway (IGW):</u>
Establishing an Internet Gateway is crucial for granting internet access to your VPC's resources. By using the `aws_internet_gateway` Terraform resource block, you will create an Internet Gateway and associate it with your VPC, facilitating secure communication between VPC resources and the internet.

#### <u>Define Availability Zones:</u>
High availability and fault tolerance are ensured by distributing resources across multiple Availability Zones. You will employ the `aws_availability_zones` data source to dynamically retrieve available Availability Zones, enhancing your infrastructure's resilience and reliability.

#### <u>Create Public Subnets:</u>
Public subnets, vital for resources requiring internet access, are created in two Availability Zones. Using the `aws_subnet` Terraform resource blocks, you will define these subnets, with attributes specifying VPC association, IP address ranges, Availability Zones, and public IP address settings.

#### <u>Create Public Route Table and Add Public Route:</u>
Route tables determine how network traffic is routed within your VPC. Using the `aws_route_table` Terraform resource block, you will create a route table for public subnets and add a route directing traffic to the Internet Gateway, enabling internet access for resources in public subnets.

#### <u>Associate Public Subnets with Public Route Tables:</u>
You will associate public subnets with their respective route tables using the `aws_route_table_association` Terraform resource block. This ensures that traffic within these subnets follows the routing rules defined in the route tables, enabling proper network communication.

#### <u>Create Private Subnets:</u>
Private subnets, essential for resources without direct internet access, are established in two Availability Zones. You will use the `aws_subnet` Terraform resource blocks to configure the subnets with specific attributes to enhance security and isolation.

#### <u>Configure Variables for Customization:</u>
You will define variable definitions in `variables.tf`. This allows you to customise key aspects of your infrastructure, such as AWS region, project name, VPC CIDR blocks, and subnet CIDR blocks. Variables enhance code readability, reusability, and adaptability across various projects or environments.

#### <u>Define Outputs for Resource Information:</u>
You will define outputs in `outputs.tf`. This will provide essential resource information, including AWS region, project name, VPC ID, Internet Gateway, subnet IDs, and more. Outputs facilitate resource management, integration, and automation, promoting efficient infrastructure maintenance.

This Terraform configuration creates a robust and reusable VPC module, enhancing infrastructure management, flexibility, and adherence to best practices.

## Task 4: Define Terraform Variables and Main Configuration for VPC Module Deployment

You will define Terraform variables and configure the main Terraform configuration to deploy your VPC module, streamlining the process of setting up a VPC and its related resources in your AWS environment.

#### <u>Define Variables:</u>
You will define essential variables for your main Terraform configuration. These variables include the AWS region, project name, VPC CIDR block, and subnet CIDR blocks. You declare these variables in the `variables.tf` file within your project folder, providing you with the flexibility to customize and parameterize critical aspects of your infrastructure. This approach enhances modularity, maintainability, and adaptability for different scenarios.

#### <u>Define terraform.tfvars:</u>
The `terraform.tfvars` file facilitates easy configuration changes without modifying the Terraform code directly. Within this file, you will input specific values for the variables you have defined. This includes setting the AWS region, project name, VPC CIDR block, and subnet CIDR blocks. These values provide the necessary input to tailor your Terraform configuration to your project's requirements, such as specifying the AWS region, project name, and IP address ranges.

#### <u>Define the Main Configuration in your Project Folder:</u>
You will configure the `main.tf` file within your project folder to set up the AWS provider and deploy the VPC module for your project. The AWS provider is configured to establish a secure connection between Terraform and AWS, and the VPC module is called and configured with the required variables. By following this structured approach, you ensure that your VPC module is correctly configured with the specified region, project name, and CIDR block, simplifying the deployment and management of VPC resources for your project.

## Task 5: Initialize Terraform and Apply Configuration for VPC Deployment

You will initialize and apply your Terraform configuration, creating a VPC and related resources while verifying their existence in the AWS Management Console. This modular approach enhances reusability and maintainability, simplifying the management of your infrastructure as code.

#### <u>Initialize and Apply:</u>
You will run the `terraform init` command in your project folder to initialize Terraform and download necessary providers and modules. After initialization, you will use the `terraform apply` command to apply your configuration and create the VPC.

#### <u>Verify in the AWS Management Console:</u>
For added confirmation, and to ensure that the VPC and its associated resources are created, you will verify the existence of resources in the AWS Management Console.

## Task 6: Create and Deploy a Reusable NAT Gateway Module</u>

You will create a Reusable NAT gateway module in Terraform to enhance infrastructure management and promote best practices. This module includes `main` and `variables` files.

#### <u>Create a NAT Gateway Module Folder and Generate Module Files:</u>
You will create a new directory within your project to host the NAT gateway module. Within it, you will generate `main.tf` and `variables.tf` files. These files will define the main configuration and variables for your NAT Gateway module.

#### <u>Define Variables for NAT Gateway Module:</u>
In the `variables.tf` file of your NAT gateway module, you will define several variables necessary for customizing and parameterizing your NAT gateway deployment. These variables include those for specifying public subnets, internet gateways, VPC ID, and private subnets. These variables allow you to configure the NAT gateway module to work within your specific VPC architecture.

#### <u>Define Main Configuration for NAT Gateway Module:</u>
Within the `main.tf` file of your NAT gateway module, you will configure the NAT gateway resources. This includes allocating Elastic IPs for NAT gateways in Public Subnet AZ1 and AZ2, creating NAT gateways in these subnets, defining private route tables for each subnet, and associating private subnets with their respective route tables. These configurations enable secure internet access for private instances while ensuring high availability and redundancy.

#### <u>Reference NAT Gateway Module in Main Configuration:</u>
You will integrate the NAT gateway module into your main Terraform project configuration (`main.tf`). By referencing this module, you will configure it with essential details required to deploy NAT gateways within your VPC, such as subnet IDs, VPC ID, and internet gateway. This modular approach enhances reusability and maintainability.

#### <u>Initialize and Apply the NAT Gateway Module:</u>
With the NAT gateway module integrated into your Terraform project, you will initialize and apply it by running the `terraform init` and `terraform apply` commands. This creates NAT gateways within your VPC based on the configured settings.

#### <u>Verify in the AWS Management Console:</u>
For added confirmation, you will navigate to the AWS Management Console to ensure that the NAT gateways, Elastic IPs, and Route Tables have been created as expected. This verification will ensure that your AWS infrastructure matches your Terraform configuration.

These steps are involved in creating and deploying a reusable NAT Gateway module in Terraform, enhancing your VPC architecture's security and availability.

## Task 7: Destroy Resources with Terraform

You will use Terraform's destroy command to efficiently dismantle your AWS infrastructure, including the VPC and NAT Gateway modules. This command allows you to gracefully tear down resources created using Terraform, ensuring that all associated resources are removed cleanly and securely.
