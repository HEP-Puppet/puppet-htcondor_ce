# Class: htcondor_ce::config
#
# This class configures a HTCondor Computing Element
#
# Parameters:
#
# 
class htcondor_ce::config (
  $pool_collector     = $::htcondor_ce::pool_collector,
  $condor_view_hosts  = $::htcondor_ce::condor_view_hosts,
  $gsi_regex          = $::htcondor_ce::gsi_regex,
  $uid_domain         = $::htcondor_ce::uid_domain,
  $use_static_shadow  = $::htcondor_ce::use_static_shadow,
) inherits htcondor_ce {

  $main_ce_config = '/etc/condor-ce/config.d/60-configured-attributes.conf'
  $site_security  = '/etc/condor-ce/config.d/59-site-security.conf',
  $job_routes     = '/etc/condor-ce/config.d/61-job-routes.conf',
  $condor_mapfile = '/etc/condor-ce/condor_mapfile',
  $ce_sysconfig   = '/etc/sysconfig/condor-ce',

  file { $site_security:
    ensure  => file,
    owner   => 'condor',
    group   => 'condor',
    mode    => '0644',
    content => template('htcondor_ce/ce-site-security.conf.erb'),
  }

  file { $main_ce_conf:
    ensure  => file,
    owner   => 'condor',
    group   => 'condor',
    mode    => '0644',
    content => template('htcondor_ce/ce-configured-attributes.conf.erb'),
  }

  file { $job_routes:
    ensure  => file,
    owner   => 'condor',
    group   => 'condor',
    mode    => '0644',
    content => template("${job_routes_template}"),
  }

  file { $condor_mapfile:
    ensure  => file,
    owner   => 'root',
    group   => 'root',
    mode    => '0644',
    content => template('htcondor_ce/condor_mapfile.erb'),
  }

  file { $ce_sysconf:
    ensure => file,
    owner  => 'root',
    group  => 'root',
    mode   => '0644',
    source => "puppet:///modules/htcondor_ce/syconfig-condor-ce",
  }

  $config_files = [File[$main_ce_conf, $site_security, $job_routes, $condor_mapfile]]

  exec {'/usr/bin/condor_ce_reconfig':
    refreshonly => true,
  }

  $config_files ~> Exec['/usr/bin/condor_ce_reconfig']

}
