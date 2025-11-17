{ config, pkgs, ... }:
let
nvidia-offload = pkgs.writeShellScriptBin "nvidia-offload" ''
export __NV_PRIME_RENDER_OFFLOAD=1
export __NV_PRIME_RENDER_OFFLOAD_PROVIDER=NVIDIA-G0
export __GLX_VENDOR_LIBRARY_NAME=nvidia
export __VK_LAYER_NV_optimus=NVIDIA_only
exec "$@"
'';
in

{
# NVIDIA services
services.xserver.videoDrivers = [ "nvidia" ];

#hardware.opengl = {
#			enable = true;
#			driSupport = true;
#			driSupport32Bit=true;
#			extraPackages = with pkgs;[ vaapiVdpau nvidia-vaapi-driver intel-media-driver]; 
#		};
		
#hardware.opengl.setLdLibraryPath = true;  # Ensures the dynamic linker finds libraries correctly

#25.05 modifications
#hardware.graphics = {
#enable = true;

# Environment variables for Vulkan
#environment.variables = {
#  VULKAN_ICD_FILENAMES = "/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json";
#  VULKAN_LAYER_PATH = "/run/opengl-driver/share/vulkan/implicit_layer.d";
#  VK_DRIVER_FILES = "/run/opengl-driver/share/vulkan/icd.d/nvidia_icd.x86_64.json";
#};

hardware.nvidia={
		modesetting.enable = true;
		powerManagement.enable = true;
		powerManagement.finegrained = false;
		open = false; 
		# Open-source kernel modules are preferred over and planned to steadily replace proprietary modules[1], although they only support GPUs of the Turing architecture or newer - GTX 10XX of this laptop not supported
		nvidiaSettings = true;
		package = config.boot.kernelPackages.nvidiaPackages.latest;
	};
	    #powerManagement.enable = false;
    #powerManagement.finegrained = false;
	 #   package = config.boot.kernelPackages.nvidiaPackages.stable;
	hardware.nvidia.prime = {
		offload = { enable = true; enableOffloadCmd=true;
		};
		intelBusId = "PCI:0:2:0";
		nvidiaBusId = "PCI:1:0:0";
	};
	programs.git = { enable = true; };
	time.hardwareClockInLocalTime = true;
	
	# Expose the nvidia-offload command to allow applications to run on NVIDIA GPU
  	environment.systemPackages = [ nvidia-offload ];

}

 # Configure optimus prime bus values (mandatory for laptops)
  #hardware.nvidia.prime = {
   # sync.enable = true;

    #intelBusId = "PCI:0:2:0";
   # nvidiaBusId = "PCI:1:0:0";
  #};
