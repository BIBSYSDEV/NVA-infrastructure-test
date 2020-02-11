# NVA-infrastructure-test
NVA Infrastructure templates for test environment.

***

**template_cognito.yml**  creates and setup Cognito  UserPool, IdentityPool, UserPoolDomain, roles 
and cognito_post_authentication_trigger -  a lambda which sets additional user 
attributes from federated login.


|Parameter|Description|
|-----|-----|
|CognitoDomain|Type: String, name of project ie NVA. The domain name for the domain that hosts the sign-up and sign-in pages for your application. For example: auth.example.com. If you're using a prefix domain, this field denotes the first part of the domain before .auth.[region].amazoncognito.com.|
|FeideMetadataURL|Link to the the identity provider details. |
|UserPoolClientCallbackURLs|A list of allowed redirect (callback) URLs for the identity providers.|
|UserPoolClientLogoutURLs|A list of allowed logout URLs for the identity providers.|

***


**template_s3_storage.yml**  Creates and assigns a cleanup policy to an Amzon S3 bucket for uploading files  
