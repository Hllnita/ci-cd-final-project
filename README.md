CI/CD Final Project: Inventory Management / Counter Service
===========================================================

This project is the capstone for the **IBM/Coursera CI/CD Tools and Practices** course. It demonstrates a full DevOps lifecycle, including continuous integration, containerization, and automated deployment.

🚀 Project Overview
-------------------

The application is a RESTful microservice (Python/Flask or Node.js) designed to manage resources. The primary goal of this repository is to showcase a robust **CI/CD Pipeline** that automates:

*   **Linting:** Ensuring code quality using flake8 or eslint.
    
*   **Unit Testing:** Running automated tests with pytest or jest.
    
*   **Building:** Creating Docker images for the service.
    
*   **Deployment:** Using Tekton pipelines or GitHub Actions to deploy to Kubernetes/OpenShift.
    

🛠 Tech Stack
-------------

*   **Language:** Python / JavaScript
    
*   **Framework:** Flask / Express.js
    
*   **CI/CD:** GitHub Actions, Tekton
    
*   **Containerization:** Docker
    
*   **Orchestration:** Kubernetes / Red Hat OpenShift
    

🏗 Setup and Installation
-------------------------

### 1\. Prerequisites

Ensure you have the following installed:

*   Docker Desktop
    
*   Python 3.9+ (or Node.js)
    
*   kubectl (Kubernetes CLI)
    

### 2\. Local Setup

Bash

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   # Clone the repository  git clone https://github.com/Hllnita/ci-cd-final-project.git  cd ci-cd-final-project  # Run the setup script to install dependencies  bash bin/setup.sh  # Activate the virtual environment (if Python)  source venv/bin/activate   `

🧪 Testing and Quality
----------------------

The pipeline is configured to run automatically on every push to the main branch.

*   **Linting:** flake8 . --count --select=E9,F63,F7,F82 --show-source --statistics
    
*   **Unit Tests:** nosetests --with-spec --spec-color (or pytest)
    

🚢 CI/CD Pipeline Details
-------------------------

### GitHub Actions

The workflow is defined in .github/workflows/workflow.yml. It performs the following jobs:

1.  **Checkout:** Pulls the latest code.
    
2.  **Install Dependencies:** Sets up the environment.
    
3.  **Lint:** Checks for syntax and style errors.
    
4.  **Test:** Executes the test suite and checks coverage.
    

### Tekton Pipelines (CD)

For Continuous Delivery, the project utilizes Tekton tasks located in the tekton/ directory:

*   tasks.yaml: Defines individual steps like git-clone and build-ah.
    
*   pipeline.yaml: Chains tasks together for a full deployment flow.
    

🐳 Docker Support
-----------------

To build and run the application as a container:

Bash

Plain textANTLR4BashCC#CSSCoffeeScriptCMakeDartDjangoDockerEJSErlangGitGoGraphQLGroovyHTMLJavaJavaScriptJSONJSXKotlinLaTeXLessLuaMakefileMarkdownMATLABMarkupObjective-CPerlPHPPowerShell.propertiesProtocol BuffersPythonRRubySass (Sass)Sass (Scss)SchemeSQLShellSwiftSVGTSXTypeScriptWebAssemblyYAMLXML`   # Build the image  docker build -t ci-cd-final-project:latest .  # Run the container  docker run -p 8080:8080 ci-cd-final-project:latest   `

📜 License
----------

This project is licensed under the **Apache License 2.0**.
