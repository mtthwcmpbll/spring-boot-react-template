# Agentic Workflow Instructions

This document outlines the standard operating procedures for building features and contributing to the Spring Boot React Template codebase.

## 1. Test-Driven Development (TDD)

**Always write failing tests first.**

*   **Backend (Java/Spring Boot):**
    *   Use JUnit 5 for unit and integration tests.
    *   Ensure new services and components are tested in isolation where possible.
    *   Run tests via `./mvnw test`.

*   **Frontend (React/TypeScript):**
    *   Use Vitest for unit testing logic and components.
    *   Use Playwright for end-to-end and component testing.
    *   Ensure new components have accompanying tests.
    *   Run tests via `npm run test` (Vitest) or `npm run e2e` (Playwright).

## 2. Frontend Component Architecture

**Keep components independent, decoupled, and testable.**

*   **Storybook:** Develop and test UI components in isolation using Storybook (`npm run storybook`).
*   **Decoupling:** Avoid tight coupling between components. Use props and composition to maximize reusability.
*   **State Management:** Keep state local where possible, or lift it up responsibly. Avoid global state pollution.

## 3. Feature Independence & Decoupling

*   **Modularity:** Design features to be modular and self-contained.
*   **Separation of Concerns:** Clearly separate business logic from presentation and data access.
*   **Interfaces:** Use interfaces to define contracts between modules, facilitating easier testing and refactoring.

## 4. Documentation Updates

**When adding a new feature, you MUST update project documentation as part of your work.**

*   **Requirement:** Ensure any new features, API changes, or architectural decisions are clearly documented in the project's README or other appropriate documentation files.

## 5. Source of Truth

This `AGENTS.md` file is the single source of truth for agent instructions. It is symlinked to various agent-specific configuration files (e.g., `CLAUDE.md`, `GEMINI.md`, `.cursorrules`, etc.) to ensure consistency across different AI assistants.

## 6. Modulith Architecture

**This project explicitly uses Spring Modulith to enforce clean architectural boundaries.**

*   **Feature Modules:** Every new major feature should be placed in its own distinct, top-level package directly under the root application package (e.g., `com.snowfort.ai`, `com.snowfort.users`).
*   **Inter-Module Communication:** Modules should be loosely coupled. Do not directly instantiate or autowire internal classes from another module.
    *   **Preferred:** Use Spring Application Events (`ApplicationEventPublisher` and `@ApplicationModuleListener` or `@EventListener`) for asynchronous communication between modules.
    *   **Allowed:** If synchronous communication is strictly necessary, expose a clearly defined interface in a shared/API package, or use the public components exposed explicitly by the target module.
*   **Verification:** All feature additions and structural changes MUST pass the `ApplicationModularityTest.java`. This test programmatically verifies that there are no cyclical dependencies and that internal module implementations are not leaked or illegally accessed by other modules. If this test fails, your PR will be rejected. 
