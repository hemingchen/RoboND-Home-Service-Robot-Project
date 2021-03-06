#!/bin/sh
catkin_dir=/home/workspace/catkin_ws
catkin_src_dir=$catkin_dir/src
project_src_dir=$catkin_src_dir/RoboND-Home-Service-Robot-Project

#Launch turtlebot in the custom world
xterm  -e  " roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=$project_src_dir/World/myworld.world" &
sleep 5

#Launch gmapping demo
xterm -e " roslaunch turtlebot_gazebo gmapping_demo.launch custom_gmapping_launch_file:=$project_src_dir/turtlebot_simulator/turtlebot_gazebo/launch/gmapping.launch.xml" &
sleep 5

#Launch wall_follower node
xterm -e " source $catkin_dir/devel.setup.bash; rosrun wall_follower wall_follower_node" &
sleep 5

#Launch rviz
xterm -e " roslaunch turtlebot_rviz_launchers view_navigation.launch"



