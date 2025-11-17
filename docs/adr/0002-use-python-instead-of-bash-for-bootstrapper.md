# 2. Use Python instead of Bash for Bootstrapper

Date: 2025-11-14

## Status

Accepted

## Context

The existing bootstrap process is implemented in Bash. While Bash is suitable for simple automation, it becomes increasingly difficult to maintain as workflows grow in complexity. The current script handles environment validation, temporary workspace management, network discovery, user prompts and several external tools. These responsibilities are awkward to express cleanly in Bash and increase the likelihood of subtle defects relating to quoting, subshell behaviour and inconsistent environment inheritance across shells.

Testing Bash code also introduces challenges. BATS is the most widely used option, and significant effort has been invested within the team to adopt it effectively. However, it requires vendoring as a submodule, which adds administrative overhead and complicates repository hygiene. Although BATS works well for straightforward command assertions, it is less effective for behaviour driven development or more complex orchestration involving multiple subprocesses and state transitions. Its assertions and diagnostics are comparatively limited, which makes it more difficult to write expressive tests that describe intent.

The wider project aims to maintain strong testing practices, including BDD and comprehensive unit and integration testing. Python provides a mature and well supported ecosystem for these practices. Python’s behave library for Gherkin, together with pytest for lower level unit tests, offers a clear and maintainable approach. Python also provides predictable environment handling, structured error management and a natural separation between orchestration and pure logic.

## Decision

The bootstrap tool will be rewritten in Python.

The design will follow behaviour driven development, as is our standard, beginning with Gherkin feature files that describe desired behaviour independently of implementation details. The Python codebase will be structured as a small library with well defined functions for environment validation, subprocess orchestration, temporary directory handling and cleanup activities. All external commands will be wrapped in functions to facilitate mocking during tests.

A top level tests directory will contain both unit and integration tests. The Bash implementation will be deprecated once the Python version achieves equivalent behaviour and passes the full test suite.

## Consequences

Testing becomes significantly more robust. Python enables a comprehensive and expressive test suite without relying on vendored testing tools or workarounds. Behaviour driven development is supported directly, and test readability improves. The codebase becomes easier to maintain, extend and review, because orchestration logic can be expressed in a structured and modular form rather than as a long Bash script.

The primary drawback is the need for a Python runtime in the environment that executes the bootstrap tool. This is acceptable because the bootstrap runs in a controlled environment rather than in production, and Python can be assumed to be already available. Transitioning away from the existing Bash implementation requires some initial investment, but this is offset by long term clarity, reliability and maintainability.

Overall, the change reduces operational risk, improves the testing strategy and supports the project’s intention to demonstrate sound engineering practice.