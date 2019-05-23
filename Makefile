.PHONY: default
default:
	docker-compose up -d
	@echo "Open your browser and visit http://0.0.0.0:3000"

clean:
	docker-compose down
	rm -rf data/grafana/dashboards
	rm -rf data/grafana/plugins
	rm -rf data/grafana/png
	rm data/grafana/grafana.db
	rm -rf data/prometheus/wal
	rm data/prometheus/lock

