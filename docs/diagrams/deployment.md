# Simple SMTP Daemon - Deployment Diagrams

## Basic Deployment Architecture

```mermaid
graph TB
    subgraph "Client Network"
        Client1[SMTP Client 1]
        Client2[SMTP Client 2]
        ClientN[SMTP Client N]
    end

    subgraph "SMTP Server"
        Server[simple-smtpd<br/>Main Process]
        Config[/etc/simple-smtpd/<br/>Configuration]
        MailQueue[/var/spool/simple-smtpd<br/>Mail Queue]
        Logs[/var/log/simple-smtpd/<br/>Mail Logs]
    end

    subgraph "System Services"
        Systemd[systemd<br/>Service Manager]
        Logrotate[logrotate<br/>Log Rotation]
    end

    Client1 --> Server
    Client2 --> Server
    ClientN --> Server

    Systemd --> Server
    Systemd --> Config

    Server --> Config
    Server --> MailQueue
    Server --> Logs

    Logrotate --> Logs
```

## Mail Relay Deployment

```mermaid
graph TB
    subgraph "Internal Network"
        InternalClient1[Internal Client 1]
        InternalClient2[Internal Client 2]
    end

    subgraph "Mail Relay"
        Relay[simple-smtpd<br/>Mail Relay]
    end

    subgraph "External Mail Servers"
        External1[External Mail Server 1]
        External2[External Mail Server 2]
    end

    InternalClient1 --> Relay
    InternalClient2 --> Relay
    Relay --> External1
    Relay --> External2
```
