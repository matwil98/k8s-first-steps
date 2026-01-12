# k8s-first-steps
Basic K8S one-node deployment using Azure Kuberenetes Service (AKS)
This tutorial is intended to familiarize with Kubernetes ecosystem and concept. 


# First step

After successfully authenticating with GitHub and cloning this repository, follow these steps:

## 1. Authenticate with Your Kubernetes Cluster

Make sure you have:
- ✅ kubectl installed and in your PATH
- ✅ Connected to your AKS cluster with proper credentials
- ✅ Run `kubectl get pods -A` to verify connectivity

## 2. Create Namespaces

Execute the setup script to create the required namespaces (`ns-a` and `ns-b`):

### For PowerShell Users (Windows):
```powershell
.\setup-namespaces.ps1
```

### For Bash/Linux/Mac Users:
```bash
chmod +x setup-namespaces.sh
./setup-namespaces.sh
```

## 3. Verify Namespaces Creation

After running the script, verify the namespaces were created:
```bash
kubectl get namespaces
```

You should see `ns-a` and `ns-b` in the output.

## 4. Deploy Nginx Pod in ns-a

Deploy the nginx pod to the `ns-a` namespace using the YAML manifest:

```bash
kubectl apply -f ns-a-nginx.yaml
```

### Verify Nginx Deployment

Check if the pod is running:
```bash
kubectl get pods -n ns-a
```

Get detailed pod information:
```bash
kubectl describe pod nginx-01 -n ns-a
```

View pod logs:
```bash
kubectl logs nginx-01 -n ns-a
```

## 5. Deploy Curl Pod in ns-b

Deploy the curl pod to the `ns-b` namespace using the YAML manifest:

```bash
kubectl apply -f ns-b-curl.yaml
```

### Verify Curl Deployment in ns-b

Check if the pod is running:
```bash
kubectl get pods -n ns-b
```

Get detailed pod information:
```bash
kubectl describe pod curl-01 -n ns-b
```

View pod logs:
```bash
kubectl logs curl-01 -n ns-b
```

## Tips for First Steps

- **Always check cluster connectivity first:** Run `kubectl get nodes` to ensure you're connected
- **Check namespace status:** Use `kubectl get ns` to list all namespaces
- **View pods in specific namespace:** `kubectl get pods -n ns-a` or `kubectl get pods -n ns-b`
- **Use the appropriate script:** Windows users should use `.ps1` scripts, Linux/Mac users should use `.sh` scripts
- **Commit your work:** After each step, commit to the `develop` branch:
  ```bash
  git add .
  git commit -m "Initial namespace setup"
  git push origin develop
  ``` 