# docker-homebridge-homeassistant

Unofficial Docker image for [Home Assistant for Homebridge](https://github.com/home-assistant/homebridge-homeassistant).

## Configuration

As homebridge-homeassistant currently requires a `.homebridge` directory in the user's home directory, configuration is a little tricky. As such, the `Dockerfile` specifies the user as root, and exposes `/root` as a volume.

You'll need to create a `.homebridge` directory inside of whatever you map to `/root`.

With docker-compose:
```
  homebridge:
    restart: always
    image: jharmon/docker-homebridge-homeassistant
    net: host
    volumes:
      - ./homebridge_config:/root # contains .homebridge + .homebridge/config.json
      - /etc/localtime:/etc/localtime 
    ports:
      - "5353:5353"
      - "51826:51826"
```

See [Homebridge-homeassistant](https://github.com/home-assistant/homebridge-homeassistant) for more on configuring config.json.
