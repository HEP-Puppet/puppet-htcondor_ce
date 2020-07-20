[![Puppet Forge](http://img.shields.io/puppetforge/v/CERNOps/htcondor_ce.svg)](https://forge.puppetlabs.com/CERNOps/htcondor_ce)
[![Build Status](https://travis-ci.org/cernops/puppet-htcondor_ce.svg)](https://travis-ci.org/cernops/puppet-htcondor_ce)

# htcondor_ce

#### Table of Contents

1. [Description](#description)
1. [Setup - The basics of getting started with htcondor_ce](#setup)
    * [What htcondor_ce affects](#what-htcondor_ce-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with htcondor_ce](#beginning-with-htcondor_ce)
1. [Usage - Configuration options and additional functionality](#usage)
1. [Reference - An under-the-hood peek at what the module is doing and how](#reference)
1. [Limitations - OS compatibility, etc.](#limitations)
1. [Development - Guide for contributing to the module](#development)
1. [GridPP Documentation](#GridPP-Documentation)

## Description

Start with a one- or two-sentence summary of what the module does and/or what
problem it solves. This is your 30-second elevator pitch for your module.
Consider including OS/Puppet version it works with.

You can give more descriptive information in a second paragraph. This paragraph
should answer the questions: "What does this module *do*?" and "Why would I use
it?" If your module has a range of functionality (installation, configuration,
management, etc.), this is the time to mention it.

## Setup

### What htcondor_ce affects **OPTIONAL**

If it's obvious what your module touches, you can skip this section. For
example, folks can probably figure out that your mysql_instance module affects
their MySQL instances.

If there's more that they should know about, though, this is the place to mention:

* A list of files, packages, services, or operations that the module will alter,
  impact, or execute.
* Dependencies that your module automatically installs.
* Warnings or other important notices.

### Setup Requirements **OPTIONAL**

If your module requires anything extra before setting up (pluginsync enabled,
etc.), mention it here.

If your most recent release breaks compatibility or requires particular steps
for upgrading, you might want to include an additional "Upgrading" section
here.

### Beginning with htcondor_ce

The very basic steps needed for a user to get the module up and running. This
can include setup steps, if necessary, or it can be an example of the most
basic use of the module.

## Usage

This section is where you describe how to customize, configure, and do the
fancy stuff with your module here. It's especially helpful if you include usage
examples and code samples for doing things with your module.

## Reference

Here, include a complete list of your module's classes, types, providers,
facts, along with the parameters for each. Users refer to this section (thus
the name "Reference") to find specific details; most users don't read it per
se.

## Limitations

This is where you list OS compatibility, version compatibility, etc. If there
are Known Issues, you might want to include them under their own heading here.

## Development

Since your module is awesome, other users will want to play with it. Let them
know what the ground rules for contributing are.

## Release Notes/Contributors/Etc. **Optional**

If you aren't using changelog, put your release notes here (though you should
consider using changelog). You can also add any additional sections you feel
are necessary or important to include here. Please use the `## ` header.


## GridPP Documentation

- https://www.gridpp.ac.uk/wiki/Example_Build_of_an_HTCondor-CE_Cluster
- https://twiki.cern.ch/twiki/bin/view/LCG/HtCondorCeAccounting

## Defining job routes

```yaml
htcondor_ce::job_routes:
  dice_centos7:
    TargetUniverse: 5
    eval_set_AccountingGroup: 'strcat("group_u_", x509userproxyvoname, ".", Owner)'
    delete_SUBMIT_Iwd: true
    set_WantIOProxy: true
    set_default_maxMemory: 3000
    set_Requirements: 'TARGET.OpSysAndVer == "CentOS7"'
```
