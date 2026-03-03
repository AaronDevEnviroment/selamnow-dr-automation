# Infrastructure Routing Standard

## 1. Global Traffic Architecture
SelamNow employs a modern digital banking global traffic architecture:
- Global Traffic Manager (Cloudflare / Azure Front Door / AWS Route53)
- Health-based DNS failover
- Regional load balancers
- Zero-trust ingress control

**Target Architecture:**
```
Client
   ↓
Global Traffic Manager
   ↓
Region A (Primary)  --> Kubernetes Ingress --> Service --> Pods
   ↓ (On failover)
Region B (Standby)  --> Kubernetes Ingress --> Service --> Pods
```

## 2. Ingress Manifest Target Model
Cross-region routing switch occurs via Git PR merge and ArgoCD promotion. Example payload for Region A:
```yaml
apiVersion: networking.k8s.io/v1
kind: Ingress
metadata:
  name: identity-service
  annotations:
    nginx.ingress.kubernetes.io/rewrite-target: /
spec:
  rules:
  - host: identity.selamnow.com
    http:
      paths:
      - path: /
        pathType: Prefix
        backend:
          service:
            name: identity-service
            port:
              number: 80
```

## 3. Health-Based Failover Policy
Global Traffic Manager continuously monitors:
- `/health/live`
- `/health/ready`

If Region A fails, traffic is automatically redirected to Region B. No manual toggle is permitted.

## 4. Zero-Trust Ingress Hardening
- mTLS enforced between all services (Service Mesh).
- Web Application Firewall (WAF) at the edge.
- Rate limiting and IP throttling enforced per client.
