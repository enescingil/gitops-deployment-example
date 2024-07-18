# gitops-deployment-example
## Deployment Instructions

To deploy the application to AWS with microservices, follow these steps:

1. Clone the repository:

    ```shell
    git clone https://github.com/your-username/your-repo.git
    ```

2. Navigate to the project directory:

    ```shell
    cd gitops-deployment-example
    ```

3. Initialize Terraform:

    ```shell
    terraform init
    ```

4. Apply the Terraform configuration:

    ```shell
    terraform apply
    ```

5. Apply the Kubernetes manifest:

    ```shell
    kubectl apply -f k8s-app.yaml
    ```

6. Verify the deployment:

    ```shell
    kubectl get pods
    ```

    You should see the pods running for each microservice.

7. Access the application:

    Once the deployment is complete, you can access the application using the provided URL or IP address.

    ```shell
    http://your-application-url
    ```

    Replace `your-application-url` with the actual URL or IP address.

For more information about the architecture and configuration files, refer to the [tf-files](./tf-files) directory.
