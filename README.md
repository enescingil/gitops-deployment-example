# gitops-deployment-example
I will be deploying to the AWS with microservices

kubectl apply -f https://k8s.io/examples/application/php-apache.yaml
kubectl autoscale deployment php-apache --cpu-percent=50 --min=1 --max=10
kubectl get hpa

# Load test
kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"
kubectl get hpa php-apache --watch

# Autoscaling on multiple metrics and custom metrics
https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale-walkthrough/
https://docs.aws.amazon.com/eks/latest/userguide/horizontal-pod-autoscaler.html
https://aws.amazon.com/tr/blogs/opensource/horizontal-pod-autoscaling-eks/