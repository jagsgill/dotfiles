#########################################################################################################################################################
# Local Builds offer a very fast dev workflow to manage changes in a cluster by building and pushing using ssp_ctl.sh commands
#
# To use ssp_ctl.sh correctly, add the following to your ~/.bashrc
#
##################################################################################################################################################
# This is your JAVA_HOME. Use "/usr/libexec/java_home -V" to locate java homes on your machine.  Make sure to use Java17.
export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk-21.0.9+10/Contents/Home"

# Define SSP_HOME to point to your local AuthHub git repo folder
export SSP_HOME="$HOME/Dev/AuthHub"
export REGISTRY_USERNAME="jg"
export REGISTRY_ENC_PASSWD="cmV"

# This is your own build tag suffix that will be used to construct 1.0.<build-number> image tag. Please keep this unique!
export VERSION_BUILD_NUMBER="jg"

# This is the full path to your GCP JSON cred file to use when pushing to GCR
# ssp_ctl.sh will use this method first to acquire the GCP access token
# export GOOGLE_APPLICATION_CREDENTIALS="<gcp-json-creds-to-use-for-push-to-gcr>

# This is your GCP account to use when pushing to GCR. The account must be one of the accounts returned by "gcloud auth list"
# ssp_ctl.sh will use this method to acquire the GCP access token if $GOOGLE_APPLICATION_CREDENTIALS is not defined
# If neither $GOOGLE_APPLICATION_CREDENTIALS nor $SSP_GCR_PUSH_GOOGLE_ACCOUNT are defined, ssp-ctl.sh will acquire the GCP acccess token for the default GCP account
export SSP_GCR_PUSH_GOOGLE_ACCOUNT="jagdeep.gill@broadcom.com"

# Define LOCALBUILD_TARGET as GCR to push images to Google Container Registry
export LOCALBUILD_TARGET="GCR"

# Define SSPBLD_PERSONAL_ID to contain your Broadcom's id (e.g. ac123456), this would be the name of the folder in saasdev where your images be pushed to.
# (applicable only when pushing to saasdev)
export SSPBLD_PERSONAL_ID="jg"

# Define CLOUDSDK_CORE_PROJECT to contain name of the gcp project of the gcr service you're pushing to
export CLOUDSDK_CORE_PROJECT="dims02-vip-authhub01"

#  IMPORTANT: Use FUNCTIONS (not aliases) for proper exit code handling and argument passing
#  Pushing SSP images uses your GCR or shared 'saasdev' GCR. Define functions to build and push.
#
#     Your GCR: images will be pushed to "us.gcr.io/<gcp-project-name>/<image-name>:1.0.<version-build-number>"
    # sspbldimgdemo() {
    #     (
    #         export VERSION_BUILD_NUMBER="jg"
    #         export SSP_GCR_PUSH_GOOGLE_ACCOUNT="@broadcom.com"
    #         # export GOOGLE_APPLICATION_CREDENTIALS="<optional-full-path-to-your-json-creds-file>"
    #         sspbldimg "$@"
    #     )
    # }

#     Shared GCR: images will be pushed to "us.gcr.io/saasdev-sed-ssp-hp/${SSPBLD_PERSONAL_ID}/<image-name>:1.0.<version-build-number>"
#        Using current gcloud session:
sspbldimgdev() {
    (
        export VERSION_BUILD_NUMBER="jg"
        export SSPBLD_PERSONAL_ID="jg"
        export SSP_GCR_PUSH_GOOGLE_ACCOUNT="@broadcom.com"
        export CLOUDSDK_CORE_PROJECT="saasdev-..."
        sspbldimg "$@"
    )
}
#
#        Using json creds file:
    #sspbldimgsaasdev() {
    #    (
    #        export VERSION_BUILD_NUMBER="jg"
    #        export SSPBLD_PERSONAL_ID="jg"
    #        export SSP_GCR_PUSH_GOOGLE_ACCOUNT="@broadcom.com"
    #        export CLOUDSDK_CORE_PROJECT="saasdev-..."
    #        export GOOGLE_APPLICATION_CREDENTIALS="<full-path-to-saasdev-sed-ssp-hp.json>"
    #        sspbldimg "$@"
    #    )
    #}
    
# Source environment variables for proper use by ssp_ctl.sh
source $SSP_HOME/scripts/setupenv.sh

