E-Commerce
==========

An e-commerce platform for online retail solutions built with Django.

Setup Guide
-----------

This guide will help you set up the E-Commerce project for development or production use.

Prerequisites
~~~~~~~~~~~~

* Python 3.11.11 or higher
* `uv <https://github.com/astral-sh/uv>`_ - Fast Python package installer and resolver
* Make (for using the provided Makefile commands)

Environment Setup
~~~~~~~~~~~~~~~

1. Clone the repository::

    git clone https://github.com/pytower/ecommerce.git
    cd ecommerce

2. Set up a virtual environment::

    # Using uv (recommended)
    uv venv

    # Activate the virtual environment
    # On Windows
    .venv\Scripts\activate
    # On macOS/Linux
    source .venv/bin/activate

Dependency Installation
~~~~~~~~~~~~~~~~~~~~~

The project uses ``uv`` for dependency management with convenient Makefile commands:

1. Install all dependencies (including development dependencies)::

    make uv-sync-all

2. Or install only production dependencies::

    make uv-sync-prod

3. Install specific dependency groups::

    # For testing
    make uv-sync-test

    # For linting
    make uv-sync-lint

    # For documentation
    make uv-sync-docs

    # For development (includes all extras)
    make uv-sync-dev

Project Configuration
~~~~~~~~~~~~~~~~~~~

1. Create a ``.env`` file in the project root with your environment variables::

    DEBUG=True
    SECRET_KEY=your-secret-key
    DATABASE_URL=sqlite:///db.sqlite3

2. Apply database migrations::

    python manage.py migrate

3. Create a superuser (optional)::

    python manage.py createsuperuser

Development Workflow
~~~~~~~~~~~~~~~~~~

The project includes several Makefile commands to streamline development:

1. Run the development server::

    python manage.py runserver

2. Run tests::

    make test

3. Run linting checks::

    make lint

4. Format code::

    make format

5. Clean up cache files::

    make clean

6. Validate pyproject.toml file::

    make validate-pyproject

Managing Dependencies
~~~~~~~~~~~~~~~~~~~

1. Add a new package::

    make uv-add pkg=package_name

2. Add a new development package::

    make uv-add-dev pkg=package_name

3. Add a new test package::

    make uv-add-test pkg=package_name

4. Add a new lint package::

    make uv-add-lint pkg=package_name

5. Add a new docs package::

    make uv-add-docs pkg=package_name

6. Update all dependencies::

    make uv-update-all

7. Compile development dependencies to a separate file::

    make uv-compile-dev

8. Audit dependencies for security vulnerabilities::

    make uv-audit

For a complete list of available commands, run::

    make help

License
-------

This project is licensed under the BSD 3-Clause License - see the LICENSE file for details.
