# PIC18F HMI Interactive Gaming Console

[Platform](https://img.shields.io/badge/Platform-PIC18F4520-blue)

[Language](https://img.shields.io/badge/Language-C%20%7C%20Python-green)

## Project Overview

This project implements a complete Interactive Gaming System. The core system utilizes a **PIC18F4520** microcontroller for real-time logic processing and hardware control, while the host system employs Python (Pygame) for visual rendering and audio processing.

By implementing a custom **UART Communication Protocol**, the system achieves millisecond-level bidirectional interaction between the MCU and PC, demonstrating a comprehensive integration of low-level driver development, interrupt control, and high-level multithreaded software architecture.

---

## Features

### 1. Firmware (PIC18F)

- **Interrupt**: Implemented Nested Interrupts, assigning High Priority to button events for immediate response and Low Priority to communication and timing logic.
- **Peripheral Integration**: seamless integration of **ADC (Variable Resistor)**, **Timer (System Clock)**, **External Interrupts (Buttons)**, and **UART** modules.
- **Finite State Machine**: Utilized FSM to manage game flow and state transitions.

### 2. Software (PC Host)

- **Multithreaded Architecture**: Adopts a Producer-Consumer model to decouple I/O communication from GUI rendering, ensuring a stable **60 FPS** frame rate without blocking.
- **Passive Rendering Engine**: The PC software functions strictly as a visualization layer. All core game logic, state management, and win/loss determinations are executed exclusively on the **PIC18F4520**, ensuring the microcontroller remains the true brain of the system.

---

## Games

The system includes three interactive game modes, with logic controlled by the PIC and display handled by the PC:

1. **TIC-TAC-TOE**
    - **Controls**: Use Variable Resistor (VR) to control cursor movement; Button to confirm placement.
    - **Logic**: PIC calculates win/loss conditions and draw states.
2. **REACTION GAME**
    - **Controls**: Two-player reaction test using buttons.
    - **Logic**: Players must stop a rapidly incrementing counter at a specific target. PIC calculates accuracy.
3. **WHAC-A-MOLE)**
    - **Controls**: Players 1 & 2 use buttons to initialize; **PC Keyboard (1-9)** used for attacking.
    - **Logic**: PC keyboard signals are transmitted via UART to the PIC, where hit detection and scoring are processed.

---

```
.
├── Docs
│   ├── Protocol.md             # Serial communication protocol specification
│   ├── UI.md                   # User Interface design docs
│   └── UI_Setup.md             # Setup guide for python environment
├── Final_Proj.X
│   ├── build
│   │   └── default
│   │       └── debug
│   │           └── _ext
│   │               └── 984248410
│   │                   ├── GAME_OUTPUT.i
│   │                   ├── GAME_OUTPUT.p1
│   │                   ├── GAME_OUTPUT.p1.d
│   │                   ├── main.i
│   │                   ├── main.p1
│   │                   ├── main.p1.d
│   │                   ├── REACTION_GAME.i
│   │                   ├── REACTION_GAME.p1
│   │                   ├── REACTION_GAME.p1.d
│   │                   ├── TIC_TAC_TOE.i
│   │                   ├── TIC_TAC_TOE.p1
│   │                   ├── TIC_TAC_TOE.p1.d
│   │                   ├── uart.i
│   │                   ├── uart.p1
│   │                   ├── uart.p1.d
│   │                   ├── WHAC_A_MOLE.i
│   │                   ├── WHAC_A_MOLE.p1
│   │                   └── WHAC_A_MOLE.p1.d
│   ├── debug
│   │   └── default
│   ├── dist
│   │   └── default
│   │       └── debug
│   │           ├── doprnt.d
│   │           ├── doprnt.i
│   │           ├── doprnt.p1
│   │           ├── Final_Proj.X.debug.cmf
│   │           ├── Final_Proj.X.debug.elf
│   │           ├── Final_Proj.X.debug.hxl
│   │           ├── Final_Proj.X.debug.lst
│   │           ├── Final_Proj.X.debug.map
│   │           ├── Final_Proj.X.debug.mum
│   │           ├── Final_Proj.X.debug.o
│   │           ├── Final_Proj.X.debug.rlf
│   │           ├── Final_Proj.X.debug.sdb
│   │           ├── Final_Proj.X.debug.sym
│   │           └── memoryfile.xml
│   ├── GAME_OUTPUT.c           # Handles formatting data output to PC
│   ├── INTERFACE.h             # Common definitions and interface headers
│   ├── main.c                  # Main entry point for the microcontroller
│   ├── Makefile
│   ├── nbproject
│   │   ├── configurations.xml
│   │   ├── Makefile-default.mk
│   │   ├── Makefile-genesis.properties
│   │   ├── Makefile-impl.mk
│   │   ├── Makefile-local-default.mk
│   │   ├── Makefile-variables.mk
│   │   ├── Package-default.bash
│   │   ├── private
│   │   │   ├── configurations.xml
│   │   │   └── private.xml
│   │   └── project.xml
│   ├── REACTION_GAME.c         # Source logic for 'Reaction' game
│   ├── REACTION_GAME.h         # Header for 'Reaction' game
│   ├── TIC_TAC_TOE.c           # Source logic for 'Tic-Tac-Toe' game
│   ├── TIC_TAC_TOE.h           # Header for 'Tic-Tac-Toe' game
│   ├── uart.c                  # UART driver implementation
│   ├── uart.h                  # UART driver header
│   ├── WHAC_A_MOLE.c           # Source logic for 'Whac-A-Mole' game
│   └── WHAC_A_MOLE.h           # Header for 'Whac-A-Mole' game
└── UI
    ├── assets                  # Media resources (Audio/Images)
    │   ├── bgm.mp3
    │   ├── button.mp3
    │   ├── hint.mp3
    │   ├── hit.mp3
    │   ├── miss.mp3
    │   ├── move.mp3
    │   ├── place.mp3
    │   ├── tongtongtong.png
    │   └── win.mp3
    ├── config.py               # Global settings (screen size, serial settings)
    ├── main.py                 # Application entry point
    ├── managers.py             # Logic for managing game states
    ├── scenes.py               # Visual layout and logic for screens
    └── workers.py              # Background threads (Serial I/O reading)

```

## System Architecture (Firmware)

```mermaid
graph TD
    %% ==========================================
    %% 樣式定義 (Class Definitions)
    %% ==========================================
    classDef hardware fill:#2d2d2d,stroke:#000,stroke-width:2px,color:#fff
    classDef peripheral fill:#e3f2fd,stroke:#1565c0,stroke-width:2px,color:#000
    classDef isr fill:#ffebee,stroke:#c62828,stroke-width:2px,color:#000
    classDef logic fill:#ffffff,stroke:#333,stroke-width:1px,color:#000
    classDef data fill:#fff3e0,stroke:#ef6c00,stroke-width:2px,stroke-dasharray: 5 5,color:#000

    %% ==========================================
    %% 1. 外部實體層
    %% ==========================================
    subgraph Physical_IO [External Hardware]
        BTN_P1[Button P1 / RB0]:::hardware
        BTN_P2[Button P2 / RB1]:::hardware
        VR_KNOB[Variable Resistor / AN0]:::hardware
    end

    %% ==========================================
    %% 2. PIC18F4520 內部系統
    %% ==========================================
    subgraph PIC_Core [PIC18F4520 System Firmware]
        direction TB

        %% --- A. 硬體模組 ---
        subgraph Hw_Modules [Internal Peripherals]
            INT_CON[Interrupt Controller INT0/INT1]:::peripheral
            ADC_MOD[ADC Module 10-bit]:::peripheral
            TMR2_MOD[Timer2 Module System Tick]:::peripheral
            UART_MOD[UART Transceiver TX/RX]:::peripheral
        end

        %% --- B. 中斷服務層 ---
        subgraph Interrupts [Interrupt Service Routines]
            ISR_H[High-Priority ISR Button Events]:::isr
            ISR_L[Low-Priority ISR Timer/ADC/UART]:::isr
        end

        %% --- C. 全域資料表 ---
        DATA[Global Data Tables Structs]:::data

        %% --- D. 主邏輯狀態機 ---
        subgraph Main_Loop [Main Loop State Machine]
            STATE_SW{Process Switch}:::logic
            
            %% 邏輯分支
            P_HINT[Process Hint: Wait Ready]:::logic
            P_TTT[Process 1: Tic-Tac-Toe]:::logic
            P_REACT[Process 3: Reaction Game]:::logic
            P_WAM[Process 5: Whac-A-Mole]:::logic
            P_END[Process End: Result]:::logic
        end

        %% ==========================================
        %% 連線關係
        %% ==========================================
        
        %% 實體 -> 周邊
        BTN_P1 --> INT_CON
        BTN_P2 --> INT_CON
        VR_KNOB --> ADC_MOD

        %% 周邊 -> 中斷
        INT_CON ==> ISR_H
        ADC_MOD ==> ISR_L
        TMR2_MOD ==> ISR_L
        UART_MOD -.->|RX Data| ISR_L

        %% 中斷 -> 更新記憶體
        ISR_H -- Set Flags: P1/P2 Press --> DATA
        ISR_L -- Set Values: Tick/ADC/Input --> DATA

        %% 主迴圈讀寫
        DATA <--> STATE_SW

        %% 狀態機分流
        STATE_SW --> P_HINT
        STATE_SW --> P_TTT
        STATE_SW --> P_REACT
        STATE_SW --> P_WAM
        STATE_SW --> P_END

        %% 邏輯輸出 -> UART
        P_HINT & P_TTT & P_REACT & P_WAM & P_END -->|Format String| UART_MOD
    end

    %% ==========================================
    %% 3. 對外輸出
    %% ==========================================
    UART_MOD ==>|TX Protocol| PC_LINK[To PC Terminal]:::hardware
```

## System Architecture (Software)

```mermaid
graph TD
    %% ==========================================
    %% 樣式定義
    %% ==========================================
    classDef file fill:#f9f9f9,stroke:#666,stroke-width:2px,color:#000
    classDef thread fill:#e8f5e9,stroke:#2e7d32,stroke-width:2px,color:#000
    classDef process fill:#fff,stroke:#333,stroke-width:1px,color:#000
    classDef memory fill:#fff8e1,stroke:#fbc02d,stroke-width:2px,color:#000
    classDef queue fill:#ffebee,stroke:#c62828,stroke-width:2px,color:#000

    %% ==========================================
    %% 1. 程式初始化 (Initialization)
    %% ==========================================
    subgraph Init_Phase [System Initialization]
        ARG_PARSE[ArgParse: --p1 --p2 --sim]:::process
        CONFIG_LOAD[Config Loader: Constants]:::file
        ASSET_LOAD[Asset Manager: Fonts/Images]:::file
        
        ARG_PARSE --> MAIN_ENTRY
        CONFIG_LOAD --> MAIN_ENTRY[Main Entry Point]:::process
    end

    %% ==========================================
    %% 2. 後端通訊執行緒 (Backend Thread)
    %% ==========================================
    subgraph Backend_Thread [Worker Thread / workers.py]
        direction TB
        SERIAL_LOOP[Serial Loop]:::thread
        
        %% 讀取流程
        READ_BYTE[UART Readline]:::process
        DECODE[Decode UTF-8]:::process
        CHECK_PROTO{Check $...*}:::process
        PARSE[Split String ',']:::process
        
        %% 寫入流程
        CHECK_Q{Check Queue}:::process
        WRITE_BYTE[Serial Write]:::process

        SERIAL_LOOP --> READ_BYTE --> DECODE --> CHECK_PROTO
        CHECK_PROTO -->|Valid| PARSE
        
        SERIAL_LOOP --> CHECK_Q
        CHECK_Q -->|Has Item| WRITE_BYTE
    end

    %% ==========================================
    %% 3. 資料交換中心 (Data Exchange)
    %% ==========================================
    subgraph Shared_Memory [Shared Memory Space]
        STATE_DICT[Shared State Dict]:::memory
        CMD_QUEUE[Command Queue FIFO]:::queue
        
        %% 註解內容
        %% State: {scene, raw_data, connected}
        %% Queue: [b'1', b'9', b'$RESET*']
    end

    %% ==========================================
    %% 4. 前端主執行緒 (Main Thread)
    %% ==========================================
    subgraph Frontend_Thread [Main GUI Thread / main.py]
        direction TB
        GAME_LOOP[Pygame Game Loop]:::thread

        %% 輸入處理
        subgraph Input_Handler [Input Processing]
            PY_EVT[Event.Get]:::process
            KEY_MAP[Key Mapping 1-9]:::process
        end

        %% 邏輯處理
        subgraph Logic_Handler [Logic & Routing]
            SCENE_R[Scene Router]:::process
            MGR_SND[Sound Manager]:::file
            MGR_BG[Background Effect]:::file
        end

        %% 畫面渲染
        subgraph Renderers [Scene Renderers / scenes.py]
            SC_WAIT[Scene: Waiting]:::process
            SC_TTT[Scene: TTT / Draw Grid]:::process
            SC_REACT[Scene: React / Draw Lock]:::process
            SC_WAM[Scene: WAM / Draw 3D Moles]:::process
        end

        %% 流程
        GAME_LOOP --> PY_EVT --> KEY_MAP
        GAME_LOOP --> MGR_BG
        GAME_LOOP --> SCENE_R
        SCENE_R --> MGR_SND
        
        SCENE_R --> SC_WAIT & SC_TTT & SC_REACT & SC_WAM
    end

    %% ==========================================
    %% 系統連線 (Inter-Thread Communication)
    %% ==========================================
    
    %% Backend 更新 Shared State
    PARSE -- Update --> STATE_DICT
    
    %% Frontend 讀取 Shared State
    STATE_DICT -- Read State/Data --> SCENE_R
    STATE_DICT -- Read --> MGR_SND
    
    %% Frontend 傳送指令到 Queue
    KEY_MAP -- Put Command --> CMD_QUEUE
    
    %% Backend 讀取 Queue
    CMD_QUEUE -- Get Command --> CHECK_Q

    %% Init 連接
    MAIN_ENTRY --> GAME_LOOP
    MAIN_ENTRY -.-> SERIAL_LOOP
```