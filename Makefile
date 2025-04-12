# Makefile for ecommerce project using uv package manager

# Initialize project with rye
rye-init-ecommerce:
	rye init -v --virtual --py cpython@3.11.11 --min-py 3.11.11 --name ecommerce

# UV commands for dependency management

# Install all dependencies (including development dependencies)
uv-sync-all:
	uv sync --all

# Install only production dependencies
uv-sync-prod:
	uv sync

# Install specific dependency groups
uv-sync-test:
	uv sync --extra test

uv-sync-lint:
	uv sync --extra lint

uv-sync-docs:
	uv sync --extra docs

uv-sync-dev:
	uv sync --extra dev

# Update dependencies
uv-update-all:
	uv pip compile --upgrade pyproject.toml -o requirements.txt
# Compile development dependencies to a separate file
uv-compile-dev:
	uv pip compile --upgrade --extra dev pyproject.toml -o requirements-dev.txt

# Audit dependencies for security vulnerabilities
uv-audit:
	uv audit

# Install a new package and add to pyproject.toml
uv-add:
	uv pip install --add $(pkg)

# Install a new development package
uv-add-dev:
	uv pip install --add-optional dev $(pkg)

# Install a new test package
uv-add-test:
	uv pip install --add-optional test $(pkg)

# Install a new lint package
uv-add-lint:
	uv pip install --add-optional lint $(pkg)

# Install a new docs package
uv-add-docs:
	uv pip install --add-optional docs $(pkg)

# Run tests with pytest
test:
	uv run pytest

# Run linting checks
lint:
	uv run ruff check .

# Format code
format:
	uv run black .
	uv run ruff format .

# Clean up cache files
clean:
	rm -rf .pytest_cache .ruff_cache .mypy_cache __pycache__ */__pycache__ */*/__pycache__

# Validate pyproject.toml file
validate-pyproject:
	uv run validate-pyproject pyproject.toml

# Help command
help:
	@echo "Available commands:"
	@echo "  uv-sync-all       - Install all dependencies"
	@echo "  uv-sync-prod      - Install only production dependencies"
	@echo "  uv-sync-test      - Install test dependencies"
	@echo "  uv-sync-lint      - Install lint dependencies"
	@echo "  uv-sync-docs      - Install docs dependencies"
	@echo "  uv-sync-dev       - Install dev dependencies"
	@echo "  uv-update-all     - Update all dependencies"
	@echo "  uv-compile-dev    - Compile dev dependencies to requirements-dev.txt"
	@echo "  uv-audit          - Audit dependencies for security vulnerabilities"
	@echo "  uv-add            - Install a new package (usage: make uv-add pkg=package_name)"
	@echo "  uv-add-dev        - Install a new dev package (usage: make uv-add-dev pkg=package_name)"
	@echo "  uv-add-test       - Install a new test package (usage: make uv-add-test pkg=package_name)"
	@echo "  uv-add-lint       - Install a new lint package (usage: make uv-add-lint pkg=package_name)"
	@echo "  uv-add-docs       - Install a new docs package (usage: make uv-add-docs pkg=package_name)"
	@echo "  test              - Run tests"
	@echo "  lint              - Run linting checks"
	@echo "  format            - Format code"
	@echo "  clean             - Clean up cache files"
	@echo "  validate-pyproject - Validate pyproject.toml file"

.PHONY: rye-init-ecommerce uv-sync-all uv-sync-prod uv-sync-test uv-sync-lint uv-sync-docs uv-sync-dev uv-update-all uv-compile-dev uv-audit uv-add uv-add-dev uv-add-test uv-add-lint uv-add-docs test lint format clean validate-pyproject help
