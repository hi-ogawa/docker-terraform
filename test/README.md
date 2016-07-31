After creating `.env` file with valid credentials:

```
$ docker-compose run --rm terraform
usage: terraform [--version] [--help] <command> [<args>]

Available commands are:
    apply       Builds or changes infrastructure
    destroy     Destroy Terraform-managed infrastructure
    fmt         Rewrites config files to canonical format
    get         Download and install modules for the configuration
    graph       Create a visual graph of Terraform resources
    init        Initializes Terraform configuration from a module
    output      Read an output from a state file
    plan        Generate and show an execution plan
    push        Upload this Terraform module to Atlas to run
    refresh     Update local state file against real resources
    remote      Configure remote state storage
    show        Inspect Terraform state or plan
    taint       Manually mark a resource for recreation
    untaint     Manually unmark a resource as tainted
    validate    Validates the Terraform files
    version     Prints the Terraform version
$ docker-compose run --rm terraform plan
Refreshing Terraform state prior to plan...


The Terraform execution plan has been generated and is shown below.
Resources are shown in alphabetical order for quick scanning. Green resources
will be created (or destroyed and then created if an existing resource
exists), yellow resources are being changed in-place, and red resources
will be destroyed.

Note: You didn't specify an "-out" parameter to save this plan, so when
"apply" is called, Terraform can't guarantee this is what will execute.

+ aws_instance.test
    ami:                      "" => "ami-a21529cc"
    availability_zone:        "" => "<computed>"
    ebs_block_device.#:       "" => "<computed>"
    ephemeral_block_device.#: "" => "<computed>"
    instance_state:           "" => "<computed>"
    instance_type:            "" => "t2.micro"
    key_name:                 "" => "<computed>"
    placement_group:          "" => "<computed>"
    private_dns:              "" => "<computed>"
    private_ip:               "" => "<computed>"
    public_dns:               "" => "<computed>"
    public_ip:                "" => "<computed>"
    root_block_device.#:      "" => "<computed>"
    security_groups.#:        "" => "<computed>"
    source_dest_check:        "" => "true"
    subnet_id:                "" => "<computed>"
    tenancy:                  "" => "<computed>"
    vpc_security_group_ids.#: "" => "<computed>"

+ digitalocean_droplet.test
    image:                "" => "ubuntu-14-04-x64"
    ipv4_address:         "" => "<computed>"
    ipv4_address_private: "" => "<computed>"
    ipv6_address:         "" => "<computed>"
    ipv6_address_private: "" => "<computed>"
    locked:               "" => "<computed>"
    name:                 "" => "test-1"
    region:               "" => "sgp1"
    size:                 "" => "512mb"
    status:               "" => "<computed>"


Plan: 2 to add, 0 to change, 0 to destroy.
$ docker-compose run --rm terraform apply
digitalocean_droplet.test: Creating...
  image:                "" => "ubuntu-14-04-x64"
  ipv4_address:         "" => "<computed>"
  ipv4_address_private: "" => "<computed>"
  ipv6_address:         "" => "<computed>"
  ipv6_address_private: "" => "<computed>"
  locked:               "" => "<computed>"
  name:                 "" => "test-1"
  region:               "" => "sgp1"
  size:                 "" => "512mb"
  status:               "" => "<computed>"
aws_instance.test: Creating...
  ami:                      "" => "ami-a21529cc"
  availability_zone:        "" => "<computed>"
  ebs_block_device.#:       "" => "<computed>"
  ephemeral_block_device.#: "" => "<computed>"
  instance_state:           "" => "<computed>"
  instance_type:            "" => "t2.micro"
  key_name:                 "" => "<computed>"
  placement_group:          "" => "<computed>"
  private_dns:              "" => "<computed>"
  private_ip:               "" => "<computed>"
  public_dns:               "" => "<computed>"
  public_ip:                "" => "<computed>"
  root_block_device.#:      "" => "<computed>"
  security_groups.#:        "" => "<computed>"
  source_dest_check:        "" => "true"
  subnet_id:                "" => "<computed>"
  tenancy:                  "" => "<computed>"
  vpc_security_group_ids.#: "" => "<computed>"
digitalocean_droplet.test: Still creating... (10s elapsed)
aws_instance.test: Still creating... (10s elapsed)
digitalocean_droplet.test: Still creating... (20s elapsed)
aws_instance.test: Still creating... (20s elapsed)
aws_instance.test: Creation complete
digitalocean_droplet.test: Still creating... (30s elapsed)
digitalocean_droplet.test: Still creating... (40s elapsed)
digitalocean_droplet.test: Creation complete

Apply complete! Resources: 2 added, 0 changed, 0 destroyed.

The state of your infrastructure has been saved to the path
below. This state is required to modify and destroy your
infrastructure, so keep it safe. To inspect the complete state
use the `terraform show` command.

State path: terraform.tfstate
$ docker-compose run --rm terraform destroy
Do you really want to destroy?
  Terraform will delete all your managed infrastructure.
  There is no undo. Only 'yes' will be accepted to confirm.

  Enter a value: yes
yes

digitalocean_droplet.test: Refreshing state... (ID: 21086883)
aws_instance.test: Refreshing state... (ID: i-36742ba9)
digitalocean_droplet.test: Destroying...
aws_instance.test: Destroying...
digitalocean_droplet.test: Still destroying... (10s elapsed)
aws_instance.test: Still destroying... (10s elapsed)
digitalocean_droplet.test: Destruction complete
aws_instance.test: Still destroying... (20s elapsed)
aws_instance.test: Still destroying... (30s elapsed)
aws_instance.test: Still destroying... (40s elapsed)
aws_instance.test: Still destroying... (50s elapsed)
aws_instance.test: Destruction complete

Apply complete! Resources: 0 added, 0 changed, 2 destroyed.

$ docker-compose run --rm terraform show

$
```
