VULKAN_SDK_PATH = /home/fran/Downloads/vulkansdk-linux-x86_64-1.4.313.0/1.4.313.0/x86_64
STB_INCLUDE_PATH = /usr/include/stb

CFLAGS = -std=c++17 -O2 -I$(VULKAN_SDK_PATH)/include -I$(STB_INCLUDE_PATH)
LDFLAGS = -lglfw -lvulkan -ldl -lpthread -lX11 -lXxf86vm -lXrandr -lXi

VulkanTest: main.cpp
	g++ $(CFLAGS) -o VulkanTest main.cpp $(LDFLAGS)

.PHONY: shader test clean

shader: compile.sh
	./compile.sh

test: VulkanTest
	./compile.sh
	./VulkanTest

clean:
	rm -f VulkanTest