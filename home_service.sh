#!/bin/sh
catkin_dir=/home/workspace/catkin_ws
catkin_src_dir=$catkin_dir/src
project_src_dir=$catkin_src_dir/RoboND-Home-Service-Robot-Project

#Launch turtlebot in the custom world
xterm  -e  " roslaunch turtlebot_gazebo turtlebot_world.launch world_file:=$project_src_dir/World/myworld.world" &
sleep 5

#Launch amcl demo
xterm -e " roslaunch turtlebot_gazebo amcl_demo.launch map_file:=$project_src_dir/World/myMap.yaml" &
sleep 5

#Launch rviz
xterm -e " roslaunch turtlebot_rviz_launchers view_navigation.launch" &
sleep 10

#Launch markers in rviz
xterm -e " source $catkin_dir/devel/setup.bash; rosrun add_markers add_markers_node" &
sleep 3

#Launch navigation pick_objects node
xterm -e " source $catkin_dir/devel/setup.bash; rosrun pick_objects pick_objects_node"
