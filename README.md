# BEYONITY AWS INFRASTRUCTURE PROJECT

## Project Overview

Complete AWS infrastructure for Beyonity, a 3D animation studio with 20 artists. This project demonstrates production-ready IAM and S3 configurations.

## IT-Network Administrator

| Detail | Information |
|--------|-------------|
| Name | Israr Sadaq |
| Email | israrsadaq057@gmail.com |
| Certifications | CCNA, CCNP |
| Education | Master in Information and Communication Engineering |
| AWS Account | 945504685795 |
| Region | us-east-1 |

---

## Infrastructure Summary

| Component | Count |
|-----------|-------|
| S3 Buckets | 5 |
| IAM Groups | 7 |
| IAM Policies | 7 |
| IAM Users | 21 |
| Artist Folders | 16 |
| Project Folders | 4 |
| CloudWatch Alarms | 3 |

---

## S3 Buckets

| Bucket Name | Purpose |
|-------------|---------|
| beyonity-3d-assets-prod-945504685795 | Production 3D assets |
| beyonity-backups-945504685795 | Daily automated backups |
| beyonity-client-share-945504685795 | Secure client file sharing |
| beyonity-logs-945504685795 | Access logs and inventory |
| beyonity-test-bucket-945504685795 | Testing environment |

### Features Enabled

| Feature | Status |
|---------|--------|
| Versioning | ENABLED |
| Transfer Acceleration | ENABLED |
| HTTPS Enforcement | ACTIVE |
| Public Access Block | ENABLED |
| Server Side Encryption | AES-256 |

### Lifecycle Rules

| Rule | Target | Action | Days |
|------|--------|--------|------|
| DeleteWIPAfter14Days | wip/ folder | Delete | 14 |
| ArchiveAfter30Days | archive/ folder | Move to Glacier | 30 |
| DeleteClientSharesAfter7Days | client_shares/ | Delete | 7 |
| DeleteTempFilesAfter1Day | temp/ folder | Delete | 1 |

### Folder Structure

```

beyonity-3d-assets-prod-945504685795/
├── artists/
│ ├── anna/ (active/, wip/, archive/)
│ ├── ben/
│ ├── carla/
│ ├── david/
│ ├── elena/
│ ├── felix/
│ ├── grace/
│ ├── henry/
│ ├── irena/
│ ├── jonas/
│ ├── karla/
│ ├── lukas/
│ ├── mona/
│ ├── niklas/
│ ├── olivia/
│ └── paul/
├── projects/
│ ├── Project-Apex/ (Team-Shared/, Team-Lead-Only/)
│ ├── Project-Nexus/
│ ├── Project-Omega/
│ └── Project-Virtua/
├── shared/ (textures/, models/, hdri/, plugins/)
├── directors-cut/
└── it-admin/

```


---

## IAM Infrastructure

### Groups and Policies


| Group Name | Members | Attached Policy | Permissions |
|------------|---------|----------------|-------------|
| IT-Admins | Israr | IT-Admin-Policy | Full access to all AWS services |
| Senior-Artists | carla, elena, irena, mona | Senior-Artist-Policy | Own folder + team projects + EC2 |
| Junior-Artists | anna, ben, david, felix, grace, henry, jonas, karla, lukas, niklas, olivia, paul | Junior-Artist-Policy | Own folder + shared read |
| Art-Directors | art-director | Art-Director-Policy | Read all folders, write to directors-cut |
| CTO-Executives | cto | CTO-Policy | Read S3, CloudWatch, Cost |
| Finance | finance-manager | Finance-Policy | Billing and cost only |
| HR-Manager | hr-manager | HR-Policy | List IAM users only |

### Users Created

| Username | Role | Group |
|----------|------|-------|
| Israr | IT Administrator | IT-Admins |
| anna | Junior Artist | Junior-Artists |
| ben | Junior Artist | Junior-Artists |
| carla | Senior Artist | Senior-Artists |
| david | Junior Artist | Junior-Artists |
| elena | Senior Artist | Senior-Artists |
| felix | Junior Artist | Junior-Artists |
| grace | Junior Artist | Junior-Artists |
| henry | Junior Artist | Junior-Artists |
| irena | Senior Artist | Senior-Artists |
| jonas | Junior Artist | Junior-Artists |
| karla | Junior Artist | Junior-Artists |
| lukas | Junior Artist | Junior-Artists |
| mona | Senior Artist | Senior-Artists |
| niklas | Junior Artist | Junior-Artists |
| olivia | Junior Artist | Junior-Artists |
| paul | Junior Artist | Junior-Artists |
| art-director | Art Director | Art-Directors |
| cto | CTO | CTO-Executives |
| finance-manager | Finance Manager | Finance |
| hr-manager | HR Manager | HR-Manager |

