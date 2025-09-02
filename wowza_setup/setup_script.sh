#!/bin/bash

# Default versions - can be overridden by environment variables
PLUGIN_VERSION=${PLUGIN_VERSION:-"1.1.0"}
CLIENT_SDK_VERSION=${CLIENT_SDK_VERSION:-"1.44.0"}
GITHUB_RELEASE_VERSION=${GITHUB_RELEASE_VERSION:-"1.1.0"}

PLUGIN_JAR="wse-plugin-caption-handlers-${PLUGIN_VERSION}.jar"
CLIENT_SDK_JAR="client-sdk-${CLIENT_SDK_VERSION}.jar"

echo "Looking for plugin version: ${PLUGIN_VERSION}"
echo "Looking for client SDK version: ${CLIENT_SDK_VERSION}"

# Check if plugin JAR exists (any version)
if [ -f "/wowza_setup/downloads/${PLUGIN_JAR}" ]; then
	echo "File ${PLUGIN_JAR} exists"
elif [ -f "/wowza_setup/downloads/wse-plugin-caption-handlers-1.1.0.jar" ]; then
	echo "Found existing 1.1.0 version, keeping it"
else
	# Check if we have a local build directory mounted and copy from there
	if [ -f "/wowza_setup/build/libs/${PLUGIN_JAR}" ]; then
		echo "Found locally built ${PLUGIN_JAR}, copying..."
		cp "/wowza_setup/build/libs/${PLUGIN_JAR}" "/wowza_setup/downloads/"
	else
		# Fall back to downloading from GitHub
		rm -f /wowza_setup/downloads/wse-plugin-caption-handlers*
		echo "Getting ${PLUGIN_JAR} from GitHub release ${GITHUB_RELEASE_VERSION}"
		wget -q -P /wowza_setup/downloads/ "https://github.com/WowzaMediaSystems/wse-plugin-caption-handlers/releases/download/${GITHUB_RELEASE_VERSION}/wse-plugin-caption-handlers-${GITHUB_RELEASE_VERSION}.jar"
		
		# If we downloaded a different version, rename it
		if [ "${PLUGIN_VERSION}" != "${GITHUB_RELEASE_VERSION}" ] && [ -f "/wowza_setup/downloads/wse-plugin-caption-handlers-${GITHUB_RELEASE_VERSION}.jar" ]; then
			mv "/wowza_setup/downloads/wse-plugin-caption-handlers-${GITHUB_RELEASE_VERSION}.jar" "/wowza_setup/downloads/${PLUGIN_JAR}"
		fi
	fi
fi

# Handle client SDK
if [ -f "/wowza_setup/downloads/${CLIENT_SDK_JAR}" ]; then
	echo "File ${CLIENT_SDK_JAR} exists"
else
	rm -f /wowza_setup/downloads/client-sdk-*
	echo "Getting ${CLIENT_SDK_JAR}"
	wget -q -P /wowza_setup/downloads/ "https://github.com/WowzaMediaSystems/wse-plugin-caption-handlers/releases/download/${GITHUB_RELEASE_VERSION}/${CLIENT_SDK_JAR}"
fi

