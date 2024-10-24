FROM ros:humble
# GUI not needed for the KANGA, MAYBE for local testing
# FROM osrf/ros:humble-desktop

RUN apt-get update && apt-get install -y \
    nano \
    && rm -rf /var/lib/apt/lists/*

COPY entrypoint.sh /entrypoint.sh
COPY config/bashrc /home/{USERNAME}/.bashrc

# run launch file
# CMD ["ros2", "launch", "talker_listener_launch.py"]

ENTRYPOINT [ "/bin/bash", "/entrypoint.sh" ]

CMD ["bash"]