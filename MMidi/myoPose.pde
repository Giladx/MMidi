int poseInt, poseS, poseMIDI= 0;
String pose;

void convertPose(){
    if (pose=="UNCKNOWN") poseInt = 0;
    else if (pose=="FIST") poseInt = 1;
    else if (pose=="FINGERS_SPREAD") poseInt = 2;
    else if (pose=="WAVE_IN") poseInt = 3;
    else if (pose=="WAVE_OUT") poseInt = 4;
    else if (pose=="DOUBLE_TAP") poseInt = 5;
   else if (pose=="REST") poseInt = 6;
}

void sendPose(){
  
   if(MIDI){
   poseMIDI = int(poseInt*21.166666667); 
   myBus.sendControllerChange(chMIDI, 20, poseMIDI);
   /*cc20 send pose messages
     v0 = UNCKNOWN
     v21 = FIST
     v42 = FINGERS_SPREAD
     v64 = WAVE_IN
     v85 = WAVE_OUT
     v106 = DOUBLE_TAP
     v127   = REST
   */
   }  
   
   if(OpenSoundControl){ 
    OscMessage Pose = new OscMessage("/layer3/video/opacity/values");
    
    Pose.add(pose);
    Pose.add(poseInt);

    oscP5.send(Pose, myRemoteLocation);
 }
}
