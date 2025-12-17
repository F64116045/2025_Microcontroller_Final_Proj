import pygame
import math
import random
import os
from config import *

# ==========================================
#   ASSET MANAGEMENT
# ==========================================
_fonts = {}
_images = {}
_game_history = {} 

def get_font(name, size):
    """Loads font dynamically with caching."""
    key = (name, size)
    if key not in _fonts:
        try: 
            _fonts[key] = pygame.font.SysFont("consolas", size, bold=True)
        except: 
            _fonts[key] = pygame.font.SysFont(None, size)
    return _fonts[key]

def get_image(path, size=None):
    """Loads image safely with caching."""
    key = (path, size)
    if key not in _images:
        if os.path.exists(path):
            try:
                img = pygame.image.load(path).convert_alpha()
                if size:
                    img = pygame.transform.scale(img, size)
                _images[key] = img
            except:
                _images[key] = None
        else:
            _images[key] = None
    return _images[key]

# ==========================================
#   VISUAL HELPERS
# ==========================================

def draw_text_center(surface, text, size, color, center_pos):
    """Draws centered text with a sharp black shadow."""
    font = get_font("consolas", size)
    t = font.render(str(text), True, color)
    r = t.get_rect(center=center_pos)
    s = font.render(str(text), True, (0,0,0))
    surface.blit(s, (r.x+2, r.y+2))
    surface.blit(t, r)

def draw_glow_text(surface, text, size, color, center_pos, glow_intensity=0):
    """Draws text cleanly with subtle tint."""
    font = get_font("consolas", size)
    rect = font.render(str(text), True, color).get_rect(center=center_pos)
    
    # 1. Shadow
    shadow_surf = font.render(str(text), True, (0, 0, 0))
    surface.blit(shadow_surf, (rect.x + 2, rect.y + 2))
        
    # 2. Main Text
    main_surf = font.render(str(text), True, color)
    surface.blit(main_surf, rect)
    
    # 3. White Core 
    core_surf = font.render(str(text), True, (255, 255, 255))
    core_surf.set_alpha(100)
    surface.blit(core_surf, rect)

