# TFEv4 AWS Network Load Balancer

AWS Network Load Balancer for use with TFEv4 setup.

The module will create

* Network Load Balancer with listeners on `80`, `443`, `8800` ports.
* Target Groups for each listener to register backend services.

## Requirements

The requirements to use the module are:

Terraform CLI version >= 0.13
Provider AWS version ~> 3.0

## Input Variables

The input variables available for the module are in the table below.

| Variable | Type | Default | Description |
|----------|------|---------|-------------|
| vpc_id | `string` | | Id of the VPC to create the load balancer in. |
| subnet_ids | `list(string)` | | List of subnet ids in which to place the load balancer nodes. |
| lb_internal | `bool` | `false` | Whether to create internal load balancer. |
| name_prefix | `string` | `tfe-` | A string to be used as prefix for generating names of the created resources. |
| common_tags | `map(string)` | `{}` | Common tags to assign to all resources. |

## Outputs

The outputs declared by the module are in the table below.

| Output | Type | Description |
|--------|------|-------------|
| lb_dns_name | `string` | DNS name of the created load balancer. |
| lb_tg_80_arn | `string` | ARN (id) of the load balancer target group assigned to the listner on port 80. |
| lb_tg_443_arn | `string` | ARN (id) of the load balancer target group assigned to the listner on port 443. |
| lb_tg_8800_arn | `string` | ARN (id) of the load balancer target group assigned to the listner on port 8800. |

## Example Module Declaration

An example of how the module can be used.

```hcl
module "tfe_network_lb" {
  source = "git::https://github.com/tfemodules/terraform-aws-tfev4-network-lb.git"

  vpc_id     = "vpc-xxxxxx"
  subnet_ids = ["subnet-xxxxxxxxxx", "subnet-yyyyyyyyyy"]

  lb_internal = false

  name_prefix = "tfe-lb-example-"
  common_tags = {
      project = "tfe-lb-example"
  }
}
```

## Testing

Tests for the module are set up using `kitchen` and `kitchen-terraform` to run `inspec` tests.

Terraform variables which control the resources created during the test are set up in `test/fixtures/test.tfvars` file

**Note:** The current tests are intended as a place holder for more in-depth checks. Only the bare minimum of the module functionality is tested, almost equivalent to simply running `terraform apply` and verifying that the run is successful.

### Prerequisites

To run the tests you will need the following

* Have Ruby installed, version `~> 2.7.2`. It is recommended to use a ruby versions manager like `rbenv` and not your system ruby installation.
* Have the Ruby Gems specified in the `Gemfile` file installed. It is recommended to use `bundler`.

  ```bash
  gem install bundler
  bundle install
  ```
* Have Terraform installed, version `>= 0.13`

### Running tests

* Set up the credentials for the AWS provider as described [here](https://registry.terraform.io/providers/hashicorp/aws/latest/docs#authentication). For example

  ```bash
  export AWS_ACCESS_KEY_ID=<YOUR AWS ACCESS KEY ID>
  export AWS_SECRET_ACCESS_KEY=<YOUR AWS SECRET KEY>
  ```
* Set up the AWS region to use.

  ```bash
  export AWS_REGION=<AWS REGION>
  ```
* (optional) Adjust Terraform input variables in `test/fixtures/test.tfvars`
* Use `kitchen` to execute the tests
  * Converge the testing environment.

  ```bash
  bundle exec kitchen converge
  ```

  * Execute the tests.

  ```bash
  bundle exec kitchen verify
  ```

  * Destroy the testing environment.

  ```bash
  bundle exec kitchen destroy
  ```