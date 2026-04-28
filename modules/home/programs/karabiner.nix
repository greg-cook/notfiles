{ ... }:

{
  home.file.".config/karabiner/karabiner.json".text = builtins.toJSON {
    profiles = [
      {
        name = "Default profile";
        selected = true;
        complex_modifications = {
          rules = [
            {
              description = "Map Caps -> Esc (when alone), L_Ctrl (when chorded)";
              manipulators = [
                {
                  description = "Map Caps -> Esc (when alone), L_Ctrl (when chorded)";
                  from = {
                    key_code = "caps_lock";
                    modifiers.optional = [ "any" ];
                  };
                  to = [ { key_code = "left_control"; lazy = true; } ];
                  to_if_alone = [ { key_code = "escape"; } ];
                  type = "basic";
                }
              ];
            }
          ];
        };
        devices = [
          {
            identifiers = {
              is_keyboard = true;
              is_pointing_device = true;
              product_id = 65278;
              vendor_id = 3141;
            };
            ignore = false;
            ignore_vendor_events = true;
          }
          {
            identifiers = {
              is_pointing_device = true;
              product_id = 45093;
              vendor_id = 1133;
            };
            ignore = false;
            mouse_flip_vertical_wheel = true;
          }
        ];
        virtual_hid_keyboard.keyboard_type_v2 = "ansi";
      }
    ];
  };
}
