BRIGHTNESS=$(cat /sys/class/backlight/intel_backlight/brightness)
BRIGHTNESS=$(echo "$BRIGHTNESS * 0.64" | bc)
BRIGHTNESS=$(echo "${BRIGHTNESS%.*}")
BRIGHTNESS=$(printf '%02x' $BRIGHTNESS)

$(echo $BRIGHTNESS > /home/nathaniel/temp.log)

if [ $(cat /home/nathaniel/tools/zbpd14/dual) -eq 1 ]
then
	echo "\_SB.ATKD.WMNB 0x0 0x53564544 b32000500${BRIGHTNESS}000000" | sudo tee /proc/acpi/call
fi
