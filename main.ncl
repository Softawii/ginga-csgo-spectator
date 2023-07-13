<?xml version="1.0" encoding="ISO-8859-1"?>
<ncl id="focus" xmlns="http://www.ncl.org.br/NCL3.0/EDTVProfile"
	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
	xsi:schemaLocation="http://www.ncl.org.br/NCL3.0/EDTVProfile
	http://www.ncl.org.br/NCL3.0/profiles/NCL30EDTV.xsd">
<head>

  <regionBase>
    <region id="regionFullscreen" width="100%" height="100%" zIndex="1" />

    <region id="regionButtons" zIndex="10">
      <region id="regionPlayerButtons">
        <!-- Left -->
        <region id="regionButtonYurih" left="0%" top="296px" width="64px" height="64px" zIndex="10" />
        <region id="regionButtonDrop" left="0%" top="360px" width="64px" height="64px" zIndex="10" />

        <!-- Right -->
        <region id="regionButtonB1t" right="0%" top="296px" width="64px" height="64px" zIndex="10" />
        <region id="regionButtonS1mple" right="0%" top="360px" width="64px" height="64px" zIndex="10" />
      </region>

      <region id="regionControlButtons">
        <region id="regionButtonPlay" left="544px" bottom="0%" width="64px" height="64px" zIndex="10" />
        <region id="regionButtonPause" left="608px" bottom="0%" width="64px" height="64px" zIndex="10" />
        <region id="regionButtonClose" left="672px" bottom="0%" width="64px" height="64px" zIndex="10" />
      </region>
    </region>
  </regionBase>

  <descriptorBase>
    <!-- Buttons -->
    <descriptor
      id="descriptorYuurihButton"
      region="regionButtonYurih"
      focusIndex="indexYuurihButton"
      moveUp="indexPlayButton" moveDown="indexDropButton"
      moveLeft="indexB1tButton" moveRight="indexB1tButton"
    />
    <descriptor
      id="descriptorDropButton"
      region="regionButtonDrop"
      focusIndex="indexDropButton"
      moveUp="indexYuurihButton" moveDown="indexPlayButton"
      moveLeft="indexS1mpleButton" moveRight="indexS1mpleButton"
    />
    <descriptor
      id="descriptorB1tButton"
      region="regionButtonB1t"
      focusIndex="indexB1tButton"
      moveUp="indexCloseButton" moveDown="indexS1mpleButton"
      moveLeft="indexYuurihButton" moveRight="indexYuurihButton"
    />
    <descriptor
      id="descriptorS1mpleButton"
      region="regionButtonS1mple"
      focusIndex="indexS1mpleButton"
      moveUp="indexB1tButton" moveDown="indexCloseButton"
      moveLeft="indexDropButton" moveRight="indexDropButton"
    />
    <descriptor
      id="descriptorCloseButton"
      region="regionButtonClose"
      focusIndex="indexCloseButton"
      moveUp="indexS1mpleButton" moveDown="indexB1tButton"
      moveLeft="indexPauseButton"
    />
    <descriptor
      id="descriptorPauseButton"
      region="regionButtonPause"
      focusIndex="indexPauseButton"
      moveLeft="indexPlayButton" moveRight="indexCloseButton"
    />
    <descriptor
      id="descriptorPlayButton"
      region="regionButtonPlay"
      focusIndex="indexPlayButton"
      moveUp="indexDropButton" moveDown="indexYuurihButton"
      moveRight="indexPauseButton"
    />
    <!-- Videos -->
    <descriptor
      id="descriptorVideo"
      region="regionFullscreen"
    />
  </descriptorBase>

  <connectorBase>
    <causalConnector id="onBeginStart">
      <simpleCondition role="onBegin"/>
      <simpleAction role="start" max="unbounded" qualifier="par"/>
    </causalConnector>

    <causalConnector id="onSelectionStop">
      <connectorParam name="value"/>
      <simpleCondition role="onSelection"/>
      <simpleAction role="stop" max="unbounded" qualifier="par"/>      
    </causalConnector>

    <causalConnector id="onSelectionResume">
      <connectorParam name="value"/>
      <simpleCondition role="onSelection"/>
      <simpleAction role="resume" max="unbounded" qualifier="par"/>
    </causalConnector>

    <causalConnector id="onSelectionPause">
      <connectorParam name="value"/>
      <simpleCondition role="onSelection"/>
      <simpleAction role="pause" max="unbounded" qualifier="par"/>
    </causalConnector>

    <causalConnector id="onChangeIndex">
      <simpleCondition role="onSelection" />
		  <connectorParam name="var"/>
      <simpleAction role="set" value="$var" qualifier="par"/>
    </causalConnector>
  </connectorBase>

