#!/bin/bash

# ==============================================================================
# Script: configure_ha_gateway.sh
# Purpose: Automates the setup of IP forwarding, NAT masquerading, and port
#          redirection for a High-Availability Enterprise Gateway.
# ==============================================================================

INTERNAL_SUBNET="10.9.9.0/24"
EXTERNAL_TARGET="10.100.0.8"
INBOUND_PORT="8080"
TARGET_PORT="80"

echo "Applying High-Availability Edge Gateway Configuration..."

echo "[1/3] Enabling IP Forwarding..."
sysctl -w net.ipv4.ip_forward=1 > /dev/null

# 2. Configure Port Redirection (DNAT)
echo "[2/3] Configuring Inbound Port Redirection (Port $INBOUND_PORT -> $TARGET_PORT)..."
iptables -t nat -A PREROUTING -p tcp -s "${INTERNAL_SUBNET}" --dport "${INBOUND_PORT}" -j DNAT --to-destination "${EXTERNAL_TARGET}:${TARGET_PORT}"

# 3. Configure Masquerading (SNAT)
echo "[3/3] Configuring Source NAT / Masquerading for return traffic..."
iptables -t nat -A POSTROUTING -p tcp -s "${INTERNAL_SUBNET}" -d "${EXTERNAL_TARGET}" --dport "${TARGET_PORT}" -j MASQUERADE

echo "Gateway Configuration Complete! Current NAT Rules:"
echo "------------------------------------------------"
iptables -t nat -L -nv
