FROM debian:bullseye-slim

WORKDIR /opt/pmasterp

EXPOSE 3052/tcp
EXPOSE 3052/udp
EXPOSE 53568/tcp
EXPOSE 162/udp
EXPOSE 53566/udp

# Start
CMD ["/bin/bash","/opt/pmasterp/start.sh"] 

# Install dependencies
RUN apt update && apt install -y apt-utils curl unzip procps libusb-1.0-0 usbutils
RUN ln -s /opt/pmasterp/data/pmasterpd /etc/init.d/pmasterpd 

# Download PowerMaster from powerwalker.com
RUN curl -s https://www.powermonitor.software/pmp/pmp122_linux64.zip --output pmp105_linux64.zip 

# Add files from repository
COPY response.varfile .
COPY start.sh .