---

## CloudWatch Monitoring

### Alarms

| Alarm Name | Metric | Threshold | Action |
|------------|--------|-----------|--------|
| Beyonity-Production-Bucket-Size-Alarm | BucketSizeBytes | > 3 TB | Email alert |
| Beyonity-High-Request-Rate | AllRequests | > 1000 per hour | Email alert |
| Beyonity-High-Error-Rate | 4xxErrors | > 10 per hour | Email alert |

### SNS Email Alerts

- Topic: BeyonityS3Alerts
- Subscriber: israrsadaq057@gmail.com

---

## Test Results

| Test | Action | Expected | Result |
|------|--------|----------|--------|
| 1 | Junior Artist upload to own folder | SUCCESS | PASS |
| 2 | Junior Artist upload to other artist folder | ACCESS DENIED | PASS |
| 3 | Junior Artist read shared folder | SUCCESS | PASS |
| 4 | Senior Artist upload to own folder | SUCCESS | PASS |
| 5 | Senior Artist upload to team shared | SUCCESS | PASS |
| 6 | Senior Artist delete from team shared | SUCCESS | PASS |
| 7 | Art Director read artist folder | SUCCESS | PASS |
| 8 | Art Director upload to directors-cut | SUCCESS | PASS |
| 9 | Art Director upload to artist folder | ACCESS DENIED | PASS |

**All 9 tests passed successfully.**

---

## Verification Commands

```bash
# List all S3 buckets
aws s3 ls

# List artist folders
aws s3 ls s3://beyonity-3d-assets-prod-945504685795/artists/

# List all IAM groups
aws iam list-groups

# List all IAM policies
aws iam list-policies --scope Local

# List all IAM users
aws iam list-users

# Check versioning
aws s3api get-bucket-versioning --bucket beyonity-3d-assets-prod-945504685795

# Check transfer acceleration
aws s3api get-bucket-accelerate-configuration --bucket beyonity-3d-assets-prod-945504685795

# Check bucket policy
aws s3api get-bucket-policy --bucket beyonity-3d-assets-prod-945504685795

# Check lifecycle rules
aws s3api get-bucket-lifecycle-configuration --bucket beyonity-3d-assets-prod-945504685795

# Run test script
.\scripts\test-permissions.ps1

# Check versioning
aws s3api get-bucket-versioning --bucket beyonity-3d-assets-prod-945504685795

# Check transfer acceleration
aws s3api get-bucket-accelerate-configuration --bucket beyonity-3d-assets-prod-945504685795

# Check bucket policy
aws s3api get-bucket-policy --bucket beyonity-3d-assets-prod-945504685795

# Check lifecycle rules
aws s3api get-bucket-lifecycle-configuration --bucket beyonity-3d-assets-prod-945504685795

# Run test script
.\scripts\test-permissions.ps1
```

---

## Important Screenshots

Bucket

 <img width="1920" height="1080" alt="Bucket" src="https://github.com/user-attachments/assets/3156552f-45a3-4bcb-a4fc-59e7a0257227" />

Objects

<img width="1920" height="1080" alt="Objects" src="https://github.com/user-attachments/assets/501732e8-eae2-4e5a-b675-68a1b815c305" />

 IAM User
 
 <img width="1920" height="1080" alt="IAM_USER" src="https://github.com/user-attachments/assets/e85ce58a-18ed-423b-a05a-14396281500d" />

 IAM Groups

 <img width="1920" height="1080" alt="I_am_Groups" src="https://github.com/user-attachments/assets/d9c7a282-25a0-45a5-aef7-15831d8bb07d" />

Project Folder

<img width="1920" height="1080" alt="Artistis_SubFolder" src="https://github.com/user-attachments/assets/aa642db2-503e-46c3-812f-ab7c84b23805" />

 Artists Sub_Folder

 <img width="1920" height="1080" alt="Artistis_SubFolder" src="https://github.com/user-attachments/assets/a9332d57-3b33-4282-828d-26d0fbd60043" />

Life Cycle Configration

<img width="1920" height="1080" alt="Life_cycle_Configration" src="https://github.com/user-attachments/assets/a761f6fa-420e-489d-bdcc-c0fca5b306cc" />

Test Results

<img width="1920" height="1080" alt="Test_Results" src="https://github.com/user-attachments/assets/1596baa2-a3e5-4913-8709-338641d591ea" />

---
## About Me

Network and IT Administrator | CCNA | CCNP | Master in Information and Communication Engineering
Experienced in optical networks, enterprise firewalls, cloud infrastructure (AWS), and automation.
Portfolio: github.com/israrsadaq057-art
