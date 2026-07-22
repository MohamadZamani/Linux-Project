# 🛡️ High-Availability Enterprise NAT Gateway

## 📖 Scenario Overview
In enterprise architectures, a gateway node cannot rely on a single network interface (SPOF). This project demonstrates the configuration of a **High-Availability (HA) Edge Gateway** that utilizes **Network Bonding** for hardware redundancy and **IPTables** for traffic redirection and Network Address Translation (NAT).

An internal application cluster on a private subnet (`10.9.9.0/24`) requires secure routing through this central gateway to reach an external backend service at (`10.100.0.8:80`). 

## 🎯 Objectives
1. **Layer 2 Redundancy:** Aggregate multiple physical interfaces (`eth2`, `eth3`) into a bonded active-backup interface (`bond0`).
2. **Layer 4 Traffic Engineering:** Redirect incoming internal traffic on port `8080` to the external backend service on port `80`.
3. **Reverse Path Translation:** Configure Source NAT (Masquerading) to ensure return packets traverse back to the originating internal host successfully.

---

## 🛠️ Implementation Steps

### Step 1: Configure Network Bonding (Netplan)
Configured `bond0` using Netplan, setting `eth3` as the primary interface in an active-backup fault-tolerance mode.

```yaml
# /etc/netplan/99-bond.yaml (Snippet)
bonds:
  bond0:
    dhcp4: yes
    interfaces:
      - eth2
      - eth3
    parameters:
      mode: active-backup
      primary: eth3
