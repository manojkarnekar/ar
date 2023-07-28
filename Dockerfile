FROM ros:noetic

ENV DEBIAN_FRONTEND=noninteractive
ENV SHELL /bin/bash
SHELL ["/bin/bash", "-c"]

ENV ROS_WS /catkin_ws
RUN mkdir -p ${ROS_WS}/src

COPY /catkin_ws/src/talker ${ROS_WS}/src/talker

RUN bash -c 'apt-get update \
&& apt-get install -y --no-install-recommends apt-utils \
&& apt-get install -y --no-install-recommends ros-noetic-catkin \
python3-catkin-tools \
ros-noetic-nav-msgs \
ros-noetic-sensor-msgs \
&& cd ${ROS_WS} \
&& source /opt/ros/noetic/setup.bash \
&& catkin build'
