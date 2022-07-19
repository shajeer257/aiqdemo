# aiqdemo
### Architecture: 
![Architecture](https://drive.google.com/file/d/1xOIWOCYv0T8YHQg2Q0i-42iazDgmL3OG/view?usp=sharing)

### Folder structure
```
├── README.md
├── ansible
│   └── manage-nodes-role
│       ├── README.md
│       ├── defaults
│       │   └── main.yml
│       ├── files
│       ├── handlers
│       │   └── main.yml
│       ├── meta
│       │   └── main.yml
│       ├── tasks
│       │   └── main.yml
│       ├── templates
│       ├── tests
│       │   ├── inventory
│       │   └── test.yml
│       └── vars
│           └── main.yml
├── apps
│   ├── app1
│   │   ├── Dockerfile
│   │   ├── app.py
│   │   └── requirements.txt
│   └── svc2
├── charts
│   ├── svc1
│   │   ├── Chart.yaml
│   │   ├── charts
│   │   ├── templates
│   │   │   ├── NOTES.txt
│   │   │   ├── _helpers.tpl
│   │   │   ├── deployment.yaml
│   │   │   ├── hpa.yaml
│   │   │   ├── ingress.yaml
│   │   │   ├── service.yaml
│   │   │   ├── serviceaccount.yaml
│   │   │   └── tests
│   │   │       └── test-connection.yaml
│   │   └── values.yaml
│   ├── svc1-0.1.0.tgz
│   └── svc2
│       ├── Chart.yaml
│       ├── charts
│       ├── templates
│       │   ├── NOTES.txt
│       │   ├── _helpers.tpl
│       │   ├── deployment.yaml
│       │   ├── hpa.yaml
│       │   ├── ingress.yaml
│       │   ├── service.yaml
│       │   ├── serviceaccount.yaml
│       │   └── tests
│       │       └── test-connection.yaml
│       └── values.yaml
├── install.sh
├── jenkins
│   └── jenkinsfile
├── terraform
│   ├── k8.tf
│   ├── provider.tf
│   └── variable.tf
└── terragrunt
    └── environments
        ├── common.hcl
        ├── dev
        │   ├── provider.tf
        │   └── terragrunt.hcl
        ├── prod
        │   └── terragrunt.hcl
        ├── test
        │   └── terragrunt.hcl
        └── workspace.hcl
```

### Reference:
- https://anywhere.eks.amazonaws.com/
- https://terragrunt.gruntwork.io/
- https://helm.sh/docs/topics/charts/
- https://www.rabbitmq.com/kubernetes/operator/operator-overview.html
