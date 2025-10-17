# Cloudflare R2 Setup (FREE Alternative to S3)

Cloudflare R2 is **S3-compatible** and has a **generous free tier** - perfect for your coffee tracker!

## Why R2?
- ✅ **FREE**: 10 GB storage, unlimited egress (no bandwidth charges!)
- ✅ S3-compatible (same code as AWS S3)
- ✅ Faster than S3 in many regions
- ✅ No surprise bills

## Setup Instructions

### 1. Create Cloudflare Account
1. Go to https://dash.cloudflare.com/sign-up
2. Sign up (free account)

### 2. Create R2 Bucket
1. In Cloudflare dashboard, go to **R2** (in left sidebar)
2. Click **"Create bucket"**
3. Bucket name: `coffee-tracker` (or any name you want)
4. Click **"Create bucket"**

### 3. Get API Credentials
1. In R2 dashboard, click **"Manage R2 API Tokens"**
2. Click **"Create API token"**
3. Token name: `coffee-tracker-app`
4. Permissions: **"Object Read & Write"**
5. **Save these values**:
   - Access Key ID
   - Secret Access Key
   - Account ID (shown in the R2 overview)

### 4. Configure Render Environment Variables

Go to Render → Your Service → Environment and add:

```
AWS_ACCESS_KEY_ID=your_r2_access_key_here
AWS_SECRET_ACCESS_KEY=your_r2_secret_key_here
AWS_REGION=auto
AWS_BUCKET=coffee-tracker
AWS_ENDPOINT=https://YOUR_ACCOUNT_ID.r2.cloudflarestorage.com
```

**Important**: Replace `YOUR_ACCOUNT_ID` in the endpoint URL with your actual Cloudflare account ID!

### 5. Make Bucket Public (for image viewing)

1. Go to your bucket → Settings
2. Under **"Public access"**, enable public access
3. Or set up a custom domain for cleaner URLs

### 6. Deploy!

Once environment variables are set, trigger a redeploy. Images will now be stored in R2!

## R2 Free Tier Limits

- **Storage**: 10 GB/month (plenty for images!)
- **Class A operations**: 1 million/month (uploads)
- **Class B operations**: 10 million/month (downloads)
- **Egress**: UNLIMITED (this is the big savings vs S3!)

For a personal coffee tracker, you'll likely never hit these limits!

## Cost Comparison

**AWS S3**: ~$0.023/GB storage + $0.09/GB egress = $$$
**Cloudflare R2**: FREE for 10 GB + $0 egress = **$0** 🎉
