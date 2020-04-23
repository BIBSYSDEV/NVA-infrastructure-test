# NVA-infrastructure-test
NVA Infrastructure templates for test environment.

***

**template_cognito.yml**  creates and setup Cognito  UserPool, IdentityPool, UserPoolDomain, roles 
and cognito_post_authentication_trigger -  a lambda which sets additional user 
attributes from federated login.

|Parameter|Description|
|-----|-----|
|AuthenticationDomainPrefix|Type: String, name of project ie NVA. The domain name for the domain that hosts the sign-up and sign-in pages for your application. For example: auth.example.com. If you're using a prefix domain, this field denotes the first part of the domain before .auth.[region].amazoncognito.com.|
|FeideMetadataURL|Link to the the identity provider details. |
|FrontendApplicationUrl|A base URL for the callbacks for the identity providers.|

***

**deploy_nva.yml** creates and deploys the rest of NVA: ApiCustomDomain, NVAStorageBucket. Deploys fixed versions of NVAFrontend and backend lambdas from Serverless Application Repository (SAR). Uses output values from Cognito stack  for authorization. 

|Parameter|Description|Default value - TEST
|-----|-----|-----|
| ApplicationDomainCertificateArn | ARN  of certificate to assign to the assosiated Domain | arn:aws:acm:us-east-1:812481234721:certificate/9319e9f9-3a66-43bb-9f9c-7fc1e6b4d3ab |
| ApplicationDomain | Base part of the domain the stack and components will be deployed to. Must be covered by the certificate. Used to calculate the other addresses in the deployment | frontend.test.nva.aws.unit.no |
| ApiDomainCertificate | ARN  of certificate to assign to custom-domain | arn:aws:acm:us-east-1:812481234721:certificate/9319e9f9-3a66-43bb-9f9c-7fc1e6b4d3ab |
| ApiDomainName | What is the custom-domain for backend API | api.test.nva.aws.unit.no |
| BareApiKey | Key to access bare | {{resolve:secretsmanager:bareApiKey:SecretString}}|
| BareHost | Address to bare | alfa-a.bibsys.no | 
| AlmaSruHost | Address to Alma-SRU | bibsys.alma.exlibrisgroup.com/view/sru/47BIBSYS_NETWORK |
| OrcidBaseUrl | Address to ORCID services | |ttps://sandbox.orcid.org |
| OrcidClientID | Clientid for ORCID | APP-xxxxxxxxxxxx | 
| OrcidClientSecret | Secret to authenticate for ORCID | {{resolve:secretsmanager:REACT_APP_ORCID_CLIENT_SECRET:SecretString}} |
| AlmaApiUrl | URL to ALMA Library services | https://bibsys.alma.exlibrisgroup.com/view/sru/47BIBSYS_NETWORK |


How to deploy a new stack from command line on a local computer (for reference): 
   
    aws cloudformation deploy --template-file deploy_nva.yml --stack-name nva-test --capabilities CAPABILITY_IAM CAPABILITY_AUTO_EXPAND --parameter-overrides AmazonCognitoDomain=... BackendDomain=api.test.nva.aws.unit.no ....