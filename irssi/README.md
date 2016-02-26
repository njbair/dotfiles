# njbair's irssi config

This config is set up to work with my always-on ZNC connection at home.
My ZNC config provides an SSL connection, and authentication takes place
via ZNC's certauth module (public/private key authentication).

ZNC supports multiple networks per user, but requires one connection per
network. To specify which network to use, the client must include the
network name after the username, separated by a forward slash (i.e.
`username/network:password`).

As mentioned above, authentication is taken care of via the certauth
module, not via password. This allows me to back up my client configs to
a public GitHub repo without giving away my login credentials. The
placeholder password 'x' is provided simply to make ZNC happy (any
non-null value will do).

The address **home** is defined in */etc/hosts*. Again, this is done in
the interest of privacy since this config resides in a public repo.
