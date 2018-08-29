### about
This is a simple debian based sshd container, which does only allow certificate based authentication.

### Usage

e.g. docker run -p 22:22 -v ssh_keys:/root/.ssh/ -t afelder/sshd