</head>

<body>
  <port id="entrada" component="yuurih"/>

  <!-- Buttons -->
  <media descriptor="descriptorYuurihButton" id="buttonYurih" src="assets/yuurih.png" />
  <media descriptor="descriptorB1tButton" id="buttonB1t" src="assets/b1t.png" />
  <media descriptor="descriptorDropButton" id="buttonDrop" src="assets/drop.png" />
  <media descriptor="descriptorS1mpleButton" id="buttonS1mple" src="assets/s1mple.png" />
  <media descriptor="descriptorCloseButton" id="buttonClose" src="assets/stop.png" />
  <media descriptor="descriptorPauseButton" id="buttonPause" src="assets/pause.png" />
  <media descriptor="descriptorPlayButton" id="buttonPlay" src="assets/play.png" />

  <!-- Videos -->
  <media id="yuurih" descriptor="descriptorVideo" src="assets/yuurih.mp4" >
    <property name="zIndex" value="5" />
    <property name="soundLevel" value="1" />
  </media>
  <media id="b1t" descriptor="descriptorVideo" src="assets/b1t.mp4" >
    <property name="zIndex" value="0" />
    <property name="soundLevel" value="0" />
  </media>
  <media id="drop" descriptor="descriptorVideo" src="assets/drop.mp4" >
    <property name="zIndex" value="0" />
    <property name="soundLevel" value="0" />
  </media>
  <media id="s1mple" descriptor="descriptorVideo" src="assets/s1mple.mp4" >
    <property name="zIndex" value="0" />
    <property name="soundLevel" value="0" />
  </media>

  <link xconnector="onBeginStart">
    <bind component="yuurih" role="onBegin" />
    <!-- Videos -->
    <bind component="yuurih" role="start" />
    <bind component="b1t" role="start" />
    <bind component="drop" role="start" />
    <bind component="s1mple" role="start" />
    <!-- Buttons -->
    <bind component="buttonYurih" role="start" />
    <bind component="buttonB1t" role="start" />
    <bind component="buttonDrop" role="start" />
    <bind component="buttonS1mple" role="start" />
    <bind component="buttonClose" role="start" />
    <bind component="buttonPlay" role="start" />
    <bind component="buttonPause" role="start" />
  </link>

  <link xconnector="onBeginStart">
    <bind component="buttonPlay" role="onBegin" />
    <!-- Videos -->
    <bind component="yuurih" role="start" />
    <bind component="b1t" role="start" />
    <bind component="drop" role="start" />
    <bind component="s1mple" role="start" />
  </link>

  <link xconnector="onSelectionResume">
    <bind component="buttonPlay" role="onSelection" />
    <!-- Videos -->
    <bind component="yuurih" role="resume" />
    <bind component="b1t" role="resume" />
    <bind component="drop" role="resume" />
    <bind component="s1mple" role="resume" />
  </link>

  <link xconnector="onSelectionPause">
    <bind component="buttonPause" role="onSelection" />
    <!-- Videos -->
    <bind component="yuurih" role="pause" />
    <bind component="b1t" role="pause" />
    <bind component="drop" role="pause" />
    <bind component="s1mple" role="pause" />
  </link>

  <!-- Set Yuurih -->
	<link xconnector="onChangeIndex">
    <bind component="buttonYurih" role="onSelection" />
    <!-- Current -->
		<bind role="set" component="yuurih" interface="zIndex">
			<bindParam name="var" value="5"/>
		</bind>
		<bind role="set" component="yuurih" interface="soundLevel">
			<bindParam name="var" value="1"/>
		</bind>
    <!-- Others -->
		<bind role="set" component="b1t" interface="zIndex">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="b1t" interface="soundLevel">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="drop" interface="zIndex">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="drop" interface="soundLevel">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="s1mple" interface="zIndex">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="s1mple" interface="soundLevel">
			<bindParam name="var" value="0"/>
		</bind>
	</link>

  <!-- Set B1t -->
	<link xconnector="onChangeIndex">
    <bind component="buttonB1t" role="onSelection" />
    <!-- Current -->
		<bind role="set" component="b1t" interface="zIndex">
			<bindParam name="var" value="5"/>
		</bind>
		<bind role="set" component="b1t" interface="soundLevel">
			<bindParam name="var" value="1"/>
		</bind>
    <!-- Others -->
		<bind role="set" component="yuurih" interface="zIndex">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="yuurih" interface="soundLevel">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="drop" interface="zIndex">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="drop" interface="soundLevel">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="s1mple" interface="zIndex">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="s1mple" interface="soundLevel">
			<bindParam name="var" value="0"/>
		</bind>
	</link>

  <!-- Set Drop -->
	<link xconnector="onChangeIndex">
    <bind component="buttonDrop" role="onSelection" />
    <!-- Current -->
		<bind role="set" component="drop" interface="zIndex">
			<bindParam name="var" value="5"/>
		</bind>
		<bind role="set" component="drop" interface="soundLevel">
			<bindParam name="var" value="1"/>
		</bind>
    <!-- Others -->
		<bind role="set" component="yuurih" interface="zIndex">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="yuurih" interface="soundLevel">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="b1t" interface="zIndex">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="b1t" interface="soundLevel">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="s1mple" interface="zIndex">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="s1mple" interface="soundLevel">
			<bindParam name="var" value="0"/>
		</bind>
	</link>

  <!-- Set S1mple -->
	<link xconnector="onChangeIndex">
    <bind component="buttonS1mple" role="onSelection" />
    <!-- Current -->
		<bind role="set" component="s1mple" interface="zIndex">
			<bindParam name="var" value="5"/>
		</bind>
		<bind role="set" component="s1mple" interface="soundLevel">
			<bindParam name="var" value="1"/>
		</bind>
    <!-- Others -->
		<bind role="set" component="yuurih" interface="zIndex">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="yuurih" interface="soundLevel">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="b1t" interface="zIndex">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="b1t" interface="soundLevel">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="drop" interface="zIndex">
			<bindParam name="var" value="0"/>
		</bind>
		<bind role="set" component="drop" interface="soundLevel">
			<bindParam name="var" value="0"/>
		</bind>
	</link>

  <link id="linkClose" xconnector="onSelectionStop">
    <bind component="buttonClose" role="onSelection" />
    <!-- Buttons -->
    <bind component="buttonClose" role="stop" />
    <bind component="buttonB1t" role="stop" />
    <bind component="buttonYurih" role="stop" />
    <bind component="buttonDrop" role="stop" />
    <bind component="buttonS1mple" role="stop" />
    <bind component="buttonPlay" role="stop" />
    <bind component="buttonPause" role="stop" />
    <!-- Videos -->
    <bind component="yuurih" role="stop" />
    <bind component="b1t" role="stop" />
    <bind component="drop" role="stop" />
    <bind component="s1mple" role="stop" />
  </link>

</body>
</ncl>

<!-- 
	scp -oHostKeyAlgorithms=+ssh-rsa -r projeto/ root@192.168.62.128:/misc/ncl30/projeto/
	ssh -oHostKeyAlgorithms=+ssh-rsa root@192.168.62.128
	/misc/launcher.sh /misc/ncl30/projeto/main.ncl
  rsync -P -u -e 'ssh -oHostKeyAlgorithms=+ssh-rsa' -a . root@192.168.62.128:/misc/ncl30/projeto/
 -->