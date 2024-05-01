<h1 align="center">Topic 3: PWM-Based Servo Motor Controller</h1>

<div>
<h3>Project description</h3>
<p align="justify">Develop a PWM-based servo motor controller using VHDL on the Nexys A7 FPGA board. Utilize the FPGA's PWM output capability to generate signals for controlling multiple independent servo motors connected to the Pmod connectors. Implement algorithms to adjust the angle of the servo motors based on user input received from buttons or switches. LEDs will offer visual feedback on the servo position or controller status.</p>
</div>

<div>
    <h3>Team members and roles</h3>
    <p>Karol Nový - Video, Coding</br>Martin Matyska - Coding, Documentation</br>Marek Michalica - Hardware, Documentation</p>
</div>

<div id="theory">
    <h2>Theory overview</h2>
    <h3>Pulse Width Modulation (PWM)</h3>
    <p align="justify">
        Pulse-width modulation (PWM), a widely-used modulation technique, involves altering the width of pulse signals within electrical systems to regulate the average power delivered to a load. This method proves particularly advantageous in controlling the output of audio amplifiers, motor speeds, and light brightness effectively. Essentially, PWM serves as a concise reference to a specific type of digital signal, finding diverse applications in complex control circuits.
        By allowing adjustment of signal duration in an analog manner, PWM facilitates a spectrum of effects across various applications. Despite the signal's binary nature—either high (often 5V) or low (ground) at any given moment—the ratio of high to low signal durations can be manipulated over regular intervals. In today's electronics landscape, PWM remains pivotal as technology evolves, frequently integrated into microcontrollers and specialized PWM controller integrated circuits (ICs) for ease of implementation. Its versatility and efficacy render it a fundamental element in designing and managing a wide array of electronic systems, contributing significantly to advancements in power electronics and control engineering.
    </p>
    </br>
    <div align="center">
        <img src="https://slidetodoc.com/presentation_image_h/c216b6866f4d0c039758f6263dd11c90/image-2.jpg" alt="PWM Modulation Image 1" srcset="" width="521px" height="360px">
        </br>
        <p>Figure 1. Pulse Width Modulation (PWM)</p>
    </div>
</div>
