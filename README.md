[//]: # (STANDARD README)
[//]: # (https://github.com/RichardLitt/standard-readme)
[//]: # (----------------------------------------------)
[//]: # (Uncomment optional sections as required)
[//]: # (----------------------------------------------)

[//]: # (Title)
[//]: # (Match repository name)
[//]: # (REQUIRED)

# kubernetes-lab-bootstrap

[//]: # (Banner)
[//]: # (OPTIONAL)
[//]: # (Must not have its own title)
[//]: # (Must link to local image in current repository)



[//]: # (Badges)
[//]: # (OPTIONAL)
[//]: # (Must not have its own title)


[//]: # (Short description)
[//]: # (REQUIRED)
[//]: # (An overview of the intentions of this repo)
[//]: # (Must not have its own title)
[//]: # (Must be less than 120 characters)
[//]: # (Must match GitHub's description)

Automated Kubernetes cluster deployment on metal using Ansible

[//]: # (Long Description)
[//]: # (OPTIONAL)
[//]: # (Must not have its own title)
[//]: # (A detailed description of the repo)

Provides a fully automated method for building a highly available Kubernetes cluster on metal using Ansible. It assumes
each machine is already running Ubuntu and handles all remaining configuration, including preparing controller and
worker nodes, installing the container runtime, and deploying Kubernetes components. The goal
is a reliable, repeatable cluster build with as few opportunities for human-induced chaos as possible.

## Table of Contents

[//]: # (REQUIRED)
[//]: # (TOCGEN_TABLE_OF_CONTENTS_START)

- [Security](#security)
- [Background](#background)
- [Install](#install)
- [Usage](#usage)
- [Drydock](#drydock)
- [Documentation](#documentation)
- [Repository Configuration](#repository-configuration)
- [Contributing](#contributing)
- [License](#license)
    - [Code](#code)
    - [Non-code content](#non-code-content)

[//]: # (TOCGEN_TABLE_OF_CONTENTS_END)

## Security
[//]: # (OPTIONAL)
[//]: # (May go here if it is important to highlight security concerns.)

This provides a vanilla Kubernetes cluster, without any security configuration. Security is configured in Kubernetes
manifests, which live in kubernetes-lab-config.

## Background
[//]: # (OPTIONAL)
[//]: # (Explain the motivation and abstract dependencies for this repo)

Building a Kubernetes cluster on metal is a lengthy process with many opportunities for error. This ansible playbook and
its roles allow us to repeat the process reliably and (relatively) quickly, using the industry standard way to configure
metal hosts.

## Install

[//]: # (Explain how to install the thing.)
[//]: # (OPTIONAL IF documentation repo)
[//]: # (ELSE REQUIRED)

- [install Ansible](https://docs.ansible.com/projects/ansible/latest/installation_guide/intro_installation.html).

## Usage
[//]: # (REQUIRED)
[//]: # (Explain what the thing does. Use screenshots and/or videos.)

1. Amend your values in [inventory.yaml](ansible/inventory.yaml)
2. `cd ansible`
3. Run the playbook `ansible-playbook playbook-build.yaml`

To completely destroy and rebuild the cluster, run the rebuild playbook
`ansible-playbook playbook-rebuild.yaml`.

[//]: # (Extra sections)
[//]: # (OPTIONAL)
[//]: # (This should not be called "Extra Sections".)
[//]: # (This is a space for ≥0 sections to be included,)
[//]: # (each of which must have their own titles.)

## Future: Drydock

Many modern infrastructure automation tools struggle with,
- mutable infrastructure: no guarantees that repeated deployments will be *exactly* the same.
- idempotent-ish: tries to be idempotent, but gives you the freedom to stray from the path if you wish.
- no takesies-backsies: rollbacks can be challenging.
- drift: if something occurs outside of your code, it will not be actively detected.
- operating system provisioning: It is generally assumed that you already have an operating system in place, but if you
  have just purchased 3 new servers, or perhaps 300 new servers, installing an operating system on every single one is
  a pain.

[Drydock](http://github.com/evoteum/drydock) will solve this.

We are building Drydock, a boostrapping system that takes you from bare metal to a
fully functioning, highly available kubernetes cluster with (almost) zero human interaction. You'll get a cloud native
experience on anything from a few Raspberry Pi's to a data centre full of HPE Cray Supercomputing EX4000 nodes.

If you happen to have an HPE Cray Supercomputing EX4000 and are willing to let us test Drydock on it, that would be
*amazing* lol

## Documentation

Further documentation is in the [`docs`](docs/) directory.

## Repository Configuration

> [!WARNING]
> This repo is controlled by OpenTofu in the [estate-repos](https://github.com/evoteum/estate-repos) repository.
>
> Manual configuration changes will be overwritten the next time OpenTofu runs.


[//]: # (## API)
[//]: # (OPTIONAL)
[//]: # (Describe exported functions and objects)



[//]: # (## Maintainers)
[//]: # (OPTIONAL)
[//]: # (List maintainers for this repository)
[//]: # (along with one way of contacting them - GitHub link or email.)



[//]: # (## Thanks)
[//]: # (OPTIONAL)
[//]: # (State anyone or anything that significantly)
[//]: # (helped with the development of this project)



## Contributing
[//]: # (REQUIRED)
If you need any help, please log an issue and one of our team will get back to you.

PRs are welcome.


## License
[//]: # (REQUIRED)

### Code

All source code in this repository is licenced under the [GNU Affero General Public License v3.0 (AGPL-3.0)](https://www.gnu.org/licenses/agpl-3.0.en.html). A copy of this is provided in the [LICENSE](LICENSE).

### Non-code content

All non-code content in this repository, including but not limited to images, diagrams or prose documentation, is licenced under the [Creative Commons Attribution-ShareAlike 4.0 International](https://creativecommons.org/licenses/by-sa/4.0/) licence.
