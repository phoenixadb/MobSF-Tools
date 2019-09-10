#!/bin/bash
# Download file
# upload_mobsf.sh mobsf_url mobsf_token mobile_app_full_path delete_after_analysis
# ex: upload_mobsf.sh 'http://faas-mac-1.dt.620nm.net:8000' '7374e14eb76d40672961d93ed3769a2e71b6f852f8d6f483159bce6c9f83f6e7' ./myapp.apk true './'

# MobSF Root URL
MOBSF_ROOT_URL="$1"
MOBSF_TOKEN="$2"
MOBILE_APP_FULL_PATH="$3"
DELETE_AFTER_ANALYSIS="$4"
REPORT_DIRECTORY="$5"

filename=$(basename -- "$MOBILE_APP_FULL_PATH")
extension="${filename##*.}"

if [ "${extension}" != 'ipa' ] && [ "${extension}" != 'apk' ] && [ "${extension}" != 'appx' ];
    then
        echo 'Error: Extension should be ipa, apk or appx'
        exit 10
fi

if [ ! -f "$3" ]; 
    then
       echo 'Error: File not found'
       exit 20
fi

echo "Extension found:${extension}"

echo 'Uploading'
uploadResult=$(curl -F "file=@${MOBILE_APP_FULL_PATH}" ${MOBSF_ROOT_URL}/api/v1/upload -H "Authorization:${MOBSF_TOKEN}")

hash=$(echo "$uploadResult" | jq -r '.hash')
scanType=$(echo "$uploadResult" | jq -r '.scan_type')
fileName=$(echo "$uploadResult" | jq -r '.file_name')

echo 'Scanning'
curl -X POST -o "${REPORT_DIRECTORY}/mobsf.json" --url "${MOBSF_ROOT_URL}/api/v1/scan" --data "scan_type=${scanType}&file_name=${fileName}&hash=${hash}" -H "Authorization:${MOBSF_TOKEN}"

echo 'Downloading report'
curl -X POST -o "${REPORT_DIRECTORY}/mobsf.pdf" --url "${MOBSF_ROOT_URL}/api/v1/download_pdf" --data "scan_type=${scanType}&file_name=${fileName}&hash=${hash}" -H "Authorization:${MOBSF_TOKEN}"

if ${DELETE_AFTER_ANALYSIS}
    then
        echo 'Delete scan in history'
        curl -X POST --url ${MOBSF_ROOT_URL}/api/v1/delete_scan --data "hash=${hash}" -H "Authorization:${MOBSF_TOKEN}"
fi

exit 0
