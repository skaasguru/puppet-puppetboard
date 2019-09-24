# @summary A short summary of the purpose of this class
#
# A description of what this class does
#
# @example
#   include puppetboard
class puppetboard {
  package { 'python3':
    ensure =>   latest
  }

  exec { 'InstallPuppetBoardDependencies':
    command => 'pip3 install puppetboard',
    path    => '/bin',
    unless  =>  'pip3 freeze | grep puppetboard',
  }

  exec { 'InstallGunicron':
    command => 'pip3 install gunicorn',
    path    => '/bin',
    unless  =>  'pip3 freeze | grep gunicorn',
  }

  class { 'selinux':
    mode =>  'permissive',
  }

  file { '/opt/puppetlabs/bin/puppetboard':
    ensure => file,
    source => "puppet:///modules/${module_name}/puppetboard",
    mode   => '0755'
  }

}
