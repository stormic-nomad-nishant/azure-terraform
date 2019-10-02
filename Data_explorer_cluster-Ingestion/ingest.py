"""Samples on how to use Kusto Ingest client. Just Replace variables and run!"""

from azure.kusto.data.request import KustoConnectionStringBuilder
from azure.kusto.ingest import (
    KustoIngestClient,
    IngestionProperties,
    FileDescriptor,
    BlobDescriptor,
    StreamDescriptor,
    DataFormat,
    ReportLevel,
    IngestionMappingType,
    KustoStreamingIngestClient,
)

##################################################################
##                              AUTH                            ##
##################################################################
cluster = "https://ingest-logcluster.westus.kusto.windows.net"

# In case you want to authenticate with AAD application.
client_id = "<insert here your AAD application id>"
client_secret = "<insert here your AAD application key>"

# read more at https://docs.microsoft.com/en-us/onedrive/find-your-office-365-tenant-id
authority_id = "<insert here your tenant id>"

kcsb = KustoConnectionStringBuilder.with_aad_application_key_authentication(
    cluster, client_id, client_secret, authority_id
)

client = KustoIngestClient(kcsb)
##################################################################
##                        INGESTION                             ##
##################################################################

# there are a lot of useful properties, make sure to go over docs and check them out
ingestion_props = IngestionProperties(
    database="logcluster-database",
    table="TestTable",
    dataFormat=DataFormat.CSV,
    # in case status update for success are also required
    # reportLevel=ReportLevel.FailuresAndSuccesses,
    # in case a mapping is required
    # ingestionMappingReference="{json_mapping_that_already_exists_on_table}"
    # ingestionMappingType=IngestionMappingType.Json
)



# ingest a whole folder.
import os

path = "/Users/nissingh/Documents/Terraform-N-More/logs/"
#for f in os.listdir(path):
#    print path+f
[client.ingest_from_file(path+f, ingestion_properties=ingestion_props) for f in os.listdir(path)]

print "test"
##################################################################
##                        INGESTION STATUS                      ##
##################################################################

# if status updates are required, something like this can be done
import pprint
import time
from azure.kusto.ingest.status import KustoIngestStatusQueues

qs = KustoIngestStatusQueues(client)

MAX_BACKOFF = 180

backoff = 1
while True:
    ################### NOTICE ####################
    # in order to get success status updates,
    # make sure ingestion properties set the
    # reportLevel=ReportLevel.FailuresAndSuccesses.
    if qs.success.is_empty() and qs.failure.is_empty():
        time.sleep(backoff)
        backoff = min(backoff * 2, MAX_BACKOFF)
        print("No new messages. backing off for {} seconds".format(backoff))
        continue

    backoff = 1

    success_messages = qs.success.pop(10)
    failure_messages = qs.failure.pop(10)

    pprint.pprint("SUCCESS : {}".format(success_messages))
    pprint.pprint("FAILURE : {}".format(failure_messages))

    # you can of course separate them and dump them into a file for follow up investigations
    with open("successes.log", "w+") as sf:
        for sm in success_messages:
            sf.write(str(sm))

    with open("failures.log", "w+") as ff:
        for fm in failure_messages:
            ff.write(str(fm))
