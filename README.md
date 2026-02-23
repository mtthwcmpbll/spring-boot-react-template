# Spring Boot + React Full-Stack Application Template

This project is intended as a starter template for a full-stack application that uses Spring Boot as the backend and a React frontend all built together.  It's my prefered way to create new projects in GitHub and then have my agent of choice start working on a new project.

## 🤝 Contributing

We love contributions! If you're a developer looking to improve the platform itself (the Java backend or React frontend), check out [BUILDING.md](BUILDING.md) for technical build instructions.

## 🤖 Agentic Workflow

If you are an AI agent or using AI tools to contribute to this project, please refer to [AGENTS.md](AGENTS.md) for specific instructions and guidelines. This file serves as the source of truth for all agentic workflows.

## 📊 Observability

### Metrics
Prometheus metrics are exposed at `/actuator/prometheus`. You can scrape this endpoint to collect application metrics.

### Distributed Tracing
Distributed tracing is enabled using Micrometer Tracing and Brave. Trace IDs and Span IDs are automatically injected into logs.
The sampling probability is set to 100% (`1.0`) by default in `application.yml`.

## 📄 License

[MIT License](LICENSE)
