int accSx, accSy, accSz = 0;
int accXMIDI, accYMIDI, accZMIDI; //cc4, cc5, cc6


void sendAcceleration(){
  
if(MIDI){   
     accXMIDI = int(acceleration.x/(2*PI)*127);
     accYMIDI = int(acceleration.y/(2*PI)*127);
     accZMIDI = int(acceleration.z/(2*PI)*127);
     
     myBus.sendControllerChange(chMIDI, 4, rollMIDI); // Send a Midi noteOn
     myBus.sendControllerChange(chMIDI, 5, pitchMIDI); // Send a Midi noteOn
     myBus.sendControllerChange(chMIDI, 6, yawMIDI); // Send a Midi noteOn
    }
    
if(OpenSoundControl){  
    OscMessage acc = new OscMessage("/layer4/video/opacity/values");
   
    acc.add(acceleration.x); //  0-2PI
    acc.add(acceleration.y); //  0-2PI
    acc.add(acceleration.z); //  0-2PI
        
   oscP5.send(acc, myRemoteLocation); 
}
}

