class ntp {
    #En fonction de l’OS, je defini des paramètres spécifiques
    case $operatingsystem {
        centos: {
            $service_name = 'ntpd'
            $conf_file = 'ntp.conf'
            $ntppath = '/etc/ntp.conf'
       }
    }
    #Je m’assure que le service NTP est installé sur la machine
    package { 'ntp':
        ensure => installed,
    }
    #Je m’assure que le service tourne, mais uniquement si le fichier ntp.conf est dispo
    service { 'ntp':
        name => $service_name,
        ensure => running,
        enable => true,
        subscribe => File['ntp.conf'],
     }
     #Je m’assure que ntp.conf existe, mais seulement si le service NTP est installé
     file { 'ntp.conf': 
         path => $ntppath,
         ensure => file,
         require => Package['ntp'],
         #Le fichier est récupérable dans : /etc/puppet/modules/ntp/files/
         source => "puppet:///modules/ntp/${conf_file}",
      }
}
