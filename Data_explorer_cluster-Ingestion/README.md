sudo pip install tornado
sudo pip install nose
sudo pip install azure-kusto-data --ignore-installed six
sudo  pip install azure-kusto-ingest --ignore-installed six


1. create ingester application user via AAD , go to App Registraions:  https://portal.azure.com/#blade/Microsoft_AAD_Connect_Provisioning/ActiveDirectoryMenuBlade/RegisteredApps
2. Add user to DB
3. Next Create table ->  .create table TestTable (Policyid: int, Statecode: string, County: int, eqsitelimit:int, husitelimit: int, flsitelimit: int, frsitelimit: int, tiv2011: int, tiv2012: int, eqsitedeductible: int, husitedeductible: int, flsitedeductible: int, fr_site_deductible: int, pointlatitude: int, pointlongitude: int, line: string, construction: string, point: int)
