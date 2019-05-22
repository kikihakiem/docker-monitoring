# Docker Monitoring

This repository serve as *development purpose only*. In real world scenario, or at least in my case, there are already prometheus and grafana in place for system monitoring.

## Usage

To add monitoring for docker containers to your existing prometheus-grafana instance, do following steps:

- Run cadvisor (a docker container exporter) in each of your servers/nodes.
  ```
  docker run -v /:/rootfs:ro \
      -v /var/run:/var/run:rw \
      -v /sys:/sys:ro \
      -v /var/lib/docker/:/var/lib/docker:ro \
      -p 8080:8080 \
      --name=cadvisor google/cadvisor:latest
  ```
- Add prometheus' job for cadvisor. Add all of your servers/nodes.
  ```
  scrape_configs:
  - job_name: docker
    static_configs:
      - targets: ['cadvisor:8080']
  ```
- Add grafana's dashboard to display docker metrics above, or simply import dashboard from `config/grafana/dashboards/docker.json`.

## Development

- Make changes.
- Run `make` and visit [http://0.0.0.0:3000](http://0.0.0.0/3000). User: admin, password: 123456
- Repeat.

In case of your changes is not reflected, run `make clean` before running `make`.
