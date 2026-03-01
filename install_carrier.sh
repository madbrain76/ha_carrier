#!/bin/bash
# HA Carrier Integration Manual Install Script
# Run this on your Home Assistant machine

echo "Installing HA Carrier integration..."

cd /config/custom_components || exit 1
rm -rf ha_carrier
mkdir -p ha_carrier
cd ha_carrier || exit 1

echo "Downloading files from HIGGS:8000..."

# Download all Python and JSON files using IPv4-only requests
WGET_OPTS="--inet4-only"
wget $WGET_OPTS http://HIGGS:8000/ha_carrier/custom_components/ha_carrier/__init__.py
wget $WGET_OPTS http://HIGGS:8000/ha_carrier/custom_components/ha_carrier/binary_sensor.py
wget $WGET_OPTS http://HIGGS:8000/ha_carrier/custom_components/ha_carrier/carrier_data_update_coordinator.py
wget $WGET_OPTS http://HIGGS:8000/ha_carrier/custom_components/ha_carrier/carrier_entity.py
wget $WGET_OPTS http://HIGGS:8000/ha_carrier/custom_components/ha_carrier/climate.py
wget $WGET_OPTS http://HIGGS:8000/ha_carrier/custom_components/ha_carrier/config_flow.py
wget $WGET_OPTS http://HIGGS:8000/ha_carrier/custom_components/ha_carrier/const.py
wget $WGET_OPTS http://HIGGS:8000/ha_carrier/custom_components/ha_carrier/diagnostics.py
wget $WGET_OPTS http://HIGGS:8000/ha_carrier/custom_components/ha_carrier/manifest.json
wget $WGET_OPTS http://HIGGS:8000/ha_carrier/custom_components/ha_carrier/select.py
wget $WGET_OPTS http://HIGGS:8000/ha_carrier/custom_components/ha_carrier/sensor.py
wget $WGET_OPTS http://HIGGS:8000/ha_carrier/custom_components/ha_carrier/strings.json
wget $WGET_OPTS http://HIGGS:8000/ha_carrier/custom_components/ha_carrier/util.py

# Download translations
mkdir -p translations
wget $WGET_OPTS http://HIGGS:8000/ha_carrier/custom_components/ha_carrier/translations/en.json -O translations/en.json

echo ""
echo "✅ Installation complete!"
echo ""
echo "Next steps:"
echo "1. Restart Home Assistant"
echo "2. Check for new energy sensors (hp_heat_energy_yesterday, etc.)"
echo ""
