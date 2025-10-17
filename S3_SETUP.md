# AWS S3 Setup for Coffee Tracker

The app is now configured to use AWS S3 for storing uploaded images in production. This prevents images from being deleted when Render redeploys.

## Why S3?

Render uses ephemeral file systems - all files are deleted on each deployment. Images must be stored in persistent storage like S3.

## Setup Instructions

### 1. Create an AWS S3 Bucket

1. Go to [AWS S3 Console](https://s3.console.aws.amazon.com/)
2. Click "Create bucket"
3. Bucket name: `coffee-tracker-production` (or any unique name)
4. Region: `us-east-1` (or your preferred region)
5. **Block all public access**: UNCHECK this (we need public read access for images)
6. Click "Create bucket"

### 2. Configure Bucket Policy for Public Read Access

1. Go to your bucket → Permissions → Bucket Policy
2. Add this policy (replace `YOUR-BUCKET-NAME`):

```json
{
    "Version": "2012-10-17",
    "Statement": [
        {
            "Sid": "PublicReadGetObject",
            "Effect": "Allow",
            "Principal": "*",
            "Action": "s3:GetObject",
            "Resource": "arn:aws:s3:::YOUR-BUCKET-NAME/*"
        }
    ]
}
```

### 3. Create IAM User with S3 Access

1. Go to [IAM Console](https://console.aws.amazon.com/iam/)
2. Users → Add users
3. User name: `coffee-tracker-app`
4. Access type: Select "Programmatic access"
5. Permissions: Attach policy "AmazonS3FullAccess" (or create custom policy)
6. **Save the Access Key ID and Secret Access Key!**

### 4. Add Environment Variables to Render

Go to your Render service → Environment and add:

```
AWS_ACCESS_KEY_ID=your_access_key_here
AWS_SECRET_ACCESS_KEY=your_secret_key_here
AWS_REGION=us-east-1
AWS_BUCKET=coffee-tracker-production
```

### 5. Deploy!

Once you've added the environment variables, trigger a new deployment. All future image uploads will be stored in S3 and persist across deployments!

## Alternative: Cloudflare R2 (Cheaper)

Cloudflare R2 is S3-compatible and often cheaper:
1. Create R2 bucket in Cloudflare dashboard
2. Get R2 credentials
3. Use same environment variables with R2 endpoint

## Testing

After setup:
1. Upload an image to a coffee
2. Trigger a redeploy
3. Image should still be visible (stored in S3)
