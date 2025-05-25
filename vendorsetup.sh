echo "cloning bcr repository..."

git clone https://github.com/Chaitanyakm/vendor_bcr.git vendor/bcr

echo "done"

echo "cloning viper4fx repository..."

git clone https://github.com/TogoFire/packages_apps_ViPER4AndroidFX packages/apps/ViPER4AndroidFX

echo "done"

deviceDir=$(gettop)/device/xiaomi/blossom/

# Apply camera patches
${deviceDir}/patch_camera.sh

# apply patches
${deviceDir}/applyPatches.sh ${deviceDir}/patches

# For now, just skip the ABI checks to fix build errors.
export SKIP_ABI_CHECKS=true

export TARGET_BOARD_PLATFORM=mt6765