def draw_cyber_box(surface, rect, color, fill_alpha=30):
    """Draws a clean tech box."""
    x, y, w, h = rect
    
    # Background Fill
    s = pygame.Surface((w, h), pygame.SRCALPHA)
    s.fill((*color, fill_alpha))
    surface.blit(s, (x, y))
    
    # Main Border
    pygame.draw.rect(surface, color, rect, 1)
    
    # Corner Brackets
    len_ = 20; thick = 3
    pts = [
        ((x, y), (x+len_, y)), ((x, y), (x, y+len_)),
        ((x+w, y), (x+w-len_, y)), ((x+w, y), (x+w, y+len_)),
        ((x, y+h), (x+len_, y+h)), ((x, y+h), (x, y+h-len_)),
        ((x+w, y+h), (x+w-len_, y+h)), ((x+w, y+h), (x+w, y+h-len_))
    ]
    for p1, p2 in pts:
        pygame.draw.line(surface, color, p1, p2, thick)
    
    # Tech Decor
    pygame.draw.rect(surface, color, (x + w//2 - 30, y-2, 60, 4)) 
    pygame.draw.rect(surface, color, (x + w//2 - 30, y+h-2, 60, 4)) 

def draw_progress_bar(surface, x, y, w, h, progress, color):
    pygame.draw.rect(surface, (30, 30, 40), (x, y, w, h))
    pygame.draw.rect(surface, (60, 60, 70), (x, y, w, h), 1)
    fill_w = int(w * max(0, min(1, progress)))
    if fill_w > 0:
        pygame.draw.rect(surface, color, (x, y, fill_w, h))
        pygame.draw.rect(surface, (255, 255, 255), (x, y, fill_w, 2))
        for i in range(20, fill_w, 20):
            pygame.draw.line(surface, (0, 0, 0), (x+i, y), (x+i, y+h), 1)

# --- SPECIAL FX: TARGET LOCK ---

def draw_target_lock(surface, cx, cy, color, radius=50, label=None):
    """Draws a rotating sci-fi crosshair."""
    time = pygame.time.get_ticks()
    angle_offset = time * 0.15 # Faster rotation for active input
    
    # Rotating Ring segments
    for i in range(0, 360, 90):
        rad_start = math.radians(i + angle_offset)
        rad_end = math.radians(i + 45 + angle_offset)
        rect = pygame.Rect(cx - radius, cy - radius, radius * 2, radius * 2)
        pygame.draw.arc(surface, color, rect, rad_start, rad_end, 3)

    # Pulsing Inner Bracket
    pulse = math.sin(time * 0.015) * 5
    inner_r = radius - 15 + pulse
    corner_len = 10
    
    pts = [
        ((cx - inner_r, cy - inner_r), (cx - inner_r + corner_len, cy - inner_r)),
        ((cx - inner_r, cy - inner_r), (cx - inner_r, cy - inner_r + corner_len)),
        ((cx + inner_r, cy + inner_r), (cx + inner_r - corner_len, cy + inner_r)),
        ((cx + inner_r, cy + inner_r), (cx + inner_r, cy + inner_r - corner_len)),
        ((cx - inner_r, cy + inner_r), (cx - inner_r + corner_len, cy + inner_r)),
        ((cx - inner_r, cy + inner_r), (cx - inner_r, cy + inner_r - corner_len)),
        ((cx + inner_r, cy - inner_r), (cx + inner_r - corner_len, cy - inner_r)),
        ((cx + inner_r, cy - inner_r), (cx + inner_r, cy - inner_r + corner_len))
    ]
    for p1, p2 in pts:
        pygame.draw.line(surface, (255, 255, 255), p1, p2, 2)

    # Center Cross
    pygame.draw.line(surface, color, (cx - 5, cy), (cx + 5, cy), 2)
    pygame.draw.line(surface, color, (cx, cy - 5), (cx, cy + 5), 2)
    
    if label:
        draw_glow_text(surface, label, 16, color, (cx, cy - radius - 15))


# --- 3D MOLE DRAWING HELPER ---
def draw_3d_mole(surface, center_x, center_y, is_active, color, label):
    """Draws a detailed 2.5D mole or image."""
    hole_w, hole_h = 110, 50
    mole_w, mole_h = 70, 80
    
    # 1. Back Rim
    hole_rect = pygame.Rect(center_x - hole_w//2, center_y - hole_h//2, hole_w, hole_h)
    pygame.draw.ellipse(surface, (20, 20, 25), hole_rect) 
    pygame.draw.arc(surface, (60, 70, 80), hole_rect, 0, math.pi, 2) 
    
    if is_active:
        pulse = math.sin(pygame.time.get_ticks() * 0.01) * 2
        rect_x = center_x - mole_w//2
        rect_y = center_y - mole_h + pulse
        
        mole_img = get_image("assets/tongtongtong.png", (mole_w + 40, mole_h + 40))
        if mole_img:
            surface.blit(mole_img, (center_x - mole_w//2 - 10, rect_y - 10))
        else:
            # 2.5D Mech Mole
            dark_col = (max(0, color[0]-50), max(0, color[1]-50), max(0, color[2]-50))
            pygame.draw.rect(surface, dark_col, (rect_x, rect_y, mole_w, mole_h))
            pygame.draw.rect(surface, color, (rect_x + 10, rect_y, mole_w - 20, mole_h))
            pygame.draw.ellipse(surface, color, (rect_x, rect_y - 15, mole_w, 30))
            pygame.draw.ellipse(surface, (255, 255, 255), (rect_x, rect_y - 15, mole_w, 30), 2)
            pygame.draw.rect(surface, (10, 10, 10), (center_x - 25, rect_y + 15, 50, 15)) 
            scanner_x = center_x - 20 + (pygame.time.get_ticks() // 5) % 40
            pygame.draw.rect(surface, (255, 0, 50), (scanner_x, rect_y + 18, 5, 8))
        
        # Target Lock Effect for Active Mole
        # draw_target_lock(surface, center_x, int(rect_y), color) # Optional: Remove if too cluttered
    
    # 5. Front Rim
    pygame.draw.arc(surface, color if is_active else (60, 70, 80), hole_rect, math.pi, 0, 3)
    draw_text_center(surface, label, 20, (150, 150, 150), (center_x, center_y + 40))


# ==========================================
#   SCENE RENDERERS
# ==========================================

def scene_waiting(screen):
    draw_glow_text(screen, "SYSTEM INITIALIZING...", 60, COLOR_GLOW, (WIDTH//2, HEIGHT//2-60))
    msg = f"SEARCHING UPLINK: {SERIAL_PORT}..."
    col = COLOR_DANGER
    if shared_state["connected"]:
        msg = "UPLINK ESTABLISHED"
        col = COLOR_P1
    if USE_SIMULATION: 
        msg = ":: SIMULATION PROTOCOL ::"
        col = COLOR_ACCENT
    draw_glow_text(screen, msg, 24, col, (WIDTH//2, HEIGHT//2+40))

def scene_hint(screen, data, data_mgr=None):
    if len(data) < 3: return
    game_id = data[0]
    titles = {'1':"TIC-TAC-TOE", '2':"REACTION GAME", '3':"WHAC-A-MOLE"}
    instructions = {
        '1': ["OBJECTIVE: ALIGN 3 (MAX 3 PIECES)", "CONTROLS: KNOB TO AIM, BUTTON TO FIRE"],
        '2': ["OBJECTIVE: STOP COUNTER AT TARGET", "CONTROLS: PRESS BUTTON TO LOCK VALUE"],
        '3': ["OBJECTIVE: NEUTRALIZE MOLES", "CONTROLS: PRESS BUTTONS 1-9"]
    }
    
    draw_cyber_box(screen, (WIDTH//2 - 350, 50, 700, 100), COLOR_ACCENT, 30)
    draw_glow_text(screen, titles.get(game_id, "UNKNOWN"), 50, COLOR_TEXT, (WIDTH//2, 100))
    
    lines = instructions.get(game_id, ["AWAITING DATA...", ""])
    draw_glow_text(screen, lines[0], 24, COLOR_INFO, (WIDTH//2, 180))
    draw_glow_text(screen, lines[1], 24, (150, 255, 150), (WIDTH//2, 215))
    
    p1_name = data_mgr.p1_name if data_mgr else "PLAYER 1"
    p2_name = data_mgr.p2_name if data_mgr else "PLAYER 2"
    
    # P1
    p1_ready = data[1] == '1'
    c1 = COLOR_P1 if p1_ready else COLOR_DIM
    draw_cyber_box(screen, (100, 300, 350, 250), c1, 40 if p1_ready else 10)
    draw_glow_text(screen, p1_name, 40, c1, (275, 360))
    status_txt = "READY" if p1_ready else "WAITING..."
    draw_glow_text(screen, status_txt, 24, c1, (275, 420))
    
    # P2
    p2_ready = data[2] == '1'
    c2 = COLOR_P2 if p2_ready else COLOR_DIM
    draw_cyber_box(screen, (WIDTH-450, 300, 350, 250), c2, 40 if p2_ready else 10)
    draw_glow_text(screen, p2_name, 40, c2, (WIDTH-275, 360))
    status_txt = "READY" if p2_ready else "WAITING..."
    draw_glow_text(screen, status_txt, 24, c2, (WIDTH-275, 420))

    pygame.draw.line(screen, COLOR_GRID, (WIDTH//2, 300), (WIDTH//2, 550), 2)

def scene_ttt(screen, data):
    if len(data) < 11: return
    bd, cp, win = data[0:9], data[9], data[10]
    cursor = int(data[11]) if len(data) > 11 else -1
    
    # --- 自動記錄贏家 (新增) ---
    if win in ['1', '2', '3']:
        _game_history['1'] = win

    info = f"TURN: P{cp}"
    col = COLOR_GLOW
    if win == '1': info, col = "VICTORY: PLAYER 1", COLOR_P1
    elif win == '2': info, col = "VICTORY: PLAYER 2", COLOR_P2
    elif win == '3': info, col = "MATCH DRAW", (255, 255, 0)
    
    draw_glow_text(screen, info, 50, col, (WIDTH//2, 60))
    
    sz, sx, sy = 450, (WIDTH-450)//2, 180
    cs = sz // 3
    
    # Draw Grid (Solid Lines)
    for i in range(1, 3):
        # Vertical
        pygame.draw.line(screen, COLOR_GRID, (sx + i*cs, sy), (sx + i*cs, sy + sz), 3)
        # Node effect
        for j in range(4):
            pygame.draw.circle(screen, COLOR_GLOW, (sx + i*cs, sy + j*cs), 4)

        # Horizontal
        pygame.draw.line(screen, COLOR_GRID, (sx, sy + i*cs), (sx + sz, sy + i*cs), 3)
        for j in range(4):
            pygame.draw.circle(screen, COLOR_GLOW, (sx + j*cs, sy + i*cs), 4)

    draw_cyber_box(screen, (sx-10, sy-10, sz+20, sz+20), col, 0)

    for i in range(9):
        cx, cy = sx + (i%3)*cs + cs//2, sy + (i//3)*cs + cs//2
        if i == cursor and win == '0':
            blink = (pygame.time.get_ticks() // 200) % 2
            if blink:
                draw_cyber_box(screen, (sx + (i%3)*cs + 5, sy + (i//3)*cs + 5, cs-10, cs-10), COLOR_CURSOR, 40)
        
        if bd[i] == '1': 
            pygame.draw.circle(screen, COLOR_P1, (cx, cy), 50, 6)
            pygame.draw.circle(screen, (200, 255, 200), (cx, cy), 54, 1) 
        elif bd[i] == '2': 
            off = 40
            pygame.draw.line(screen, COLOR_P2, (cx-off, cy-off), (cx+off, cy+off), 8)
            pygame.draw.line(screen, COLOR_P2, (cx+off, cy-off), (cx-off, cy+off), 8)
            pygame.draw.line(screen, (255, 200, 200), (cx-off, cy-off), (cx+off, cy+off), 2)
            pygame.draw.line(screen, (255, 200, 200), (cx+off, cy-off), (cx-off, cy+off), 2)

def scene_react(screen, data):
    if len(data) < 9: return
    tgt, p1v, p2v, p1s, p2s = data[0], data[1], data[2], data[7], data[8]


    try:
        if p1s == '2' and p2s == '2':
            t, v1, v2 = int(tgt), int(p1v), int(p2v)
            diff1, diff2 = abs(t-v1), abs(t-v2)
            if diff1 < diff2: _game_history['2'] = '1'
            elif diff2 < diff1: _game_history['2'] = '2'
            else: _game_history['2'] = '3'
    except:
        pass
    
    # Target Display HUD
    draw_cyber_box(screen, (WIDTH//2 - 200, 40, 400, 180), COLOR_ACCENT, 20)
    draw_glow_text(screen, "TARGET LOCK", 24, COLOR_ACCENT, (WIDTH//2, 80))
    draw_glow_text(screen, tgt, 120, COLOR_TEXT, (WIDTH//2, 150))
    
    def draw_hud(pid, state, val, x):
        c, status = COLOR_DIM, "STANDBY"
        is_active = (pid==1 and p1s=='1') or (pid==2 and p2s=='1')
        is_wait_start = (pid==1 and p1s=='0' and p2s=='0') or (pid==2 and p2s=='0' and p1s=='2')
        is_done = (pid==1 and p1s=='2') or (pid==2 and p2s=='2')
        
        if is_wait_start: c, status = COLOR_ACCENT, "PRESS START"
        elif is_active:   c, status = COLOR_GLOW, ">>> ROLLING <<<"
        elif is_done:     c, status = (COLOR_P1 if pid==1 else COLOR_P2), "LOCKED"
        
        # HUD Background
        draw_cyber_box(screen, (x, 300, 300, 300), c, 50 if is_active else 10)
        draw_glow_text(screen, f"PLAYER {pid}", 40, c, (x+150, 340))
        draw_glow_text(screen, status, 24, (200,200,200), (x+150, 390))
        
        # Glass Panel for Number
        pygame.draw.rect(screen, (0, 0, 0), (x+30, 420, 240, 120))
        pygame.draw.rect(screen, c, (x+30, 420, 240, 120), 2)
        draw_glow_text(screen, val, 100, (255,255,255), (x+150, 480))
        
        if is_done:
            try: diff = abs(int(tgt) - int(val))
            except: diff = 999
            draw_glow_text(screen, f"ERROR: {diff}", 28, c, (x+150, 560))

    draw_hud(1, p1s, p1v, 100)
    draw_hud(2, p2s, p2v, WIDTH-400)

def scene_wam(screen, data):

    if len(data) < 18: return


    if not hasattr(scene_wam, "last_inp"):
        scene_wam.last_inp = '0'       
        scene_wam.anim_end_time = 0     
        scene_wam.display_target = None


    s1, s2, inp, hit, miss = data[0], data[1], data[2], data[3], data[4]
    p1s, p2s, moles = data[7], data[8], data[9:18]


    try:
        if p2s == '2': 
             sc1, sc2 = int(s1), int(s2)
             if sc1 > sc2: _game_history['3'] = '1'
             elif sc2 > sc1: _game_history['3'] = '2'
             else: _game_history['3'] = '3'
    except: pass
    

    col_p1 = COLOR_P1 if p1s == '1' else COLOR_DIM
    col_p2 = COLOR_P2 if p2s == '1' else COLOR_DIM
    
    draw_glow_text(screen, f"P1: {s1}", 50, col_p1, (150, 50))
    draw_glow_text(screen, f"P2: {s2}", 50, col_p2, (WIDTH-150, 50))
    
    status = "INTERMISSION"
    if p1s=='0' and p2s=='0': status = "P1: PRESS BUTTON TO START"
    elif p1s=='1': status = "PLAYER 1 ENGAGED"
    elif p1s=='2' and p2s=='0': status = "P2: PRESS BUTTON TO START"
    elif p2s=='1': status = "PLAYER 2 ENGAGED"
    elif p2s=='2': status = "MISSION COMPLETE"
    draw_glow_text(screen, status, 28, COLOR_INFO, (WIDTH//2, 130))

    try: 
        max_t=24000.0
        cur=float(data[5])
        if(cur < 0): cur=0
        prog=cur/max_t
        sec=cur/4000.0
    except: 
        prog, sec = 0, 0.0
        
    draw_progress_bar(screen, WIDTH//2-200, 70, 400, 15, prog, COLOR_P1 if sec>10 else COLOR_DANGER)
    draw_glow_text(screen, f"{sec:.1f}s", 20, (200,200,200), (WIDTH//2, 95))


    grid_center_x = WIDTH // 2
    grid_center_y = HEIGHT // 2 + 100
    gap_x = 150
    gap_y = 80 
    
    # Draw Order: Back to Front (為了正確的遮擋關係)
    order = [0, 1, 2, 3, 4, 5, 6, 7, 8]
    
    for i in order:
        row = i // 3
        col = i % 3
        
        # Isometric Calculation
        off_x = (col - 1) * gap_x
        off_y = (row - 1) * gap_y
        cx = grid_center_x + off_x
        cy = grid_center_y + off_y
        
        is_mole = (moles[i] == '1')
        active_color = COLOR_P1 if p1s=='1' else COLOR_P2
        if p1s!='1' and p2s!='1': active_color = COLOR_DIM
        
        # Call 3D Drawing Function
        draw_3d_mole(screen, cx, cy, is_mole, active_color, str(i+1))


    current_time = pygame.time.get_ticks()


    if inp != '0' and inp != scene_wam.last_inp:
        scene_wam.anim_end_time = current_time + 500  
        scene_wam.display_target = inp      
    

    scene_wam.last_inp = inp


    if current_time < scene_wam.anim_end_time and scene_wam.display_target:
        try:
            target_val = scene_wam.display_target
            if target_val in [str(x) for x in range(1, 10)]:
                idx = int(target_val) - 1
                r = idx // 3
                c = idx % 3
                
                off_x = (c - 1) * gap_x
                off_y = (r - 1) * gap_y
                tx = grid_center_x + off_x
                ty = grid_center_y + off_y + 25 
                
                time_left = scene_wam.anim_end_time - current_time
                scale = 45 + (time_left / 500) * 10 
                
                draw_target_lock(screen, tx, ty, COLOR_CURSOR, radius=int(scale), label="INPUT")
        except:
            pass

    if hit=='1': 
        draw_glow_text(screen, "CRITICAL HIT!", 80, (0,255,0), (WIDTH//2, HEIGHT//2), 3)
    elif miss=='1': 
        draw_glow_text(screen, "MISS!", 80, (255,0,0), (WIDTH//2, HEIGHT//2), 3)

def scene_end(screen, data, data_mgr):
    if len(data)<3: return
    win, w1, w2 = data[0], data[1], data[2]
    
    draw_cyber_box(screen, (100, 150, WIDTH-200, 400), (255, 215, 0), 20)
    
    p1n = data_mgr.p1_name if data_mgr else "P1"
    p2n = data_mgr.p2_name if data_mgr else "P2"
    
    champ, cc = "DRAW MATCH", (200, 200, 200)
    if win == '1': champ, cc = f"VICTORY: {p1n}", COLOR_P1
    elif win == '2': champ, cc = f"VICTORY: {p2n}", COLOR_P2
    
    draw_glow_text(screen, "MISSION DEBRIEF", 50, (255,255,255), (WIDTH//2, 220))
    draw_glow_text(screen, champ, 80, cc, (WIDTH//2, 320))
    draw_glow_text(screen, f"{p1n}: {w1}  ||  {p2n}: {w2}", 30, COLOR_INFO, (WIDTH//2, 450))


    y_hist = 510
    headers = ["G1: TTT", "G2: REACT", "G3: WAM"]
    keys = ['1', '2', '3']
    
    for i in range(3):

        x_pos = WIDTH//2 + (i-1)*180 
        
        lbl = headers[i]
        winner_code = _game_history.get(keys[i], "-") 
        
        w_txt = "-"
        w_col = COLOR_DIM
        
        if winner_code == '1': 
            w_txt, w_col = "P1 WIN", COLOR_P1
        elif winner_code == '2': 
            w_txt, w_col = "P2 WIN", COLOR_P2
        elif winner_code == '3': 
            w_txt, w_col = "DRAW", (255, 255, 0)
        
        draw_glow_text(screen, lbl, 20, (200,200,200), (x_pos, y_hist))
        draw_glow_text(screen, w_txt, 30, w_col, (x_pos, y_hist + 30))