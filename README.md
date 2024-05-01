<h1 align="center">Topic 3: PWM-Based Servo Motor Controller</h1>

<div>
<h3>Project description</h3>
<p align="justify">Develop a PWM-based servo motor controller using VHDL on the Nexys A7 FPGA board. Utilize the FPGA's PWM output capability to generate signals for controlling multiple independent servo motors connected to the Pmod connectors. Implement algorithms to adjust the angle of the servo motors based on user input received from buttons or switches. LEDs will offer visual feedback on the servo position or controller status.</p>
</div>

<div>
    <h3>Team members and roles</h3>
    <p>Karol Nový - Video, Coding</br>Martin Matyska - Coding, Documentation</br>Marek Michalica - Hardware, Documentation</p>
</div>

<div id="ourTake">
    <h2>Our take on the problem</h2>
    <p align="justify">Our approach to addressing the project involves employing a system where four switches are designated for selecting a specific servo motor, while another set of seven switches determines the angle for the selected servo. As a servo motor is chosen, its corresponding LED lights up, providing visual confirmation of the selection. Simultaneously, LEDs associated with the selected angle switches illuminate to indicate the desired position. Leveraging the PWM signal generated by our code, we dynamically control the servo motors, ensuring precise movement according to the selected angle. This design not only allows for intuitive selection and adjustment of servo motors and angles but also offers real-time visual feedback, enhancing user interaction and system monitoring.</p>
</div>

<div id="theory">
    <h2>Theory overview</h2>
    <h3>Pulse Width Modulation (PWM)</h3>
    <p align="justify">
        Pulse-width modulation (PWM), a widely-used modulation technique, involves altering the width of pulse signals within electrical systems to regulate the average power delivered to a load. This method proves particularly advantageous in controlling the output of audio amplifiers, motor speeds, and light brightness effectively. Essentially, PWM serves as a concise reference to a specific type of digital signal, finding diverse applications in complex control circuits.
        By allowing adjustment of signal duration in an analog manner, PWM facilitates a spectrum of effects across various applications. Despite the signal's binary nature either high (often 5V) or low (ground) at any given moment the ratio of high to low signal durations can be manipulated over regular intervals. In today's electronics landscape, PWM remains pivotal as technology evolves, frequently integrated into microcontrollers and specialized PWM controller integrated circuits (ICs) for ease of implementation. Its versatility and efficacy render it a fundamental element in designing and managing a wide array of electronic systems, contributing significantly to advancements in power electronics and control engineering.
    </p>
    </br>
    <div align="center">
        <img src="https://slidetodoc.com/presentation_image_h/c216b6866f4d0c039758f6263dd11c90/image-2.jpg" alt="PWM Modulation Image 1" srcset="" width="521px" height="360px">
        </br>
        <p>Figure 1: Pulse Width Modulation (PWM)</p>
    </div>
</div>

<div id="hardware">
    <h2>Hardware</h2>
    <p align="justify">
        Utilizing the Nexys A7 FPGA board as mandated by the project requirements, we integrated four SG90 9g servo motors into our system, connecting them to the board's Pmod ports (JA, JB, JC, JD). Technical specifications for both the servos and the FPGA board are detailed in the accompanying datasheets.
        Servo selection is made possible by switches SW12 to SW15, while angle selection utilizes switches SW0 to SW6. The desired angle is combined by flipping the desired switch from SW6 being 90° to SW0 being 1°. The BTNR button allows for PWM signal interruption when required.
        For user convenience and system monitoring, each activated switch illuminates its corresponding LED diode, aiding intuitive operation during servo and angle selection.
        </br>
        When considering that we have 7 switches (128 positions) and a modulation range of 2 ms, we obtain the frequency for our clock signal using the following equation: f=1/(2ms/128)=64kHz. With a frequency of 64kHz, we will have 1 ms every 64 repetitions, and for a frequency of 20 ms, we simply multiply by 20 (20*64=1280). The value of 1280 will be used for the internal counter to ensure a period of 20 ms.
    </p>
    <div align="center">
        <img src="https://5.imimg.com/data5/SELLER/Default/2021/4/GI/GX/JQ/11534553/nexys-a7-50t-fpga-development-board-250x250.jpg" alt="nexys-a7" srcset="">
        <p>Figure 2: Nexys A7-50T FPGA board</p>
    </div>
</div>

<div id="sources">
    <h2>References</h2>
    <p>
    [1] https://www.vorpenergy.com/batteries/pwm-solar-charge-controllers/
    </br>
    [2] http://www.ee.ic.ac.uk/pcheung/teaching/DE1_EE/stores/sg90_datasheet.pdf
    </br>
    [3] https://digilent.com/reference/programmable-logic/nexys-a7/start
    </br>
    [4] https://m.indiamart.com/proddetail/nexys-a7-50t-fpga-development-board-17248071655.html?pos=2&pla=n
    </p>
</div>