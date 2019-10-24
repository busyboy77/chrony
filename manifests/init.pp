class chrony {
  ensure_packages('[chrony]')

  file {'/etc/chrony.conf':
    source  => 'puppet://modules/pbg_ntp/chrony.conf',
    notify  => Service['chronyd'],
    require => Package['chrony'],
       }

  service {'chronyd':
    ensure => running,
    enable => true,
  }
}
