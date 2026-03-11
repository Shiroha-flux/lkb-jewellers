DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-evangeline',
    'Evangeline',
    'Evangeline - Oval 4 Claw Solitaire with Wrap Around Hidden Halo and Pave Band Engagement Ring',
    'Evangeline features a round solitaire held in a refined six-claw setting, complemented by a wrap-around hidden halo and a pavé band extending two-thirds of the way around. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'oval'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'pave'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-evangeline';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-evangeline-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/evangeline/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/evangeline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-evangeline-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/evangeline/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/evangeline/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-evangeline-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/evangeline/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/evangeline/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-evangeline-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-evangeline-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-evangeline-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-evangeline-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-evangeline-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-evangeline-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-evangeline-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-evangeline-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-evangeline-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-evangeline-size-0', 1, v_id, 'D'),
      ('ring-evangeline-size-1', 2, v_id, 'E'),
      ('ring-evangeline-size-2', 3, v_id, 'F'),
      ('ring-evangeline-size-3', 4, v_id, 'G'),
      ('ring-evangeline-size-4', 5, v_id, 'H'),
      ('ring-evangeline-size-5', 6, v_id, 'I'),
      ('ring-evangeline-size-6', 7, v_id, 'J'),
      ('ring-evangeline-size-7', 8, v_id, 'K'),
      ('ring-evangeline-size-8', 9, v_id, 'L'),
      ('ring-evangeline-size-9', 10, v_id, 'M'),
      ('ring-evangeline-size-10', 11, v_id, 'N'),
      ('ring-evangeline-size-11', 12, v_id, 'O'),
      ('ring-evangeline-size-12', 13, v_id, 'P'),
      ('ring-evangeline-size-13', 14, v_id, 'Q'),
      ('ring-evangeline-size-14', 15, v_id, 'R'),
      ('ring-evangeline-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-evangeline-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-eve',
    'Eve',
    'Eve - Marquise Claw Solitaire with Petal Gallery Engagement Ring',
    'The beautiful Eve engagement ring features a striking marquise cut centre stone held by six eagle-tipped claws within a beautiful petal-like setting. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'marquise'::enum_ring_shape,
    'solitaire'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-eve';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-eve-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/eve/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/eve/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-eve-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/eve/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/eve/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-eve-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/eve/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/eve/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-eve-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-eve-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-eve-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-eve-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-eve-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-eve-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-eve-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-eve-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-eve-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-eve-size-0', 1, v_id, 'D'),
      ('ring-eve-size-1', 2, v_id, 'E'),
      ('ring-eve-size-2', 3, v_id, 'F'),
      ('ring-eve-size-3', 4, v_id, 'G'),
      ('ring-eve-size-4', 5, v_id, 'H'),
      ('ring-eve-size-5', 6, v_id, 'I'),
      ('ring-eve-size-6', 7, v_id, 'J'),
      ('ring-eve-size-7', 8, v_id, 'K'),
      ('ring-eve-size-8', 9, v_id, 'L'),
      ('ring-eve-size-9', 10, v_id, 'M'),
      ('ring-eve-size-10', 11, v_id, 'N'),
      ('ring-eve-size-11', 12, v_id, 'O'),
      ('ring-eve-size-12', 13, v_id, 'P'),
      ('ring-eve-size-13', 14, v_id, 'Q'),
      ('ring-eve-size-14', 15, v_id, 'R'),
      ('ring-eve-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-eve-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-evelyn',
    'Evelyn',
    'Evelyn - Emerald 4 Claw Solitaire with East West Setting and Raised Basket Gallery Engagement Ring',
    'A signature east-west design, Evelyn modernises the timeless look of a solitaire ring by introducing directional appeal with a beautiful emerald cut stone set east-to-west on a polished band. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'emerald'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-evelyn';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-evelyn-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/evelyn/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/evelyn/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-evelyn-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/evelyn/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/evelyn/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-evelyn-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/evelyn/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/evelyn/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-evelyn-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-evelyn-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-evelyn-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-evelyn-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-evelyn-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-evelyn-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-evelyn-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-evelyn-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-evelyn-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-evelyn-size-0', 1, v_id, 'D'),
      ('ring-evelyn-size-1', 2, v_id, 'E'),
      ('ring-evelyn-size-2', 3, v_id, 'F'),
      ('ring-evelyn-size-3', 4, v_id, 'G'),
      ('ring-evelyn-size-4', 5, v_id, 'H'),
      ('ring-evelyn-size-5', 6, v_id, 'I'),
      ('ring-evelyn-size-6', 7, v_id, 'J'),
      ('ring-evelyn-size-7', 8, v_id, 'K'),
      ('ring-evelyn-size-8', 9, v_id, 'L'),
      ('ring-evelyn-size-9', 10, v_id, 'M'),
      ('ring-evelyn-size-10', 11, v_id, 'N'),
      ('ring-evelyn-size-11', 12, v_id, 'O'),
      ('ring-evelyn-size-12', 13, v_id, 'P'),
      ('ring-evelyn-size-13', 14, v_id, 'Q'),
      ('ring-evelyn-size-14', 15, v_id, 'R'),
      ('ring-evelyn-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-evelyn-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-everleigh',
    'Everleigh',
    'Everleigh - Elongated Cushion Bezel Solitaire with Hidden Halo and Cathedral Setting Engagement Ring',
    'Everleigh is a modern interpretation of the bezel design, encapsulating an elongated cushion-cut centre stone within a deep setting. A hidden pavé detail sits within the bezel, supported by a cathedral foundation for balanced structure. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'halo'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-everleigh';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-everleigh-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/everleigh/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/everleigh/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-everleigh-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/everleigh/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/everleigh/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-everleigh-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/everleigh/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/everleigh/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-everleigh-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-everleigh-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-everleigh-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-everleigh-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-everleigh-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-everleigh-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-everleigh-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-everleigh-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-everleigh-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-everleigh-size-0', 1, v_id, 'D'),
      ('ring-everleigh-size-1', 2, v_id, 'E'),
      ('ring-everleigh-size-2', 3, v_id, 'F'),
      ('ring-everleigh-size-3', 4, v_id, 'G'),
      ('ring-everleigh-size-4', 5, v_id, 'H'),
      ('ring-everleigh-size-5', 6, v_id, 'I'),
      ('ring-everleigh-size-6', 7, v_id, 'J'),
      ('ring-everleigh-size-7', 8, v_id, 'K'),
      ('ring-everleigh-size-8', 9, v_id, 'L'),
      ('ring-everleigh-size-9', 10, v_id, 'M'),
      ('ring-everleigh-size-10', 11, v_id, 'N'),
      ('ring-everleigh-size-11', 12, v_id, 'O'),
      ('ring-everleigh-size-12', 13, v_id, 'P'),
      ('ring-everleigh-size-13', 14, v_id, 'Q'),
      ('ring-everleigh-size-14', 15, v_id, 'R'),
      ('ring-everleigh-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-everleigh-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;

DO $$
DECLARE v_id UUID;
BEGIN
  INSERT INTO engagement_rings (slug, name, title, description, base_price_usd, currency, shape, setting_style, band_type, setting_profile)
  VALUES (
    'ring-fiona',
    'Fiona',
    'Fiona - Elongated Cushion East West Claw Solitaire with Raised Basket Gallery Engagement Ring',
    'Fiona is an east–west set elongated cushion-cut centre stone positioned low within a scooped basket. The setting allows the profile to sit flush against a classic band, creating a clean, understated design with smooth, continuous lines. Schedule an appointment with Cullen US today.',
    1500,
    'USD',
    'elongated_cushion'::enum_ring_shape,
    'east_west'::enum_ring_setting_style,
    'plain'::enum_ring_band_type,
    'high_set'::enum_ring_setting_profile
  )
  ON CONFLICT (slug) DO NOTHING
  RETURNING id INTO v_id;

  IF v_id IS NULL THEN
    SELECT id INTO v_id FROM engagement_rings WHERE slug = 'ring-fiona';
  END IF;

  IF v_id IS NOT NULL THEN
    INSERT INTO engagement_ring_images (id, _order, _parent_id, image_url, thumbnail_url) VALUES
      ('ring-fiona-img-0', 1, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/fiona/renders/2ct/High%20Setting/Yellow/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/fiona/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-fiona-img-1', 2, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/fiona/renders/2ct/High%20Setting/White/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/fiona/renders/2ct/High%20Setting/Yellow/default'),
      ('ring-fiona-img-2', 3, v_id, 'https://media.cullenjewellery.com/cdn-cgi/image/width=800,height=800/products/rings/fiona/renders/2ct/High%20Setting/Rose/default', 'https://media.cullenjewellery.com/cdn-cgi/image/width=200,height=200/products/rings/fiona/renders/2ct/High%20Setting/Yellow/default')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_metal_options (id, _order, _parent_id, value, label) VALUES
      ('ring-fiona-metal-0', 1, v_id, 'Platinum', 'Platinum'),
      ('ring-fiona-metal-1', 2, v_id, '18k Yellow Gold', '18k Yellow Gold'),
      ('ring-fiona-metal-2', 3, v_id, '18k Rose Gold', '18k Rose Gold'),
      ('ring-fiona-metal-3', 4, v_id, '18k White Gold', '18k White Gold')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_setting_options (id, _order, _parent_id, value, label) VALUES
      ('ring-fiona-setting-0', 1, v_id, 'High Setting', 'High Setting'),
      ('ring-fiona-setting-1', 2, v_id, 'Low Setting', 'Low Setting')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_side_stone_options (id, _order, _parent_id, value, label) VALUES
      ('ring-fiona-stone-0', 1, v_id, 'Lab Grown Diamond', 'Lab Grown Diamond'),
      ('ring-fiona-stone-1', 2, v_id, 'Moissanite', 'Moissanite'),
      ('ring-fiona-stone-2', 3, v_id, 'Natural Diamond', 'Natural Diamond')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_sizes (id, _order, _parent_id, size) VALUES
      ('ring-fiona-size-0', 1, v_id, 'D'),
      ('ring-fiona-size-1', 2, v_id, 'E'),
      ('ring-fiona-size-2', 3, v_id, 'F'),
      ('ring-fiona-size-3', 4, v_id, 'G'),
      ('ring-fiona-size-4', 5, v_id, 'H'),
      ('ring-fiona-size-5', 6, v_id, 'I'),
      ('ring-fiona-size-6', 7, v_id, 'J'),
      ('ring-fiona-size-7', 8, v_id, 'K'),
      ('ring-fiona-size-8', 9, v_id, 'L'),
      ('ring-fiona-size-9', 10, v_id, 'M'),
      ('ring-fiona-size-10', 11, v_id, 'N'),
      ('ring-fiona-size-11', 12, v_id, 'O'),
      ('ring-fiona-size-12', 13, v_id, 'P'),
      ('ring-fiona-size-13', 14, v_id, 'Q'),
      ('ring-fiona-size-14', 15, v_id, 'R'),
      ('ring-fiona-size-15', 16, v_id, 'S')
    ON CONFLICT (id) DO NOTHING;

    INSERT INTO engagement_ring_specs (id, ring_id, band_width, avg_side_stones, center_stone_size, claw_count, estimated_weight, resizable)
    VALUES (
      'ring-fiona-specs',
      v_id,
      '1.5mm',
      '16',
      '6.5 x 4.5mm',
      NULL,
      '2.8g',
      true
    )
    ON CONFLICT (ring_id) DO NOTHING;
  END IF;
END $$;