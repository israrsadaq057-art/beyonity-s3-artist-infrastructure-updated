# Beyonity IAM Test Script
# Run this script to verify all permissions are working correctly

Write-Host "BEYONITY IAM PERMISSIONS TEST SUITE" -ForegroundColor Cyan

# Test Junior Artist (anna)
Write-Host "`n=== TESTING JUNIOR ARTIST (anna) ===" -ForegroundColor Yellow
aws s3 cp C:\AWS-Lab\junior-test.txt s3://beyonity-3d-assets-prod-945504685795/artists/anna/active/ --profile anna
aws s3 ls s3://beyonity-3d-assets-prod-945504685795/shared/textures/ --profile anna

# Test Senior Artist (carla)
Write-Host "`n=== TESTING SENIOR ARTIST (carla) ===" -ForegroundColor Yellow
aws s3 cp C:\AWS-Lab\senior-test.txt s3://beyonity-3d-assets-prod-945504685795/projects/Project-Apex/Team-Shared/ --profile carla

# Test Art Director
Write-Host "`n=== TESTING ART DIRECTOR ===" -ForegroundColor Yellow
aws s3 cp C:\AWS-Lab\director-test.txt s3://beyonity-3d-assets-prod-945504685795/directors-cut/ --profile art-director

Write-Host "`nAll tests completed." -ForegroundColor Green
