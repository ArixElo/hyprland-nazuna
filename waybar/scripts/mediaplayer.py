#!/usr/bin/env python3
import sys
import json
import subprocess

def get_player_status():
    try:
        # Try to get list of players first
        players = subprocess.check_output(
            ['playerctl', '-l'],
            stderr=subprocess.DEVNULL
        ).decode('utf-8').strip().split('\n')
        
        if not players or players == ['']:
            print(json.dumps({"text": "", "class": "stopped"}))
            return
        
        # Find the first playing/paused player
        active_player = None
        for player in players:
            try:
                status = subprocess.check_output(
                    ['playerctl', '-p', player, 'status'],
                    stderr=subprocess.DEVNULL
                ).decode('utf-8').strip()
                if status in ['Playing', 'Paused']:
                    active_player = player
                    break
            except:
                continue
        
        if not active_player:
            print(json.dumps({"text": "", "class": "stopped"}))
            return
        
        # Get the player status
        status = subprocess.check_output(
            ['playerctl', '-p', active_player, 'status'],
            stderr=subprocess.DEVNULL
        ).decode('utf-8').strip()
        
        # Get metadata
        artist = subprocess.check_output(
            ['playerctl', '-p', active_player, 'metadata', 'artist'],
            stderr=subprocess.DEVNULL
        ).decode('utf-8').strip()
        
        title = subprocess.check_output(
            ['playerctl', '-p', active_player, 'metadata', 'title'],
            stderr=subprocess.DEVNULL
        ).decode('utf-8').strip()
        
        # Try to get player name, but don't fail if it's not available
        try:
            player = subprocess.check_output(
                ['playerctl', '-p', active_player, 'metadata', 'playerName'],
                stderr=subprocess.DEVNULL
            ).decode('utf-8').strip().lower()
        except:
            player = active_player.split('.')[0]  # Use first part of player instance name
        
        # Get position and length for tooltip
        try:
            position_ms = int(subprocess.check_output(
                ['playerctl', '-p', active_player, 'position'],
                stderr=subprocess.DEVNULL
            ).decode('utf-8').strip().split('.')[0]) * 1000000  # Convert to microseconds
            
            length_ms = int(subprocess.check_output(
                ['playerctl', '-p', active_player, 'metadata', 'mpris:length'],
                stderr=subprocess.DEVNULL
            ).decode('utf-8').strip())
            
            # Convert to minutes:seconds
            position_sec = position_ms // 1000000
            length_sec = length_ms // 1000000
            
            position_str = f"{position_sec // 60}:{position_sec % 60:02d}"
            length_str = f"{length_sec // 60}:{length_sec % 60:02d}"
            
            time_info = f" [{position_str}/{length_str}]"
        except:
            time_info = ""
        
        # Format the output
        if status == "Playing":
            text = f"{artist} - {title}"
        elif status == "Paused":
            text = f" {artist} - {title}"
        else:
            text = ""
        
        # Truncate if too long
        if len(text) > 35:
            text = text[:32] + "..."
        
        output = {
            "text": text,
            "tooltip": f"{player.capitalize()}: {artist} - {title}{time_info}",
            "alt": player,
            "class": status.lower()
        }
        
        print(json.dumps(output))
        
    except subprocess.CalledProcessError:
        # No player running
        print(json.dumps({"text": "", "class": "stopped"}))
    except Exception as e:
        print(json.dumps({"text": "", "class": "error"}))

if __name__ == "__main__":
    get_player_status()
