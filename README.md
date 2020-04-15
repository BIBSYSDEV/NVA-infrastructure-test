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



How to deploy a new stack from command line on a local computer (for reference): 
   
    aws cloudformation deploy --template-file deploy_nva_from_sar.yml --stack-name frontend-test --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND --parameter-overrides AmazonCognitoDomain=https://nva-test.auth.eu-west-1.amazoncognito.com BackendDomain=api.test.nva.aws.unit.no CognitoIdentityPoolId=eu-west-1:c1187e43-cbb7-401f-8181-9c94d8e94b6a DomainCertificateArn=arn:aws:acm:us-east-1:812481234721:certificate/9319e9f9-3a66-43bb-9f9c-7fc1e6b4d3ab FrontendDomain=frontend.test.nva.aws.unit.no RedirectSignInUrl=https://frontend.test.nva.aws.unit.no/login RedirectSignOutUrl=https://frontend.test.nva.aws.unit.no/logout UserPoolAppClientId=77136duraj3vml8mi38j1hlhmv UserPoolId=eu-west-1_wsHsxCiT4 CognitoAuthorizerArn= arn:aws:cognito-idp:eu-west-1:812481234721:userpool/eu-west-1_wsHsxCiT4