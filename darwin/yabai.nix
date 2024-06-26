 {
  enable = true;

  config = {
    mouse_follows_focus = "off";
    focus_follows_mouse = "autoraise";
    window_origin_display = "default";
    window_placement = "second_child";
    window_zoom_persist = "on";
    window_topmost = "off";
    window_shadow = "on";
    window_animation_duration = 0.1;
    window_animation_frame_rate = 120;
    window_opacity_duration = 0.0;
    active_window_opacity = 1.0;
    normal_window_opacity = 0.95;
    window_opacity = "on";
    insert_feedback_color = "0xffd75f5f";
    active_window_border_color = "0xff775759";
    normal_window_border_color = "0xff555555";
    window_border_width = 4;
    window_border_radius = 12;
    window_border_blur = "on";
    window_border_hidpi = "on";
    window_border = "off";
    split_ratio = 0.50;
    split_type = "auto";
    auto_balance = "on";
    top_padding = 5;
    bottom_padding = 5;
    left_padding = 5;
    right_padding = 5;
    window_gap = 06;
    layout = "bsp";
    mouse_modifier = "fn";
    mouse_action = "move";
    mouse_drop_action = "swap";
  };

  extraConfig = ''
    yabai -m rule --add app='Pop' manage=off sticky=on layer=above
    yabai -m rule --add app='System Settings' manage=off  sticky=on layer=above
  '';
}
